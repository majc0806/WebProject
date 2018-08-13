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
		response.sendRedirect("emplogin.jsp");
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
				<li id="link1"><a href="javascript:link1();">部门动态(link1)</a></li>
				<li id="link2" class="active"><a href="javascript:link2();">技术好文(link2)</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">更多<span class="caret"></span></a>
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
	<!-- 	信息界面 -->
	<div class="bs-example"
		data-example-id="thumbnails-with-custom-content" id="test">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p2.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article1.jsp"><h3>execute、executeUpdate、executeQuery三者的区别</h3></a>
						<p>1. ResultSet
							executeQuery(Stringsql);执行SQL查询，并返回ResultSet对象。例如：被执行最多的SELECT语句。2.int
							e......</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p1.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article2.jsp"><h3>sql语句分为三类(DML,DDL,DCL)-介绍</h3></a>
						<p>DML（datamanipulationlanguage）：数据库操作语言它们是SELECT、UPDATE、INSERT、DELETE，就象它的名字一样
							DDL（datadefinition......</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p3.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article3.jsp"><h3>Java中静态代码块、构造代码块的区别</h3></a>
						<p>直接在类中定义且没有加static关键字的代码块称为{}构造代码块。构造代码块在创建对象时被调用，每次创建对象都会被调用，并且构造代码块的执....</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p4.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article4.jsp"><h3>Integer与int的种种比较你知道多少？</h3></a>
						<p>如果面试官问Integer与int的区别：估计大多数人只会说道两点，Ingeter是int的包装类，int的初值为0，Ingeter的初值为null。....</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--信息界面 -->
	<div class="bs-example"
		data-example-id="thumbnails-with-custom-content" id="test">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p5.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article5.jsp"><h3>Servlet
								实现验证码</h3></a>
						<p>分析生成图片实现类ImageServlet
							类①定义BufferedImage对象②获得Graphics对象③通过Random产生随机验证码信息④使用Graphics......</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p6.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article6.jsp"><h3>Mybatis高级映射多对多查询</h3></a>
						<p>紧接着上一篇文章：Mybatis高级映射一对多查询 写一、开发准备1、新建数据表（四张表）和添加测试数据DROP
							TABLE IF EXISTS `i......</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p7.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article7.jsp"><h3>springmvc
								表单中文乱码问题</h3></a>
						<p>基本上通过在web.xml了配置拦截器就可以解决。这里需要注意的是，最好把这段代码放在web.xml中开头的位置，因为拦截有顺序，如果放在后面的话容.....</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p8.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../article/article8.jsp"><h3>JDBC常用API和使用</h3></a>
						<p>一、JDBC常用API1、Connection接口方法名称功能描述getMetaData()该方法用于返回数据库的元数据的DatabaseMetaData对象createStatement用于......</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function logout() {
			window.location.href = "emplogout.jsp";
		}

		function link1() {
			$("#link1").addClass("active");
			$("#link2").removeClass("active");
			window.location.href = "DeptNews.jsp";
		}

		function link2() {
			$("#link2").addClass("active");
			$("#link1").removeClass("active");
			window.location.href = "SkillNews.jsp";
		}
	</script>
</body>
</html>