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
		<h1>springmvc 表单中文乱码解决方案</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<p>基本上通过在 web.xml 了配置拦截器就可以解决。</p>
		<p>这里需要注意的是，最好把这段代码放在web.xml中开头的位置，因为拦截有顺序，如果放在后面的话容易拦截不到。</p>
		<p>拦截器代码如下</p>
		<p></p>
		<div>
			<div class="dp-highlighter">
				<div class="bar"></div>
				<ol start="1" class="dp-xml">
					<li class="alt"><span><span class="comments">&lt;!--post乱码过滤器--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="comments">&lt;!--&nbsp;配置springMVC编码过滤器&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="tag">&lt;</span><span
							class="tag-name">filter</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">filter-name</span><span
							class="tag">&gt;</span><span>CharacterEncodingFilter</span><span
							class="tag">&lt;/</span><span class="tag-name">filter-name</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">filter-class</span><span
							class="tag">&gt;</span><span>org.springframework.web.filter.CharacterEncodingFilter</span><span
							class="tag">&lt;/</span><span class="tag-name">filter-class</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comments">&lt;!--&nbsp;设置过滤器中的属性值&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">init-param</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">param-name</span><span
							class="tag">&gt;</span><span>encoding</span><span class="tag">&lt;/</span><span
							class="tag-name">param-name</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">param-value</span><span
							class="tag">&gt;</span><span>UTF-8</span><span class="tag">&lt;/</span><span
							class="tag-name">param-value</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;/</span><span class="tag-name">init-param</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comments">&lt;!--&nbsp;启动过滤器&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">init-param</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">param-name</span><span
							class="tag">&gt;</span><span>forceEncoding</span><span
							class="tag">&lt;/</span><span class="tag-name">param-name</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">param-value</span><span
							class="tag">&gt;</span><span>true</span><span class="tag">&lt;/</span><span
							class="tag-name">param-value</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;/</span><span class="tag-name">init-param</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="tag">&lt;/</span><span
							class="tag-name">filter</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="comments">&lt;!--&nbsp;过滤所有请求&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="tag">&lt;</span><span
							class="tag-name">filter-mapping</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">filter-name</span><span
							class="tag">&gt;</span><span>CharacterEncodingFilter</span><span
							class="tag">&lt;/</span><span class="tag-name">filter-name</span><span
							class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="tag">&lt;</span><span class="tag-name">url-pattern</span><span
							class="tag">&gt;</span><span>/*</span><span class="tag">&lt;/</span><span
							class="tag-name">url-pattern</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="tag">&lt;/</span><span
							class="tag-name">filter-mapping</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
				</ol>
			</div>
		</div>
		<p>
			<br>
		</p>
		<p>顺便再补充其他的几个可能原因。</p>
		<p></p>
		<p>1、数据库和数据表不是 utf-8 编码</p>
		<p>就在前几天，我遇到的问题正是这个。当时是刚从 windows 搬到 mac。也是在提交 post
			表单的时候，中文一直是乱码，后台百度发现，原来是 navicat 的原因。就是在新建 数据库连接(注意是连接)，不能选择
			utf-8，应该选择默认的自动。这个地方很坑人。</p>
		<p>数据库和数据表当然是 utf-8，一般这种情况很少出错。</p>
		<p>&nbsp;</p>
		<p>2、修改 Tomcat 的 server.xml 文件，添加 utf-8 编码</p>
		<p></p>
		<div>
			<div class="dp-highlighter">
				<div class="bar"></div>
				<ol start="1" class="dp-j">
					<li class="alt"><span><span>&lt;Connector&nbsp;port=</span><span
							class="string">"8080"</span><span>&nbsp;protocol=</span><span
							class="string">"HTTP/1.1"</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;connectionTimeout=<span
							class="string">"20000"</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirectPort=<span
							class="string">"8443"</span><span>&nbsp;URIEncoding=</span><span
							class="string">"UTF-8"</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;useBodyEncodingForURI=<span
							class="string">"true"</span><span>&nbsp;/&gt;&nbsp;&nbsp;</span></span></li>
				</ol>
			</div>
		</div>
		<br>
		<p></p>
		<p>3、注意你的 IDE (如Eclipse,IntelliJ IDEA)的 jsp
			文件编码，一般在右下角可以看出来，通常我们也要把默认的编码设置为 utf-8。</p>
		<p>&nbsp;</p>
		<p>4、还有一种方法就是 直接对接收到的数据编码转换，我感觉有点麻烦，所以不是很喜欢</p>
		<p></p>
		<div>
			<div class="dp-highlighter">
				<div class="bar"></div>
				<ol start="1" class="dp-j">
					<li class="alt"><span><span>String&nbsp;name=</span><span
							class="keyword">new</span><span>&nbsp;String((user.getUname()).getBytes(</span><span
							class="string">"ISO-8859-1"</span><span>),</span><span
							class="string">"utf8"</span><span>);&nbsp;&nbsp;</span></span></li>
				</ol>
			</div>
		</div>
		<p>
			<span>总结：一般来说，第一种拦截器方法是可用的，要注意的是要把拦截器代码放到 web.xml
				头部，防止拦截不到，还有表单一定要 post 方式提交。</span>
		</p>
		<p></p>
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