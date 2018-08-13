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
				<li class="active" id="link1"><a href="javascript:link1();">部门动态(link1)</a></li>
				<li id="link2"><a href="javascript:link2();">技术好文(link2)</a></li>
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
	<!-- 	信息界面 -->
	<div class="bs-example"
		data-example-id="thumbnails-with-custom-content" id="test">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p30.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>最新通知</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p31.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>
								2018部门最新汇报总结</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p32.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>2018
								我司java编程新规范</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p33.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>
								没有硝烟的新零售战场 从货品巡检效率提升开始</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	信息界面 -->
	<div class="bs-example"
		data-example-id="thumbnails-with-custom-content" id="test">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p34.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>
								大数据技术在我部门的典型应用</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p35.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>
								大数据发展的新动向与新趋势</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p36.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>2018
								云计算与大数据峰会</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/100%x200" alt="100%x200"
						src="../static/picture/p37.jpg" data-holder-rendered="true"
						style="height: 200px; width: 100%; display: block;">
					<div class="caption">
						<a rel="bookmark" href="../DeptArticle/DeptArticle1.jsp"><h3>
								新一代大数据安全风险将引发VPN问题</h3></a>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
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