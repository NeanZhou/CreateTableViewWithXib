# CreateTableViewWithXib

> 自学iOS开发一段时间了，这也是第一次使用GitHub，有很多不足之处还希望大家给以指导和帮助。
>
> 学iOS开发完全是因兴趣，发现还是挺有趣，尤其当自己解决了难题的时候，相当兴奋~    

本实例项目使用segment来切换多个tableView  

<br>

### 重点推荐：NEANTableView

通过NEANTableView来创建诸如账号、密码、信息邮箱等的输入窗口，轻松在xib中布局cell，告别繁琐的代码和数据源设置；

简单基本，就能创建出想要的输入窗口。

<br>

*如果您觉得好用，请给予支持，也可以分享给朋友哦，希望NEANTableView能给大家带来便利！*

----

### 一、 NEANTableView简介

由于正在开发自己的第一个项目，遇到很多难题。于是研究封装了这个TableView:`NEANTableVIew`；使用NEANTableView，能方便的创建输入窗口，应该能满足基本的使用需求。

* 通过简单的配置，方便地用NEANTableView来构建[信息、账号、密码、邮箱]等各种输入窗口；
* 轻松在xib中配置tableView、添加cell、配置cell等操作；告别繁琐的代码和数据源代理；
* 简单几步就能创建想要的输入窗口。
* 例如：

~~~objective-c
// 创建tableView， xib中第3和第0个cell作为tableView的cell
NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@3, @0, nil];
NEANTableView *tableView = [NEANTableView tableViewWithCellsIndexArray:arr1 width:w]; 
// width: tableView的宽度
~~~

<br>

### 二、 使用方法

1. 将NEANTableView文件夹放入项目目录；
2. 在xib中配置tableView和添加、设置cell等操作。
3. 控制器中导入NEANTableView.h；(具体使用方法注释于NEANTableView.h中)

<br>

### 三、 特性

1. 告别繁琐的代码和数据源代理；
2. 直接在xib中配置tableView；
3. 直接在xib中添加并配置cell，注意设置identifier以及适配布局；
4. 默认tableView不可滚动；
5. 默认tableView的高度由cell的高度以及个数决定,即高度 = (cell高度 * cell个数)，最高为屏幕高度；
6. 点击cell任意位置，cell内的textField自动响应；
7. 提供了获取指定cell中的textField的方法，从而轻松得到相应textField中的值。

----

<br>

`ViewOnMyGitHub:`[CreateTableViewWithXib](https://github.com/NeanZhou/CreateTableViewWithXib)

> 算是正式跨界进入iOS开发啦，希望大家多给点指导，帮助我进步，谢谢