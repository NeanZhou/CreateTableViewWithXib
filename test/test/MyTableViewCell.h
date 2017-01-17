//
//  MyTableViewCell.h
//  test
//
//  Created by Nean on 2017/1/16.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

/** 创建MyTableViewCell
 *
 *  index: xib中tableViewCell所在的顺序
 *  注意:   传入的index为NSString形式(通常使用数组保存index)
 *
 */
+ (instancetype)cellWithIndex:(NSString *)index;

// 获得cell自己中的textField
- (UITextField *)getTextFiled;

@end
