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
		<h1>execute、executeUpdate、executeQuery三者的区别</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<p>1. ResultSet executeQuery(String sql); 执行SQL查询，并返回 ResultSet
			对象。 例如：被执行最多的 SELECT 语句。</p>
		<p>2.int executeUpdate(String sql); 可执行增，删，改，返回执行受到影响的行数。 例如：
			INSERT、UPDATE 或 DELETE 语句以及 SQL DDL（数据定义语言）语句</p>
		<p>3. boolean execute(String sql); 可执行任何SQL语句，返回一个布尔值，表示是否返回
			ResultSet 。 execute是executeQuery和executeUpdate的综合.

			通常我们没有必要使用execute方法来执行SQL语句，而是使用 executeQuery 或 executeUpdate 更适合。

			-----</p>
		<p>executeUpdate() 这是 PreparedStatement 接口中的方法
			executeUpdate(String sql) 这是 PreparedStatement 从父接口 Statement
			中继承过来的方法 executeUpdate() 中执行 SQL 语句需要在创建 PerparedStatement 时通过
			Connection 的 prepareStatement(String sql) 方法中写出，因为 PerparedStatement
			中的 SQL 语句数据库需要进行预编译和缓存，因此要在创建 PerparedStatement 对象时给出 SQL 语句。</p>
		<p>而 executeUpdate(String sql) 是 Statement 中的方法，参数中的 SQL
			语句只是提交给数据库去执行，并不需要预编译。 如果 SQL 语句中有 ? 占位符，那么在设置好占位符中的值后，必须使用
			executeUpdate() 执行。而 executeUpdate(String sql) 只是提交一个 SQL
			语句，且这个语句中不能带有 ? 占位符。 当然，我们最好不要用 Statement 接口
			参考：http://www.cnblogs.com/bukudekong/archive/2011/06/22/2086531.html
		</p>
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