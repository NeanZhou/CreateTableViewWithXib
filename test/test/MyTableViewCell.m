//
//  MyTableViewCell.m
//  test
//
//  Created by Nean on 2017/1/16.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

// 自定义myTableViewCell外观样式
- (void)setUp
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+ (instancetype)cellWithIndex:(NSString *)index {
    NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:nil options:nil];
    int i = [index intValue];
    MyTableViewCell *cell = cellArray[i];
    return cell;
}

- (UITextField *)getTextFiled {
    UITextField *textField = [[UITextField alloc] init];
    for (id obj in self.contentView.subviews) {
        if ([obj isKindOfClass:[UITextField class]]) {
            textField = obj;
        }
    }
    return textField;
}

@end
