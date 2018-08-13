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
		<h1>Java中静态代码块、构造代码块的区别</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<p>直接在类中定义且没有加static关键字的代码块称为{}构造代码块。</p>
		<p>
			<strong><span>构造代码块在创建对象时被调用，每次创建对象都会被调用</span></strong>，并且构造代码块的执行次序优先于类构造函数。
		</p>
		<p>
			静态代码块:在java中使用static关键字声明的代码块。<span><strong>静态块用于初始化类，为类的属性初始化。每个静态代码块只会执行一次。由于JVM在加载类时会执行静态代码块，所以静态代码块先于主方法执行</strong></span>。
		</p>
		<p>注意：1 静态代码块不能存在于任何方法体内。2 静态代码块不能直接访问静态实例变量和实例方法，需要通过类的实例对象来访问。</p>
		<p>
			静态代码块、构造代码块、构造函数同时存在时的执行顺序：<strong><span>静态代码块 &gt;
					构造代码块 &nbsp;&gt; 构造函数</span></strong>；
		</p>
		<p>&nbsp;</p>
		<p>下面我们来举几个例子说明一切</p>
		<p>
			<strong>demo1：构造方法</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Test&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">static</span>&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"静态块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"构造块，在类中定义"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">public</span>&nbsp;Test()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"构造方法执行"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">public</span>&nbsp;<span class="keyword">static</span>&nbsp;<span
					class="keyword">void</span>&nbsp;main(String[]&nbsp;args)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="">&nbsp;}</li>
				<li class="alt"><span class="comment">/*</span></li>
				<li class=""><span class="comment">静态块</span></li>
				<li class="alt"><span class="comment">构造块，在类中定义</span></li>
				<li class=""><span class="comment">构造方法执行</span></li>
				<li class="alt"><span class="comment">构造块，在类中定义</span></li>
				<li class=""><span class="comment">构造方法执行</span></li>
				<li class="alt"><span class="comment">*/</span></li>
			</ol>
		</div>
		<p>
			<strong>demo2:普通代码块</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="comment">/*普通代码块：在方法或语句中出现的{}就称为普通代码块。</span></li>
				<li class=""><span class="comment">普通代码块和一般的语句执行顺序由他们在代码中出现的次序决定--“先出现先执行”*/</span></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Test&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">static</span>&nbsp;<span class="keyword">void</span>&nbsp;main(String[]&nbsp;args)&nbsp;{
				</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">int</span>&nbsp;x&nbsp;=&nbsp;<span class="number">3</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"1,普通代码块内的变量x="</span>&nbsp;+&nbsp;x);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">int</span>&nbsp;x&nbsp;=&nbsp;<span class="number">1</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"主方法内的变量x="</span>&nbsp;+&nbsp;x);
				</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">int</span>&nbsp;y&nbsp;=&nbsp;<span class="number">7</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"2,普通代码块内的变量y="</span>&nbsp;+&nbsp;y);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
				<li class=""></li>
				<li class="alt"><span class="comment">/*&nbsp;</span></li>
				<li class=""><span class="comment">1,普通代码块内的变量x=3</span></li>
				<li class="alt"><span class="comment">主方法内的变量x=1</span></li>
				<li class=""><span class="comment">2,普通代码块内的变量y=7</span></li>
				<li class="alt"><span class="comment">*/</span></li>
			</ol>
		</div>
		<p>
			<strong>demo3:构造代码块</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="comment">/*构造块：直接在类中定义且没有加static关键字的代码块称为{}构造代码块。</span></li>
				<li class=""><span class="comment">构造代码块在创建对象时被调用，每次创建对象都会被调用，</span></li>
				<li class="alt"><span class="comment">并且构造代码块的执行次序优先于类构造函数。*/</span></li>
				<li class=""></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Test&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"第一代码块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Test()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"构造方法"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"第二构造块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">static</span>&nbsp;<span class="keyword">void</span>&nbsp;main(String[]&nbsp;args)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
				<li class=""><span class="comment">/*</span></li>
				<li class="alt"><span class="comment">第一代码块</span></li>
				<li class=""><span class="comment">第二构造块</span></li>
				<li class="alt"><span class="comment">构造方法</span></li>
				<li class=""><span class="comment">第一代码块</span></li>
				<li class="alt"><span class="comment">第二构造块</span></li>
				<li class=""><span class="comment">构造方法</span></li>
				<li class="alt"><span class="comment">第一代码块</span></li>
				<li class=""><span class="comment">第二构造块</span></li>
				<li class="alt"><span class="comment">构造方法</span></li>
				<li class=""><span class="comment">*/</span></li>
			</ol>
		</div>
		<p>
			<strong>demo4:静态代码块</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="comment">/*静态代码块:在java中使用static关键字声明的代码块。</span></li>
				<li class=""><span class="comment">静态块用于初始化类，为类的属性初始化。</span></li>
				<li class="alt"><span class="comment">每个静态代码块只会执行一次。</span></li>
				<li class=""><span class="comment">由于JVM在加载类时会执行静态代码块，所以静态代码块先于主方法执行。</span></li>
				<li class="alt"><span class="comment">如果类中包含多个静态代码块，那么将按照"先定义的代码先执行，后定义的代码后执行"。</span></li>
				<li class=""><span class="comment">注意：1&nbsp;静态代码块不能存在于任何方法体内。</span></li>
				<li class="alt"><span class="comment">&nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp;
						2&nbsp;静态代码块不能直接访问静态实例变量和实例方法，需要通过类的实例对象来访问。*/</span></li>
				<li class=""></li>
				<li class="alt"><span class="keyword">class</span>&nbsp;Code&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Code的构造块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">static</span>&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Code的静态代码块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Code()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Code的构造方法"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Test&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Test的构造块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">static</span>&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Test的静态代码块"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Test()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Test的构造方法"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">static</span>&nbsp;<span class="keyword">void</span>&nbsp;main(String[]&nbsp;args)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
					class="string">"Test的主方法"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Code();
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Code();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">new</span>&nbsp;Test();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
				<li class=""><span class="comment">/*</span></li>
				<li class="alt"><span class="comment">Test的静态代码块</span></li>
				<li class=""><span class="comment">Test的主方法</span></li>
				<li class="alt"><span class="comment">Code的静态代码块</span></li>
				<li class=""><span class="comment">Code的构造块</span></li>
				<li class="alt"><span class="comment">Code的构造方法</span></li>
				<li class=""><span class="comment">Code的构造块</span></li>
				<li class="alt"><span class="comment">Code的构造方法</span></li>
				<li class=""><span class="comment">Test的构造块</span></li>
				<li class="alt"><span class="comment">Test的构造方法</span></li>
				<li class=""><span class="comment">Test的构造块</span></li>
				<li class="alt"><span class="comment">Test的构造方法</span></li>
				<li class=""><span class="comment">&nbsp;*/</span></li>
				<li></li>
			</ol>
		</div>
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