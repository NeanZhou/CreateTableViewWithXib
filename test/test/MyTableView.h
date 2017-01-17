//
//  MyTableView.h
//  test
//
//  Created by Nean on 2017/1/17.
//  Copyright © 2017年 Nean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableView : UITableView

/** 创建MyTableView
 *
 *  index: xib中tableView所在的顺序
 *  owner: xib的File's owner;
 *
 */
+ (instancetype)tableViewWithIndex:(NSInteger)index owner:(id)owner width:(CGFloat)width;

// 获取tableView自己中对应section的row的cell中的textField
- (UITextField *)getTextFieldWithRow:(NSInteger)row inSection:(NSInteger)section;

@end
