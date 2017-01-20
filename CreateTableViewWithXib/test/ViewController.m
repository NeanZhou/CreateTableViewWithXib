//
//  ViewController.m
//  test
//
//  Created by Nean on 2017/1/16.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import "ViewController.h"
#import "NEANTableView.h"

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

// 用来显示tableView的view(便于布局)
@property (weak, nonatomic) IBOutlet UIView                 *mainView;

@property (weak, nonatomic) IBOutlet UISegmentedControl     *choseSegment;
@property (weak, nonatomic) IBOutlet UIButton               *calButton;

// tableView
@property (weak, nonatomic)          NEANTableView          *tableView1;
@property (weak, nonatomic)          NEANTableView          *tableView2;

@end

@implementation ViewController

#pragma mark - LifeCycle
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
    CGFloat y = _tableView1.bounds.size.height + 50;
    _calButton.center = CGPointMake(x, y);
}

// 创建tableView
- (void)creatTableView
{
    CGFloat w = _mainView.frame.size.width;
    
    // 创建tableView， xib中第1和第2个cell作为tableView的cell
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@0, @3, nil];
    _tableView1 = [NEANTableView tableViewWithCellsIndexArray:arr1 width:w];
    
    // 创建tableView， xib中第3和第4个cell作为tableView的cell
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@2, @1, nil];
    _tableView2 = [NEANTableView tableViewWithCellsIndexArray:arr2 width:w];

    _tableView1.tag = 0;
    _tableView2.tag = 1;
    _tableView2.hidden = YES;
    
    [_mainView addSubview:_tableView1];
    [_mainView addSubview:_tableView2];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - 按钮点击
// 计算按钮
- (IBAction)click:(UIButton *)sender {
    NSString *alertMessage;
        switch (_choseSegment.selectedSegmentIndex) {
        case 0:
        {
            // 使用 [-(NSArray *)getTextFields] 方法获取textField
            NSArray *arr = [_tableView1 getTextFields];
            UITextField *textField1 = arr[0];
            UITextField *textField2 = arr[1];
            alertMessage = [NSString stringWithFormat:@"账号是：%@\n密码是：%@", textField1.text, textField2.text];
        }
            break;
        case 1:
        {
            // 使用 [-(UITextField *)getTextFieldWithRow: inSection:] 获取textField
            UITextField *textField1 = [_tableView2 getTextFieldWithRow:0 inSection:0];
            UITextField *textField2 = [_tableView2 getTextFieldWithRow:1 inSection:0];
            alertMessage = [NSString stringWithFormat:@"邮箱是：%@\n手机是：%@", textField1.text, textField2.text];
        }
            break;
    }
    
    // 弹出提示框
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"你好" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Thanks!" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}

// segmentControl
- (IBAction)choseView:(UISegmentedControl *)sender {
    CGFloat x = _mainView.frame.size.width / 2;
    CGFloat y;
    switch (sender.selectedSegmentIndex) {
        case 0:
            _tableView1.hidden = NO;
            _tableView2.hidden = YES;
            y = _tableView1.bounds.size.height + 50;
            _calButton.center = CGPointMake(x, y);
            [self.view endEditing:YES];
            break;
        case 1:
            _tableView1.hidden = YES;
            _tableView2.hidden = NO;
            y = _tableView2.bounds.size.height + 50;
            _calButton.center = CGPointMake(x, y);
            [self.view endEditing:YES];
            break;
    }
}

@end
