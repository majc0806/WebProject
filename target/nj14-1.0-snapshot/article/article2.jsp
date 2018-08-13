<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>员工界面</title>
<%
	boolean flag = (session.getAttribute("empIsLogin") == null
			|| !session.getAttribute("empIsLogin").equals("true"));
	if (flag) {
		response.sendRedirect("../emppage/emplogin.jsp");
	}
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String empName = (String) session.getAttribute("empName");
	System.out.println(session.getAttribute("empIsLogin"));
%>
<%--引入jQuery--%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<!-- 引入bootstrap样式 -->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<STYLE type="text/css">
.in-line {
	display: inline-block;
}
</STYLE>
</head>
<body>
	<!-- 导航条 -->
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><%=empName%></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="link1"><a href="javascript:link1()">部门动态(link1)</a></li>
				<li id="link2" class="active"><a href="javascript:link2();">技术好文(link2)</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">更多 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="http://www.yuntiy.com/">科技头条</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="EmpInfo.jsp">个人信息</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout();">退出登录</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="page-header" style="text-align: center">
		<h1>sql语句分为三类(DML,DDL,DCL)-介绍</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<p>DML（data manipulation language）：数据库操作语言
			它们是SELECT、UPDATE、INSERT、DELETE，就象它的名字一样 DDL（data definition
			language）：的数据库定义语言
			主要的命令有CREATE、ALTER、DROP等，DDL主要是用在定义或改变表（TABLE）的结构，数据类型，表之间的链接和约束等初始化工作上，他们大多在建立表时使用

		</p>

		<p>DCL（Data Control Language）： 数据库控制语言
			是用来设置或更改数据库用户或角色权限的语句，包括（grant,deny,revoke等）语句。在默认状态下，只有sysadmin,dbcreator,db_owner或db_securityadmin等人员才有权力执行DCL

		</p>

		<p>详细解释： 一、DDL is Data Definition Language statements
			数据定义语言，用于定义和管理 SQL 数据库中的所有对象的语言 1.CREATE - to create objects in the
			database 创建 2.ALTER - alters the structure of the database 修改 3.DROP
			- delete objects from the database 删除 4.TRUNCATE - remove all records
			from a table, including all spaces allocated for the records are
			removed TRUNCATE TABLE [Table Name]。
			下面是对Truncate语句在MSSQLServer2000中用法和原理的说明： Truncate table 表名
			速度快,而且效率高,因为: TRUNCATE TABLE 在功能上与不带 WHERE 子句的 DELETE
			语句相同：二者均删除表中的全部行。但 TRUNCATE TABLE 比 DELETE 速度快，且使用的系统和事务日志资源少。 DELETE
			语句每次删除一行，并在事务日志中为所删除的每行记录一项。TRUNCATE TABLE 通过释放存</p>
		<p>储表数据所用的数据页来删除数据，并且只在事务日志中记录页的释放。 TRUNCATE TABLE
			删除表中的所有行，但表结构及其列、约束、索引等保持不变。新行标识所用的计数值重置为该列的种子。如果想保留标识计数值，请改用
			DELETE。如果要删除表定义及其数据，请使用 DROP TABLE 语句。 对于由 FOREIGN KEY 约束引用的表，不能使用
			TRUNCATE TABLE，而应使用不带 WHERE 子句的 DELETE 语句。由于 TRUNCATE TABLE
			不记录在日志中，所以它不能激活触发器。 TRUNCATE TABLE 不能用于参与了索引视图的表。 5.COMMENT - add
			comments to the data dictionary 注释 6.GRANT - gives user's access
			privileges to database 授权 7.REVOKE - withdraw access privileges given
			with the GRANT command 收回已经授予的权限 二、DML is Data Manipulation Language
			statements 数据操作语言，SQL中处理数据等操作统称为数据操纵语言 1.SELECT - retrieve data from
			the a database 查询 2.INSERT - insert data into a table 添加 3.UPDATE -
			updates existing data within a table 更新 4.DELETE - deletes all
			records from a table, the space for the records remain 删除 5.CALL -
			call a PL/SQL or Java subprogram 6.EXPLAIN PLAN - explain access path
			to data Oracle</p>
		<p>
			RDBMS执行每一条SQL语句，都必须经过Oracle优化器的评估。所以，了解优化器是如何选择(搜索)路径以及索引是如何被使用的，对优化SQL语句有很大的帮助。Explain可以用来迅速方便地查出对于给定SQL语句中的查询数据是如何得到的即搜索路径(我们通常称为Access
			Path)。从而使我们选择最优的查询方式达到最大的优化效果。 7.LOCK TABLE - control concurrency
			锁，用于控制并发 三、DCL is Data Control Language statements
			数据控制语言，用来授予或回收访问数据库的某种特权，并控制数据库操纵事务发生的时间及效果，对数据库实行监视等 1.COMMIT - save
			work done 提交 2.SAVEPOINT - identify a point in a transaction to which
			you can later roll back 保存点 3.ROLLBACK - restore database to original
			since the last COMMIT 回滚 4.SET TRANSACTION - Change transaction
			options like what rollback segment to use 设置当前事务的特性，它对后面的事务没有影响</p>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">回到顶部</a>
		</p>




	</div>
	<script type="text/javascript">
		function logout() {
			window.location.href = "../emppage/emplogout.jsp";
		}

		function link1() {
			$("#link1").addClass("active");
			$("#link2").removeClass("active");
			window.location.href = "../emppage/DeptNews.jsp";
		}

		function link2() {
			$("#link2").addClass("active");
			$("#link1").removeClass("active");
			window.location.href = "../emppage/SkillNews.jsp";
		}
	</script>
</body>
</html>