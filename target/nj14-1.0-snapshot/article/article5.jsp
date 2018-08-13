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
		<h1>Servlet 实现验证码</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<h2>分析</h2>
		<p>
			<strong>生成图片实现类</strong>
		</p>
		<p>
			Image<a href="https://liuyanzhao.com/tag/servlet/"
				title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>&nbsp;类
		</p>
		<p>① 定义BufferedImage 对象</p>
		<p>② 获得 Graphics 对象</p>
		<p>③ 通过 Random 产生随机验证码信息</p>
		<p>④ 使用 Graphics 绘制图片</p>
		<p>⑤ 记录验证码信息到 session 中</p>
		<p>⑥ 使用 ImageIO 输出图片</p>
		<h2>代码实现</h2>
		<p>1、新建 web 项目 CheckCode，在 WebContent 下新建 index.jsp</p>
		<p>
			<strong>index.jsp</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-xml" start="1">
				<li class="alt"><span class="tag">&lt;</span>%@&nbsp;page&nbsp;<span
					class="attribute">language</span>=<span class="attribute-value">"java"</span>&nbsp;<span
					class="attribute">contentType</span>=<span class="attribute-value">"text/html;&nbsp;charset=UTF-8"</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">pageEncoding</span>=<span
					class="attribute-value">"UTF-8"</span>%<span class="tag">&gt;</span></li>
				<li class="alt">&lt;!DOCTYPE&nbsp;html&nbsp;PUBLIC&nbsp;"-//W3C//DTD&nbsp;HTML&nbsp;4.01&nbsp;Transitional//EN"&nbsp;"http://www.w3.org/TR/html4/loose.dtd"<span
					class="tag">&gt;</span></li>
				<li class=""><span class="tag">&lt;</span><span
					class="tag-name">html</span><span class="tag">&gt;</span></li>
				<li class="alt"><span class="tag">&lt;</span><span
					class="tag-name">head</span><span class="tag">&gt;</span></li>
				<li class=""><span class="tag">&lt;</span><span
					class="tag-name">meta</span>&nbsp;<span class="attribute">http-equiv</span>=<span
					class="attribute-value">"Content-Type"</span>&nbsp;<span
					class="attribute">content</span>=<span class="attribute-value">"text/html;&nbsp;charset=UTF-8"</span><span
					class="tag">&gt;</span></li>
				<li class="alt"><span class="tag">&lt;</span><span
					class="tag-name">title</span><span class="tag">&gt;</span>Insert&nbsp;title&nbsp;here<span
					class="tag">&lt;/</span><span class="tag-name">title</span><span
					class="tag">&gt;</span></li>
				<li class=""><span class="tag">&lt;</span><span
					class="tag-name">script</span>&nbsp;<span class="attribute">type</span>=<span
					class="attribute-value">"text/javascript"</span><span class="tag">&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;reloadCode()&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//传个时间参数，防止缓存</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;<span
					class="attribute">time</span>&nbsp;=&nbsp;<span
					class="attribute-value">new</span>&nbsp;Date().getTime();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById("imageCode")<span
					class="attribute">.src</span>=<span class="attribute-value">"&lt;%=request.getContextPath()%&gt;/Image<a
						href="https://liuyanzhao.com/tag/servlet/"
						title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>?d="
				</span>+time;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""><span class="tag">&lt;/</span><span
					class="tag-name">script</span><span class="tag">&gt;</span></li>
				<li class="alt"><span class="tag">&lt;/</span><span
					class="tag-name">head</span><span class="tag">&gt;</span></li>
				<li class=""><span class="tag">&lt;</span><span
					class="tag-name">body</span><span class="tag">&gt;</span></li>
				<li class="alt"><span class="tag">&lt;</span><span
					class="tag-name">form</span>&nbsp;<span class="attribute">action</span>=<span
					class="attribute-value">"&lt;%=request.getContextPath()%&gt;/Login<a
						href="https://liuyanzhao.com/tag/servlet/"
						title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>"
				</span>&nbsp;<span class="attribute">method</span>=<span
					class="attribute-value">"post"</span><span class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;验证码：<span class="tag">&lt;</span><span
					class="tag-name">input</span>&nbsp;<span class="attribute">type</span>=<span
					class="attribute-value">"text"</span>&nbsp;<span class="attribute">name</span>=<span
					class="attribute-value">"checkcode"</span>&nbsp;<span class="tag">/&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">img</span>&nbsp;<span class="attribute">id</span>=<span
					class="attribute-value">"imageCode"</span>&nbsp;<span
					class="attribute">src</span>=<span class="attribute-value">"&lt;%=request.getContextPath()%&gt;/Image<a
						href="https://liuyanzhao.com/tag/servlet/"
						title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>"
				</span>&nbsp;<span class="attribute">alt</span>=<span
					class="attribute-value">"验证码"</span>&nbsp;<span class="tag">/&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">a</span>&nbsp;<span class="attribute">href</span>=<span
					class="attribute-value">"javascript:reloadCode();"</span><span
					class="tag">&gt;</span>看不清楚<span class="tag">&lt;/</span><span
					class="tag-name">a</span><span class="tag">&gt;</span>&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">br</span>&nbsp;<span
					class="tag">/&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">input</span>&nbsp;<span class="attribute">type</span>=<span
					class="attribute-value">"submit"</span>&nbsp;&nbsp;<span
					class="attribute">value</span>=<span class="attribute-value">"提交"</span><span
					class="tag">/&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;/</span><span
					class="tag-name">form</span><span class="tag">&gt;</span></li>
				<li class="alt"><span class="tag">&lt;/</span><span
					class="tag-name">body</span><span class="tag">&gt;</span></li>
				<li class=""><span class="tag">&lt;/</span><span
					class="tag-name">html</span><span class="tag">&gt;</span></li>
			</ol>
		</div>
		<p>
			2、在 src 下新建 com.liuyanzhao 包，然后分别新建用于动态画图的 Image<a
				href="https://liuyanzhao.com/tag/servlet/" title="查看与 Servlet 相关的文章"
				target="_blank">Servlet</a>&nbsp;类和用于判断验证码是否正确的 Login<a
				href="https://liuyanzhao.com/tag/servlet/" title="查看与 Servlet 相关的文章"
				target="_blank">Servlet</a>&nbsp;类
		</p>
		<p>
			<strong>Image<a href="https://liuyanzhao.com/tag/servlet/"
				title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>.java
			</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.awt.Color;</li>
				<li class=""><span class="keyword">import</span>&nbsp;java.awt.Graphics;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.awt.image.BufferedImage;</li>
				<li class=""><span class="keyword">import</span>&nbsp;java.io.IOException;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.util.Random;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;javax.imageio.ImageIO;</li>
				<li class=""><span class="keyword">import</span>&nbsp;javax.servlet.<a
					href="https://liuyanzhao.com/tag/servlet/"
					title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>Exception;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;javax.servlet.http.Http<a
					href="https://liuyanzhao.com/tag/servlet/"
					title="查看与 Servlet 相关的文章" target="_blank">Servlet</a>;</li>
				<li class=""><span class="keyword">import</span>&nbsp;javax.servlet.http.HttpServletRequest;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;javax.servlet.http.HttpServletResponse;</li>
				<li class=""></li>
				<li class="alt"></li>
				<li class=""><span class="comment">/*</span></li>
				<li class="alt"><span class="comment">&nbsp;*&nbsp;@author&nbsp;LiuYanzhao</span></li>
				<li class=""><span class="comment">&nbsp;*/</span></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;ImageServlet&nbsp;<span
					class="keyword">extends</span>&nbsp;HttpServlet&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="annotation">@Override</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">protected</span>&nbsp;<span
					class="keyword">void</span>&nbsp;doGet(HttpServletRequest&nbsp;request,&nbsp;HttpServletResponse&nbsp;response)&nbsp;<span
					class="keyword">throws</span>&nbsp;ServletException,&nbsp;IOException&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BufferedImage&nbsp;bi&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;BufferedImage(<span class="number">68</span>,&nbsp;<span
					class="number">22</span>,&nbsp;BufferedImage.TYPE_INT_RGB);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Graphics&nbsp;g&nbsp;=&nbsp;bi.getGraphics();</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Color&nbsp;c&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;Color(<span class="number">200</span>,<span
					class="number">155</span>,<span class="number">255</span>);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.setColor(c);</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.fillRect(<span
					class="number">0</span>,&nbsp;<span class="number">0</span>,&nbsp;<span
					class="number">68</span>,&nbsp;<span class="number">22</span>);
				</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">char</span>[]&nbsp;ch&nbsp;=&nbsp;<span
					class="string">"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"</span>.toCharArray();
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Random&nbsp;r&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;Random();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">int</span>&nbsp;len&nbsp;=&nbsp;ch.length,index;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;StringBuffer&nbsp;sb&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;StringBuffer();
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">for</span>(<span class="keyword">int</span>&nbsp;i=<span
					class="number">0</span>;i&lt;<span class="number">4</span>;i++)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index&nbsp;=&nbsp;r.nextInt(len);</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.setColor(<span
					class="keyword">new</span>&nbsp;Color(r.nextInt(<span
					class="number">88</span>),r.nextInt(<span class="number">188</span>),r.nextInt(<span
					class="number">255</span>)));
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.drawString(ch[index]+<span
					class="string">""</span>,&nbsp;(i*<span class="number">15</span>)+<span
					class="number">3</span>,&nbsp;<span class="number">18</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sb.append(ch[index]);</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;request.getSession().setAttribute(<span
					class="string">"piccode"</span>,&nbsp;sb.toString());
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ImageIO.write(bi,&nbsp;<span
					class="string">"JPG"</span>,&nbsp;response.getOutputStream());
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="annotation">@Override</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">protected</span>&nbsp;<span
					class="keyword">void</span>&nbsp;doPost(HttpServletRequest&nbsp;request,&nbsp;HttpServletResponse&nbsp;response)&nbsp;<span
					class="keyword">throws</span>&nbsp;ServletException,&nbsp;IOException&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;doGet(request,&nbsp;response);</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
			</ol>
		</div>
		<p>
			<strong>LoginServlet.java</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.io.IOException;</li>
				<li class=""><span class="keyword">import</span>&nbsp;java.io.PrintWriter;</li>
				<li class="alt"></li>
				<li class=""><span class="keyword">import</span>&nbsp;javax.servlet.ServletException;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;javax.servlet.http.HttpServlet;</li>
				<li class=""><span class="keyword">import</span>&nbsp;javax.servlet.http.HttpServletRequest;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;javax.servlet.http.HttpServletResponse;</li>
				<li class=""></li>
				<li class="alt"><span class="comment">/*</span></li>
				<li class=""><span class="comment">&nbsp;*&nbsp;@author&nbsp;LiuYanzhao</span></li>
				<li class="alt"><span class="comment">&nbsp;*/</span></li>
				<li class=""><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;LoginServlet&nbsp;<span
					class="keyword">extends</span>&nbsp;HttpServlet{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="annotation">@Override</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">protected</span>&nbsp;<span
					class="keyword">void</span>&nbsp;doPost(HttpServletRequest&nbsp;request,&nbsp;HttpServletResponse&nbsp;response)&nbsp;<span
					class="keyword">throws</span>&nbsp;ServletException,&nbsp;IOException&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;piccode&nbsp;=&nbsp;(String)request.getSession().getAttribute(<span
					class="string">"piccode"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;checkcode&nbsp;=&nbsp;request.getParameter(<span
					class="string">"checkcode"</span>);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;checkcode&nbsp;=&nbsp;checkcode.toUpperCase();<span
					class="comment">//不区分大小写</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;response.setContentType(<span
					class="string">"text/html;charset=utf-8"</span>);
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PrintWriter&nbsp;out&nbsp;=&nbsp;response.getWriter();</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">if</span>(piccode.equals(checkcode))&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out.println(<span
					class="string">"验证码输入正确"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<span
					class="keyword">else</span>&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out.println(<span
					class="string">"验证码输入错误"</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out.flush();</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;out.close();</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="annotation">@Override</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">protected</span>&nbsp;<span
					class="keyword">void</span>&nbsp;doGet(HttpServletRequest&nbsp;request,&nbsp;HttpServletResponse&nbsp;response)&nbsp;<span
					class="keyword">throws</span>&nbsp;ServletException,&nbsp;IOException&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;doPost(request,&nbsp;response);</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="">}</li>
			</ol>
		</div>
		<p>3、在 web.xml 里添加 Servlet 映射</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-xml" start="1">
				<li class="alt"><span class="tag">&lt;</span><span
					class="tag-name">servlet</span><span class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-name</span><span class="tag">&gt;</span>ImageServlet<span
					class="tag">&lt;/</span><span class="tag-name">servlet-name</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-class</span><span class="tag">&gt;</span>com.liuyanzhao.ImageServlet<span
					class="tag">&lt;/</span><span class="tag-name">servlet-class</span><span
					class="tag">&gt;</span></li>
				<li class="">&nbsp;<span class="tag">&lt;/</span><span
					class="tag-name">servlet</span><span class="tag">&gt;</span></li>
				<li class="alt">&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-mapping</span><span class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments">&lt;!--&nbsp;映射为&nbsp;ImageServlet&nbsp;--&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-name</span><span class="tag">&gt;</span>ImageServlet<span
					class="tag">&lt;/</span><span class="tag-name">servlet-name</span><span
					class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">url-pattern</span><span class="tag">&gt;</span>/ImageServlet<span
					class="tag">&lt;/</span><span class="tag-name">url-pattern</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;<span class="tag">&lt;/</span><span
					class="tag-name">servlet-mapping</span><span class="tag">&gt;</span></li>
				<li class=""></li>
				<li class="alt">&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet</span><span class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-name</span><span class="tag">&gt;</span>LoginServlet<span
					class="tag">&lt;/</span><span class="tag-name">servlet-name</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-class</span><span class="tag">&gt;</span>com.liuyanzhao.LoginServlet<span
					class="tag">&lt;/</span><span class="tag-name">servlet-class</span><span
					class="tag">&gt;</span></li>
				<li class="">&nbsp;<span class="tag">&lt;/</span><span
					class="tag-name">servlet</span><span class="tag">&gt;</span></li>
				<li class="alt">&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-mapping</span><span class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments">&lt;!--&nbsp;映射为&nbsp;IndexServlet&nbsp;--&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">servlet-name</span><span class="tag">&gt;</span>LoginServlet<span
					class="tag">&lt;/</span><span class="tag-name">servlet-name</span><span
					class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">url-pattern</span><span class="tag">&gt;</span>/LoginServlet<span
					class="tag">&lt;/</span><span class="tag-name">url-pattern</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;<span class="tag">&lt;/</span><span
					class="tag-name">servlet-mapping</span><span class="tag">&gt;</span></li>
			</ol>
		</div>
		<p>4、运行 Tomcat 服务器，打开浏览器，访问&nbsp;http://localhost:8080/CheckCode</p>
		<p>效果如下</p>
		<p>
			<img src="/uploads/2017/10/20171007155723341.png"
				alt="20171007155723341.png"><br>
		</p>
		<p>验证码不区分大小写，点击 “看不清楚”可以更换</p>
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