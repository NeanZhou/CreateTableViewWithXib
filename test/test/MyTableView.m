//
//  MyTableView.m
//  test
//
//  Created by Nean on 2017/1/17.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

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

// 自定义MyTableView样式
- (void)setUp {
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.layer.borderWidth = 0.3;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.scrollEnabled = NO;
}

+ (instancetype)tableViewObjectAtIndex:(NSInteger)index owner:(id)owner width:(CGFloat)width {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MyTableView" owner:owner options:nil];
    MyTableView *tableView = array[index];
    CGFloat w = width;
    CGFloat h =tableView.bounds.size.height;
    tableView.frame = CGRectMake(0, 0, w, h);
    
    return tableView;
}

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

@end
