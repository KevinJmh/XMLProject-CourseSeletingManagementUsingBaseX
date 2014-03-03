XMLProject-CourseSeletingManagementUsingBaseX
=============================================

need BaseX

运行网页时需要将baseX中断开与数据库的连接；(因为baseX的UI和浏览器不能同时连接到数据库)
使用wamp的话要修改php.ini:
打开extension=php_sockets.dll 扩展，
然后重启服务器。
