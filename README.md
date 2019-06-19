# StudentManager
SSM框架+oracle数据库做的学生信息管理系统

管理员可登录后台对学生信息、课程信息、学生选课信息进行管理，学生可登录前台查看修改个人信息、选修课程、查看已通过管理员审核的课程

主要功能：

1、三层架构：使用SSM，就是springmvc+spring+mybatis作为基本的架构 <br>
2、数据源采用阿里巴巴Druid连接池，可以开启监控数据库访问性能，统计SQL执行的面板，并包含数据库密码加密技术 <br>
3、持久层使用mybatis框架 <br>
4、日志采用log4j进行日志管理 <br>
5、使用自定义的NavigationTag分页工具 <br>
6、拦截器，数据校验
