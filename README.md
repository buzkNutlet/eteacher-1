# eteacher
UP teaching assistant

系统运行环境
JDK:1.7
tomcat:7.0
数据库：mysql 5.5

项目框架
后台：springMVC  + hibernate
前台：JQuery   , JQuery  Form Validator, 基于Bootstrap的table控件，freeMarker

更新日志

2016.10.8-2016.10.14
1. 修改数据表结构。详见《数据库说明文档》
2. 修复受损功能：获取学期列表。
3. 新增功能：获取职称的下拉列表。
4. 添加TermPrivate表对应的操作基类。

2016.10.17-2016.10.21
1. 完成教师自定义字典项的增删查操作；
2. 增加职称、职务、课程成绩组成项的弹窗效果；

2016.10.24-2016.10.28
1. 登录
2. 注册
3. 找回密码
4. 忘记密码
5. 记住登录状态
6. 退出登录
7. 封装API调用的方法。
8. 封装页面跳转方法。
9. 获取作业列表（已到期、已发布、待发布）
10. 删除作业
11. 作业状态的修改
12. 获取未发布的通知列表
13. 新增作业。
14. 查看作业详情。
15. 作业编辑页面样式及按钮点击效果（JQuery）

2016.10.31-2016.11.04
李小飞：
1、通知模块（通知的创建、修改、立即发布、删除、通知阅读人数查看、通知的已发布和未发布列表）
2、学生端的注册、登录、找回密码、忘记密码
3、学生端页面框架搭建（作业、通知页面分解）
4、创建作业的修改和完善

张敬轩：
1. 存为草稿和重新发布更改状态
2. 立即发布更改状态
3. 学生端获取作业列表（未完成、已完成、全部）
4. 点击添加完成标识
5. 点击查看作业详情

马笑聪：
1. 创建作业
2. 查看作业详情
3. 用户个人信息的查询编辑（包括职称、职务、IM、电话、邮箱的增删查操作）
4. 作业的编辑操作

2016.11.7-2016.11.18
张敬轩：
1.点击添加学期
2.获取公有学期名称，获取私有学期名称
3.创建课程界面获取当前学期
4.获取班级课表
5.获取课程课表
6.获取教师个人课表
7.选择班级、选择课程、选择学期的获取跳转

马笑聪：
1. 完成教师端功能：获取当前正在进行的课程，及当天的课程列表。
2. 用户个人信息-学校的选择和编辑。
3. 完成教师端功能：获取指定日期的课程列表。
4. 完成教师端功能：判断当前时间是否为上课时间（当前时间是否为用户课程的授课时间）。
5.完成教师端功能：查看正在进行的课程得出勤情况（学生出勤列表）。
6.完成教师端功能：学生出勤列表的快速查询，模糊查询功能（JS实现）。
7.完成教师端功能：对出勤的某个学生进行平时成绩录取。
8.解决草稿状态的作业，查看详情存在的bug；解决未发布作业立即发布后不现实的问题。



2016.11.21-2016.11.25
马笑聪：
1. 修复学生端查看作业列表的BUG
2. 完成学生端功能：将未完成作业置为已完成状态
3. 完成学生端功能：查看作业详情
4. 完成学生端功能：阅读未读通知后，改变通知状态
5. 完成学生端功能：获取指定日期下的课程列表

张敬轩：
1.点击查看课程基本详情
2.课程简介、成绩组成、授课教材、授课教辅的查看详情
3.授课方式、课程类型、考核类型、学科专业、课程简介、授课班级、成绩组成、授课教材、授课教辅更改后的传值
4.课程基本信息的编辑保存
5.授课班级的编辑保存
6.成绩组成的编辑保存
7.授课教材教辅的编辑保存
