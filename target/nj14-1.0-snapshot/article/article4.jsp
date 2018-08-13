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
		<h1>Integer与int的种种比较你知道多少？</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<p>如果面试官问Integer与int的区别：估计大多数人只会说道两点，Ingeter是int的包装类，int的初值为0，Ingeter的初值为null。但是如果面试官再问一下Integer
			a = 1;int b&nbsp;= 1;
			a==b为true还是为false？估计就有一部分人答不出来了，如果再问一下其他的，估计更多的人会头脑一片混乱。所以我对它们进行了总结，希望对大家有帮助。</p>
		<p>
			<strong>首先看代码：</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="comment">/*&nbsp;</span></li>
				<li class=""><span class="comment">&nbsp;*&nbsp;@author&nbsp;LiuYanzhao</span></li>
				<li class="alt"><span class="comment">&nbsp;*</span></li>
				<li class=""><span class="comment">&nbsp;*/</span></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Test&nbsp;{</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">static</span>&nbsp;<span class="keyword">void</span>&nbsp;main(String[]&nbsp;args)&nbsp;{
				</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">int</span>&nbsp;i&nbsp;=&nbsp;<span class="number">128</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i2&nbsp;=&nbsp;<span
					class="number">128</span>;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i3&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;Integer(<span class="number">128</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comment">//Integer会自动拆箱为int，所以为true</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(i&nbsp;==&nbsp;i2);<span
					class="comment">//true</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(i&nbsp;==&nbsp;i3);<span
					class="comment">//true</span></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comment">//java在编译的时候,被翻译成-&gt;&nbsp;Integer&nbsp;i5&nbsp;=&nbsp;Integer.valueOf(127);</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i5&nbsp;=&nbsp;<span
					class="number">127</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i6&nbsp;=&nbsp;<span
					class="number">127</span>;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(i5&nbsp;==&nbsp;i6);<span
					class="comment">//true</span></li>
				<li class=""></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i7&nbsp;=&nbsp;<span
					class="number">128</span>;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i8&nbsp;=&nbsp;<span
					class="number">128</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(i7&nbsp;==&nbsp;i8);<span
					class="comment">//false</span></li>
				<li class="alt"></li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i9&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;Integer(<span class="number">127</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i10&nbsp;=&nbsp;<span
					class="number">127</span>;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(i9&nbsp;==&nbsp;i10);&nbsp;<span
					class="comment">//false</span></li>
				<li class=""></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i11&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;Integer(<span class="number">128</span>);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer&nbsp;i12&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;Integer(<span class="number">123</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(i11&nbsp;==&nbsp;i12);&nbsp;&nbsp;<span
					class="comment">//false</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">}</li>
			</ol>
		</div>
		<p>
			<strong>详解如下：</strong>
		</p>
		<p>首先，13行和14行输出结果都为true,因为Integer和int比都会自动拆箱（jdk1.5以上）。</p>
		<p>19行的结果为true,而24行则为false,很多人都不懂为什么。其实java在编译Integer i5 =
			127的时候,被翻译成-&gt; Integer i5 =
			Integer.valueOf(127);所以关键就是看valueOf()函数了。只要看看valueOf()函数的源码就会明白了。JDK源码的valueOf函数式这样的：</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">static</span>&nbsp;Integer&nbsp;valueOf(<span
					class="keyword">int</span>&nbsp;i)&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">assert</span>&nbsp;IntegerCache.high&nbsp;&gt;=&nbsp;<span
					class="number">127</span>;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span>&nbsp;(i&nbsp;&gt;=&nbsp;IntegerCache.low&nbsp;&amp;&amp;&nbsp;i&nbsp;&lt;=&nbsp;IntegerCache.high)
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;IntegerCache.cache[i&nbsp;+&nbsp;(-IntegerCache.low)];
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span>&nbsp;<span
					class="keyword">new</span>&nbsp;Integer(i);
				</li>
				<li class="">}</li>
			</ol>
		</div>
		<p>看一下源码大家都会明白，对于-128到127之间的数，会进行缓存，Integer i5 =
			127时，会将127进行缓存，下次再写Integer i6 =
			127时，就会直接从缓存中取，就不会new了。所以22行的结果为true,而25行为false。</p>
		<p>对于29行和34行，因为对象不一样，所以为false。</p>
		<p>我对于以上的情况总结如下：</p>
		<p>
			① 无论如何，<span><strong>Integer与new Integer不会相等</strong></span>。不会经历拆箱过程，i3的引用指向堆，而i4指向专门存放他的内存（常量池），他们的内存地址不一样，所以为false
		</p>
		<p>
			②&nbsp;<strong><span>两个都是非new出来的Integer，如果数在-128到127之间，则是true,否则为false</span></strong>
		</p>
		<p>java在编译Integer i2 = 128的时候,被翻译成-&gt; Integer i2 =
			Integer.valueOf(128);而valueOf()函数会对-128到127之间的数进行缓存</p>
		<p>
			③&nbsp;<strong><span>两</span><span>个都是new出来的,都为false</span></strong>
		</p>
		<p>
			④&nbsp;<strong><span>int和Integer(无论new否)比，都为true</span></strong>，因为会把Integer自动拆箱为int再去比
		</p>
		<p>&nbsp;</p>
		<p>
			参考：<a
				href="https://liuyanzhao.com/wp-content/themes/begin/inc/go.php?url=http://www.cnblogs.com/liuling/archive/2013/05/05/intAndInteger.html"
				target="_blank" rel="noopener noreferrer">http://www.cnblogs.com/liuling/archive/2013/05/05/intAndInteger.html</a>
		</p>
		<div>
			<br>
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