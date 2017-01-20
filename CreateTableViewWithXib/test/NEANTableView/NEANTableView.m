//
//  NEANTableView.m
//  test
//
//  Created by Nean on 2017/1/17.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import "NEANTableView.h"
#import "NEANTableViewCell.h"

@interface NEANTableView ()

@property (strong, nonatomic) NSMutableArray *arrObj;                 // 记录获取cell顺序的数组
@property (strong, nonatomic) NSMutableArray *arrWithCell;            // 存放cell的数组
@property (strong, nonatomic) NSMutableArray *arrWithCellIdentifier;  // 存放CellIdentifier的数组

@end

@implementation NEANTableView

#pragma mark - loadDate
// 懒加载arrWithCell
- (NSMutableArray *)arrWithCell {
    
    if (_arrWithCell == nil) {
        _arrWithCell = [NSMutableArray array];

        // 创建_arrObj中对应顺序的cell和CellIdentifier，
        // 分别放入_arrWithCell和_arrWithCellIdentifier中，
        for (NSString *str in _arrObj) {
            NEANTableViewCell *cell = [NEANTableViewCell cellWithIndex:str];
            NSString *CellIdentifier = cell.reuseIdentifier;
            
            [_arrWithCell addObject:cell];
            [self.arrWithCellIdentifier addObject:CellIdentifier];
        }
    }
    return _arrWithCell;
}

// 懒加载arrWithCellIdentifier
- (NSMutableArray *)arrWithCellIdentifier {
    if (_arrWithCellIdentifier == nil) {
        _arrWithCellIdentifier = [NSMutableArray array];
    }
    return _arrWithCellIdentifier;
}

#pragma mark - initialTableView
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
 
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self setUp];
    }
    return self;
    
}

// 自定义NEANTableView样式
- (void)setUp {
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.layer.borderWidth = 0.3;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.scrollEnabled = NO;
}

#pragma mark - methods
+ (instancetype)tableViewWithCellsIndexArray:(NSMutableArray *)array width:(CGFloat)width {
    
    NEANTableView *tableView = [[[NSBundle mainBundle] loadNibNamed:@"NEANTableView" owner:self options:nil] objectAtIndex:0];
    tableView.arrObj = array;
    tableView.delegate = tableView;
    tableView.dataSource = tableView;
    
    CGFloat w = width;
    CGFloat h = 0;
    for (NEANTableViewCell *cell in tableView.arrWithCell) {
        // 如果高度h大于屏幕高度，则 h = 屏幕高度，同时tableView可滚动。
        if (h < [UIScreen mainScreen].bounds.size.height) {
            h = cell.bounds.size.height + h;
        }else{
            h = [UIScreen mainScreen].bounds.size.height;
            tableView.scrollEnabled = YES;
        }
    }
    tableView.frame = CGRectMake(0, 0, w, h);
    return tableView;
}

// 获取tableView自己中对应section的row的cell中的textField
- (UITextField *)getTextFieldWithRow:(NSInteger)row inSection:(NSInteger)section {
    
    UITextField *textField = [[UITextField alloc] init];
    NSIndexPath *indexP = [NSIndexPath indexPathForRow:row inSection:section];
    UITableViewCell *cell = [self cellForRowAtIndexPath:indexP];
    for (id obj in cell.contentView.subviews) {
        if ([obj isKindOfClass:[UITextField class]]) {
            textField = obj;
        }
    }
    return textField;
}

- (NSArray *)getTextFields {
    NSMutableArray *arrM = [NSMutableArray array];
    for (UITableViewCell *cell in self.arrWithCell) {
        for (id obj in cell.contentView.subviews) {
            if ([obj isKindOfClass:[UITextField class]]) {
                [arrM addObject:obj];
            }
        }
    }
    NSArray *array = arrM;
    return array;
}

#pragma mark - tableViewDelegate&dateSource
// 设置行高，为xib中cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NEANTableViewCell *cell = self.arrWithCell[indexPath.row];
    return cell.bounds.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrWithCell.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = _arrWithCellIdentifier[indexPath.row];
    NEANTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = self.arrWithCell[indexPath.row];
    }
    return cell;
}

// 点击cell时使当前cell中的textField成为第一响应者。
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NEANTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UITextField *textField = [cell getTextFiled];
    [textField becomeFirstResponder];
}

// 滚动时收起键盘
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self endEditing:YES];
}

@end
