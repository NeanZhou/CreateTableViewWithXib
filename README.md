# ChangeTableViewsWithSegment
使用segment来切换多个tableView，可分别通过Xib自定义tableView和cell。

------



> 自学iOS开发一段时间了，这也是第一次使用GitHub，所以有很多不足之处还希望大神们给予指导和帮助。
>
> 学iOS开发完全是因兴趣，发现还是挺有趣，尤其是当自己琢磨出一些东西来的时候，是相当兴奋的~



### 一、 项目简介

这是根据需要自己研究出来的，能简化segment切换不同的tableView的方式，轻松根据需要创建多个tableView并通过segment来切换。

### 二、 MyTableView

1. 通过xib来定义tableView外观.

```objective-c
/** 创建MyTableView
 *
 *  index: xib中tableView所在的顺序
 *  owner: xib的File's owner;
 *
 */
+ (instancetype)tableViewWithIndex:(NSInteger)index owner:(id)owner width:(CGFloat)width;
```

2. 轻松获取tableView中指定cell的textField

```objective-c
- (UITextField *)getTextFieldWithRow:(NSInteger)row inSection:(NSInteger)section;
```

### 三、 MyTableViewCell

1. 通过xib来定义cell的外观

```objective-c
/** 创建MyTableViewCell
 *
 *  index: xib中tableViewCell所在的顺序
 *  注意:   传入的index为NSString形式(通常使用数组保存index)
 *
 */
+ (instancetype)cellWithIndex:(NSString *)index;
```

2. 轻松获取cell中的textField

```objective-c
- (UITextField *)getTextFiled;
```



------

> 第一次的小项目基本就是这样了，希望大神们多给点指导，帮助我进步~谢谢！