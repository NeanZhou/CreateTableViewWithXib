//
//  Introduction.h
//  test
//
//  Created by Nean on 2017/1/19.
//  Copyright © 2017年 Nean. All rights reserved.
//

#ifndef Introduction_h
#define Introduction_h


#endif /* Introduction_h */

/** 用途、特性及使用方法
 *
 *  一、 用途：
 *      通过简单的配置，方便地用tableView来构建[信息、账号、密码、邮箱]等各种输入窗口；
 *      轻松在xib中配置tableView、添加cell、配置cell等操作；
 *      轻松按自己指定的顺序取出xib中的cell。
 *
 *  二、 使用方法：
 *      1. 将NEANTableView文件夹放入项目目录；
 *      2. 在xib中配置tableView和cell。
 *      3. 控制器中导入NEANTableView.h；(具体使用方法注释于NEANTableView.h中)
 *
 *  三、 特性
 *      1. 直接在xib中配置tableView；
 *      2. 直接在xib中添加、配置cell，注意设置identifier以及适配布局；
 *      3. 默认tableView不可滚动；
 *      4. 默认tableView的高度由cell的高度以及个数决定,即高度 = (cell高度 * cell个数)，最高为屏幕高度；
 *      5. 点击cell任意位置，cell内的textField自动响应；
 *      6. 提供了获取指定cell中的textField的方法，从而轻松得到textField中的值。
 *
 */
