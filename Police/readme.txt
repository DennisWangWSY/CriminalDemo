注意事项：
1.首先使用“数据库备份.sql”创建相应的数据库
2.将src\config\DemoConfig.java下configPlugin的参数按照本机数据库进行修改
3.在本机的MySQL安装位置找到mysql-connector-java-xxx-bin.jar，加入到项目的build path,同时删除原有的无效jar
4.运行时使用完整jdk，而非jre。否则jsp页面无法正常显示
