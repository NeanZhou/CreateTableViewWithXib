//
//  NZTableViewCell.h
//  test
//
//  Created by Nean on 2017/1/16.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZTableViewCell : UITableViewCell

/** 创建NZTableViewCell **
 *
 *  index: xib中tableViewCell所在的顺序
 *
 *  注意:   1. 传入的index为NSString形式(通常使用数组保存);
 *  注意:   2. 记得在xib中设置cell的identifier，以便复用;
 *
 */
+ (instancetype)cellWithIndex:(NSString *)index;

// 获得cell自己当中的textField
- (UITextField *)getTextFiled;

@end
