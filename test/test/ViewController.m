//
//  ViewController.m
//  test
//
//  Created by Nean on 2017/1/16.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import "ViewController.h"
#import "MyTableView.h"
#import "MyTableViewCell.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

// 设置cell的高度
#define CELLHEIGHT 44

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

// 用来显示tableView的view(便于布局)
@property (weak, nonatomic) IBOutlet UIView                 *mainView;
@property (weak, nonatomic) IBOutlet UISegmentedControl     *choseSegment;
@property (weak, nonatomic) IBOutlet UIButton               *calButton;

// tableView
@property (weak, nonatomic)          MyTableView            *tableView1;
@property (weak, nonatomic)          MyTableView            *tableView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self creatTableView];
    [self setUpMainView];
}

#pragma mark - 配置界面
// 初始化计算按钮位置
- (void)setUpMainView
{
    CGFloat x = _mainView.frame.size.width / 2;
    CGFloat y = CELLHEIGHT * 2 +50;
    _calButton.center = CGPointMake(x, y);
}

// 创建tableView
- (void)creatTableView
{
    CGFloat w = _mainView.frame.size.width;
    _tableView1 = [MyTableView tableViewObjectAtIndex:0 owner:self width:w];
    _tableView2 = [MyTableView tableViewObjectAtIndex:1 owner:self width:w];
    _tableView2.hidden = YES;
    
    [_mainView addSubview:_tableView1];
    [_mainView addSubview:_tableView2];

}

#pragma mark - 按钮点击
// 计算按钮
- (IBAction)click:(UIButton *)sender {

    switch (_choseSegment.selectedSegmentIndex) {
        case 0:
        {
            UITextField *textField = [_tableView1 getTextFieldWithRow:0 inSection:0];
            NSLog(@"%@",textField.text);
        }
            break;
        case 1:
        {
            UITextField *textField = [_tableView2 getTextFieldWithRow:1 inSection:0];
            NSLog(@"%@",textField.text);
        }
            break;
    }
}
// segmentControl
- (IBAction)choseView:(UISegmentedControl *)sender {
    CGFloat x = _mainView.frame.size.width / 2;
    CGFloat y = CELLHEIGHT * 2 +50;
    switch (sender.selectedSegmentIndex) {
        case 0:
            _tableView1.hidden = NO;
            _tableView2.hidden = YES;
            _calButton.center = CGPointMake(x, y);
            break;
        case 1:
            _tableView1.hidden = YES;
            _tableView2.hidden = NO;
            _calButton.center = CGPointMake(x, y + CELLHEIGHT);
            break;
    }
}


#pragma mark - tableViewDelegate&dateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 0) {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr1 = @[@3, @1,];
    NSArray *arr2 = @[@0, @3, @2];
    MyTableViewCell *cell = [[MyTableViewCell alloc] init];
    if (tableView.tag == 0) {
        cell = [MyTableViewCell cellWithIndex:arr1[indexPath.row]];
    }else {
        cell = [MyTableViewCell cellWithIndex:arr2[indexPath.row]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UITextField *textField = [cell getTextFiled];
    [textField becomeFirstResponder];
     
}


@end
