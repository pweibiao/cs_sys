## :moneybag:a simple supermarket cashier systems , create by SSM framework ~
**项目概述**  
&emsp;cs_sys是一个基于SSM & Layui前端框架实现的模拟超市收银系统。  

**开发环境** 
|工具  | 版本  |
|:----------|:----------|
| OS    | MacOS   |
| JDK    | 1.8    |
| IDE    | IntelliJ IDEA    |
| MySQL    | 8.0.18    |

**技术栈**  
前端：Layui、JSP、JQuery、AJAX...  
后端：Spring、SpringMVC、Mybatis、PageHelper...


**用户权限**  
- 管理员：具有所有管理模块的权限
- 经理：具有商品管理权限和订单管理权限
- 员工：具有订单管理权限
  

**系统功能**  
  
&emsp;（1）登录模块：  
&emsp;&emsp;系统启动后的首页，是系统的入口，对登陆人员的身份识别，需要输入相关信息
进行验证识别。  
&emsp;（2）商品模块：  
&emsp;&emsp;商品管理是对商品名称、数量、价格进行正确的管理。可以查阅所有商品信息，
并可提供新的商品信息，进行进货操作。  
&emsp;（3）交易订单模块：  
&emsp;&emsp;根据用户登录后的身份识别绑定，可以记录该员工所创建的所有交易信息。可以
查阅所有的订单信息，记录了所有的交易笔数和交易总价，可查到到每笔订单的由
来，落实到员工个人。  
&emsp;（4）财务模块：  
&emsp;&emsp;对商品信息打印和对交易订单进行打印。  
&emsp;（5）系统模块：  
&emsp;&emsp;在管理员权限下可针对不同的用户定义不同的权限，以及管理人员信息。
在普通员工权限下可以查看个人信息和个人信息安全管理。  

**系统流程**  
&emsp;系统登陆页面，输入相关信息进行登陆身份识别验证。判断输入账号密否匹
配，并有相应提示错误信息。  
&emsp;登陆信息登录后台识别登陆者身份，对应不同权限人员响应不同功能页面。
员工身份登录后，可以进行相关收银操作，可对商品进行翻阅查询，并可打印相
关交易订单信息和商品信息。  
&emsp;超市经营者身份登录后，可以对商品信息进行添加修改和查询，可以进行相关收
银操作，可对商品进行翻阅查询，并可打印相关交易订单信息和商品信息。  
&emsp;系统管理员身份登陆后，对所有人员信息进行查询和删除功能，可以对商品信息
进行添加修改和查询，可以进行相关收银操作，可对商品进行翻阅查询，并可打印相
关交易订单信息和商品信息。  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_flowChart.png)

**系统架构**  

![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_construct.png)  


**功能模块**  
- 登陆模块    
系统登陆页面，输入相关信息进行登陆身份识别验证。判断输入账号密否匹
配，并有相应提示错误信息。  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_login.png)
- 商品模块  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_goods2.png)  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_goods1.png)
- 交易模块  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_order.png)
- 财务模块  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_%20accounting%202.png)  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_%20accounting1.png)
- 管理模块  
![avatar](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_admin.png)  
[系统目录](https://github.com/pweibiao/cs_sys/blob/master/sys_pictures/sys_mulu.png)
