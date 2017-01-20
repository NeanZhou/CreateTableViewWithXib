//
//  NZTableViewCell.m
//  test
//
//  Created by Nean on 2017/1/16.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import "NZTableViewCell.h"

@implementation NZTableViewCell

#pragma mark - initialTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
    }
    return self;
}

// 自定义NZTableViewCell外观样式
- (void)setUp
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - Methods
+ (instancetype)cellWithIndex:(NSString *)index {
    
    NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"NZTableViewCell" owner:nil options:nil];
    int i = [index intValue];
    NZTableViewCell *cell = cellArray[i];
    return cell;
}

// 获得cell自己中的textField
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
