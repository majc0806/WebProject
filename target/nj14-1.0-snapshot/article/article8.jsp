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
		<h1>JDBC常用API和使用</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<div class="single-content">
			<h2>一、JDBC 常用 API</h2>
			<p>
				<strong>1、Connection 接口</strong>
			</p>
			<table width="695" class="layui-table">
				<tbody>
					<tr>
						<td>方法名称</td>
						<td>功能描述</td>
					</tr>
					<tr>
						<td>getMetaData()</td>
						<td>该方法用于返回数据库的元数据的 DatabaseMetaData 对象</td>
					</tr>
					<tr>
						<td>createStatement</td>
						<td>用于创建一个 Statement 对象来将 SQL 语句发送到数据库</td>
					</tr>
					<tr>
						<td>preparedStatement(String sql)</td>
						<td>用于创建一个 PreparedStatement 对象来将参数化的SQL语句发送到数据库</td>
					</tr>
					<tr>
						<td>prepareCall(String sql)</td>
						<td>用于创建一个 CallableStatement 对象来调用数据库存储过程</td>
					</tr>
				</tbody>
			</table>
			<p>
				<strong>2、Statement 接口</strong>
			</p>
			<table width="696" class="layui-table">
				<tbody>
					<tr>
						<td>方法名称</td>
						<td>功能描述</td>
					</tr>
					<tr>
						<td>boolean execute(String sql)</td>
						<td>用于执行各种 SQL 语句,该方法返回一个 boolean 类型的值。如果为 true,表示所执行的 SQL
							语句具备查询结果，可通过 Statement 的getResultSet() 方法查询结果</td>
					</tr>
					<tr>
						<td>int executeUpdate(String sql)</td>
						<td>用于执行 SQL 中的 insert、update 和 delete 语句，该方法返回一个 int
							类型的值，表示影响数据库中的行数</td>
					</tr>
					<tr>
						<td>ResultSet executeQuery(String sql)</td>
						<td>用于执行 SQL 中的 select 语句（查询，遍历），该方法返回一个表示查询结果的 ResultSet 对象</td>
					</tr>
				</tbody>
			</table>
			<p>
				<strong>&nbsp;<span>execute是executeQuery和executeUpdate的综合.</span></strong>
			</p>
			<p>
				<strong><span>通常我们没有必要使用execute方法来执行SQL语句，而是使用
						executeQuery 或 executeUpdate 更适合。</span></strong>
			</p>
			<p>
				具体可参考：<a href="https://liuyanzhao.com/5278.html" target="_blank"
					rel="noopener noreferrer">execute、executeUpdate、executeQuery三者的区别</a>
			</p>
			<p>
				<strong>3、PreparedStatement 接口</strong>
			</p>
			<table width="695" class="layui-table">
				<tbody>
					<tr>
						<td>方法名称</td>
						<td>功能描述</td>
					</tr>
					<tr>
						<td>executeUpdate()</td>
						<td>在此 PreparedStatement 对象中执行 SQL 语句，该语句必须是一个 DML
							语句，或者无返回内容的 SQL 语句，比如 DDL 语句</td>
					</tr>
					<tr>
						<td>executeQuery()</td>
						<td>在此 PreparedStatement 对象中执行 SQL 语句，该方法返回的是 ResultSet 对象</td>
					</tr>
					<tr>
						<td>setInt(int parameterIndex, int x)</td>
						<td>将指定的参数设置为 int 值</td>
					</tr>
					<tr>
						<td>setFloat(int parameterIndex, float x)</td>
						<td>将指定的参数设置为 Float 值</td>
					</tr>
					<tr>
						<td>setString(int parameterIndex, String x)</td>
						<td>将指定参数设置的给定的 Date 值</td>
					</tr>
					<tr>
						<td>setDate(int parameterIndex, Date x)</td>
						<td>将指定参数设置给定的 Date 值</td>
					</tr>
					<tr>
						<td>addBatch()</td>
						<td>将一组参数添加到此 PreparedStatement 对象的批处理命令中</td>
					</tr>
					<tr>
						<td>setCharacterStream(parameterIndex, reader, length)</td>
						<td>将指定的输入流写入数据库的文本字段</td>
					</tr>
					<tr>
						<td>setBinaryStream(parameterIndex, x, length)</td>
						<td>将二进制的输入流数据写入到二进制的字段中</td>
					</tr>
				</tbody>
			</table>
			<p>DML 语句：SELECT、UPDATE、INSERT、DELETE</p>
			<p>DLL 语句：CREATE DROP ALERT</p>
			<p>
				具体参考:&nbsp;<a href="https://liuyanzhao.com/5283.html"
					target="_blank" rel="noopener noreferrer">sql语句分为三类(DML,DDL,DCL)-介绍</a>
			</p>
			<p>4、ResultSet 接口</p>
			<table class="layui-table">
				<tbody>
					<tr>
						<td>getString(int columnIndex)</td>
						<td>用于获取 指定字段的 String 类型的值，参数 columnIndex 代表字段的索引</td>
					</tr>
					<tr>
						<td>getString(String columnName)</td>
						<td>&nbsp;用于获取指定字段的 String 类型的值，参数 columnIndex 代表字段名称</td>
					</tr>
					<tr>
						<td>getInt(int columnIndex)</td>
						<td>&nbsp;用于获取指定字段的 int 类型的值，参数 columnIndex 代表字段的索引</td>
					</tr>
					<tr>
						<td>getInt(String columnName)</td>
						<td>&nbsp;用于获取指定字段的 int 类型的值，参数 columnIndex 代表字段名称</td>
					</tr>
					<tr>
						<td>getDate(int columnIndex)</td>
						<td>&nbsp;用于获取指定字段的 Date类型的值，参数 columnIndex 代表字段索引</td>
					</tr>
					<tr>
						<td>getDate(String columnName)</td>
						<td>&nbsp;用于获取指定字段的 Date类型的值，参数 columnIndex 代表字段名称</td>
					</tr>
					<tr>
						<td>next()</td>
						<td>&nbsp;将游标从当前位置移到下一位置</td>
					</tr>
					<tr>
						<td>absolute(int row)</td>
						<td>将游标移到此 ResultSet 对象的指定行</td>
					</tr>
					<tr>
						<td>afterLast()</td>
						<td>将游标移动到此 ResultSet 对象的末尾，即最后一行之后</td>
					</tr>
					<tr>
						<td>beforeFirst()</td>
						<td>将游标移动到此 ResultSet 对象开头，即第一行之前</td>
					</tr>
					<tr>
						<td>previous()</td>
						<td>将游标移动到此 ResultSet 对象的上一行</td>
					</tr>
					<tr>
						<td>last()</td>
						<td>将游标移动到此 &nbsp;Result 对象的最后一行</td>
					</tr>
				</tbody>
			</table>
			<h2>二、案例</h2>
			<p>
				<strong>1、往数据库里添加数据</strong>
			</p>
			<p>① 数据表结构如下</p>
			<p>
				<img src="/uploads/2017/10/2017100715402014.png"
					alt="2017100715402014.png"><br>
			</p>
			<p>
				<span>② 代码如下</span>
			</p>
			<p>
				<span></span>
			</p>
			<div>
				<div class="dp-highlighter">
					<div class="bar"></div>
					<ol start="1" class="dp-j">
						<li class="alt"><span><span class="keyword">package</span><span>&nbsp;com.liuyanzhao;&nbsp;&nbsp;</span></span></li>
						<li class=""><span><span class="keyword">import</span><span>&nbsp;java.sql.Connection;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.sql.Date;&nbsp;&nbsp;</span></span></li>
						<li class=""><span><span class="keyword">import</span><span>&nbsp;java.sql.DriverManager;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.sql.PreparedStatement;&nbsp;&nbsp;</span></span></li>
						<li class=""><span><span class="keyword">import</span><span>&nbsp;java.sql.SQLException;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.text.ParseException;&nbsp;&nbsp;</span></span></li>
						<li class=""><span><span class="keyword">import</span><span>&nbsp;java.text.SimpleDateFormat;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span><span class="comment">/*</span>&nbsp;</span></li>
						<li class=""><span><span class="comment">&nbsp;*&nbsp;@author&nbsp;LiuYanzhao</span>&nbsp;</span></li>
						<li class="alt"><span><span class="comment">&nbsp;*/</span><span>&nbsp;&nbsp;</span></span></li>
						<li class=""><span><span class="keyword">public</span><span>&nbsp;</span><span
								class="keyword">class</span><span>&nbsp;Demo1&nbsp;{&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="keyword">private</span><span>&nbsp;</span><span
								class="keyword">static</span><span>&nbsp;</span><span
								class="keyword">final</span><span>&nbsp;String&nbsp;URL&nbsp;=&nbsp;</span><span
								class="string">"jdbc:mysql://127.0.0.1:3306/jdbc_study?useUnicode=true&amp;characterEncoding=utf8"</span><span>;&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="keyword">private</span><span>&nbsp;</span><span
								class="keyword">static</span><span>&nbsp;</span><span
								class="keyword">final</span><span>&nbsp;String&nbsp;USER&nbsp;=&nbsp;</span><span
								class="string">"root"</span><span>;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="keyword">private</span><span>&nbsp;</span><span
								class="keyword">static</span><span>&nbsp;</span><span
								class="keyword">final</span><span>&nbsp;String&nbsp;PASSWORD&nbsp;=&nbsp;</span><span
								class="string">""</span><span>;&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="keyword">public</span><span>&nbsp;</span><span
								class="keyword">static</span><span>&nbsp;Connection&nbsp;conn&nbsp;=&nbsp;</span><span
								class="keyword">null</span><span>;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="keyword">public</span><span>&nbsp;</span><span
								class="keyword">static</span><span>&nbsp;</span><span
								class="keyword">void</span><span>&nbsp;main(String[]&nbsp;args)&nbsp;</span><span
								class="keyword">throws</span><span>&nbsp;ClassNotFoundException,&nbsp;SQLException,&nbsp;ParseException&nbsp;{&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="comment">//1、加载驱动，需要提前把&nbsp;jar&nbsp;包添加到&nbsp;classpath&nbsp;中</span><span>&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class.forName(<span
								class="string">"com.mysql.jdbc.Driver"</span><span>);&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="comment">//2、创建应用程序与数据库连接的&nbsp;Connection&nbsp;对象</span><span>&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;conn&nbsp;=&nbsp;DriverManager.getConnection(URL,&nbsp;USER,&nbsp;PASSWORD);&nbsp;&nbsp;</span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="comment">//3、要执行的&nbsp;sql&nbsp;语句：name,password,email,status通过占位符填数,create_date&nbsp;自动为当前时间</span><span>&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;sql&nbsp;=&nbsp;<span
								class="string">"&nbsp;INSERT&nbsp;INTO&nbsp;users"</span><span>+&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="string">"(name,password,birthday,email,create_date,status)&nbsp;"</span><span>+&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="string">"VALUES("</span><span>+&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="string">"?,?,?,?,current_date(),?)"</span><span>;&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="comment">//4、创建执行&nbsp;SQL&nbsp;语句的&nbsp;PreparedStatement&nbsp;对象</span><span>&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PreparedStatement&nbsp;ptmt&nbsp;=&nbsp;conn.prepareStatement(sql);&nbsp;&nbsp;</span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptmt.setString(<span
								class="number">1</span><span>,&nbsp;</span><span class="string">"小美"</span><span>);&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptmt.setString(<span
								class="number">2</span><span>,&nbsp;</span><span class="string">"123456"</span><span>);&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptmt.setDate(<span
								class="number">3</span><span>,</span><span class="keyword">new</span><span>&nbsp;Date((</span><span
								class="keyword">new</span><span>&nbsp;SimpleDateFormat(</span><span
								class="string">"yyyy-MM-dd"</span><span>).parse(</span><span
								class="string">"2011-10-1"</span><span>)).getTime())&nbsp;);&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptmt.setString(<span
								class="number">4</span><span>,&nbsp;</span><span class="string">"xiaomei@126.com"</span><span>);&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptmt.setInt(<span
								class="number">5</span><span>,&nbsp;</span><span class="number">1</span><span>);&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="comment">//5、真正执行&nbsp;sql&nbsp;语句，并返回影响的行数</span><span>&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
								class="keyword">int</span><span>&nbsp;x&nbsp;=&nbsp;ptmt.executeUpdate();&nbsp;&nbsp;</span></span></li>
						<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span
								class="string">"影响行数："</span><span>&nbsp;+&nbsp;x);&nbsp;</span><span
								class="comment">//返回1</span><span>&nbsp;&nbsp;</span></span></li>
						<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span></li>
						<li class=""><span>}&nbsp;&nbsp;</span></li>
					</ol>
				</div>
			</div>
			<br>
			<p></p>
			<p>③运行结果</p>
			<p>上面的操作，将在 jdbc_study 数据库的 users 表中添加一条记录，终端显示 1</p>
			<p>
				<strong>2、查询（打印）数据库信息</strong>
			</p>
			<p>①数据表如下</p>
			<p>
				<img src="/uploads/2017/10/20171007154127663.png"
					alt="20171007154127663.png"><br>
			</p>
			<p>
				<span>②代码如下</span>
			</p>
			<p>
				<span></span>
			</p>
			<div>
				<div class="bar"></div>
				<ol start="1" class="dp-j">
					<li class="alt"><span><span class="keyword">package</span><span>&nbsp;com.liuyanzhao;&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="keyword">import</span><span>&nbsp;java.sql.Connection;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.sql.Date;&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="keyword">import</span><span>&nbsp;java.sql.DriverManager;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.sql.PreparedStatement;&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="keyword">import</span><span>&nbsp;java.sql.ResultSet;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.sql.SQLException;&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="keyword">import</span><span>&nbsp;java.text.ParseException;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="keyword">import</span><span>&nbsp;java.text.SimpleDateFormat;&nbsp;&nbsp;</span></span></li>
					<li class=""><span><span class="comment">/*</span>&nbsp;</span></li>
					<li class="alt"><span><span class="comment">&nbsp;*&nbsp;@author&nbsp;LiuYanzhao</span>&nbsp;</span></li>
					<li class=""><span><span class="comment">&nbsp;*/</span><span>&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span><span class="keyword">public</span><span>&nbsp;</span><span
							class="keyword">class</span><span>&nbsp;Demo2&nbsp;{&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="keyword">private</span><span>&nbsp;</span><span
							class="keyword">static</span><span>&nbsp;</span><span
							class="keyword">final</span><span>&nbsp;String&nbsp;URL&nbsp;=&nbsp;</span><span
							class="string">"jdbc:mysql://127.0.0.1:3306/jdbc_study?useUnicode=true&amp;characterEncoding=utf8"</span><span>;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="keyword">private</span><span>&nbsp;</span><span
							class="keyword">static</span><span>&nbsp;</span><span
							class="keyword">final</span><span>&nbsp;String&nbsp;USER&nbsp;=&nbsp;</span><span
							class="string">"root"</span><span>;&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="keyword">private</span><span>&nbsp;</span><span
							class="keyword">static</span><span>&nbsp;</span><span
							class="keyword">final</span><span>&nbsp;String&nbsp;PASSWORD&nbsp;=&nbsp;</span><span
							class="string">""</span><span>;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="keyword">public</span><span>&nbsp;</span><span
							class="keyword">static</span><span>&nbsp;Connection&nbsp;conn&nbsp;=&nbsp;</span><span
							class="keyword">null</span><span>;&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="keyword">public</span><span>&nbsp;</span><span
							class="keyword">static</span><span>&nbsp;</span><span
							class="keyword">void</span><span>&nbsp;main(String[]&nbsp;args)&nbsp;</span><span
							class="keyword">throws</span><span>&nbsp;ClassNotFoundException,&nbsp;SQLException,&nbsp;ParseException&nbsp;{&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comment">//1、加载驱动，需要提前把&nbsp;jar&nbsp;包添加到&nbsp;classpath&nbsp;中</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class.forName(<span
							class="string">"com.mysql.jdbc.Driver"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comment">//2、创建应用程序与数据库连接的&nbsp;Connection&nbsp;对象</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;conn&nbsp;=&nbsp;DriverManager.getConnection(URL,&nbsp;USER,&nbsp;PASSWORD);&nbsp;&nbsp;</span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comment">//3、要执行的&nbsp;sql&nbsp;语句：name,password,email,satic&nbsp;通过占位符填数,create_date&nbsp;自动为当前时间</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;sql&nbsp;=&nbsp;<span
							class="string">"&nbsp;SELECT&nbsp;*&nbsp;FROM&nbsp;users"</span><span>;&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comment">//4、创建执行&nbsp;SQL&nbsp;语句的&nbsp;PreparedStatement&nbsp;对象</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PreparedStatement&nbsp;ptmt&nbsp;=&nbsp;conn.prepareStatement(sql);&nbsp;&nbsp;</span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comment">//5、真正执行&nbsp;sql&nbsp;语句，并返回影响的&nbsp;ResultSet</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ResultSet&nbsp;rs&nbsp;=&nbsp;ptmt.executeQuery();&nbsp;&nbsp;</span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="comment">//6、打印&nbsp;ResultSet&nbsp;数据集</span><span>&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="keyword">while</span><span>(rs.next())&nbsp;{&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getInt(<span
							class="string">"id"</span><span>)+</span><span class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getString(<span
							class="string">"name"</span><span>)+</span><span class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getString(<span
							class="string">"password"</span><span>)+</span><span
							class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getDate(<span
							class="string">"birthday"</span><span>)+</span><span
							class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getString(<span
							class="string">"email"</span><span>)+</span><span class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getDate(<span
							class="string">"create_date"</span><span>)+</span><span
							class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(rs.getInt(<span
							class="string">"status"</span><span>)+</span><span class="string">"&nbsp;"</span><span>);&nbsp;&nbsp;</span></span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println();&nbsp;&nbsp;</span></li>
					<li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span></li>
					<li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span></li>
					<li class="alt"><span>}&nbsp;&nbsp;</span></li>
				</ol>
			</div>
		</div>
		<p>③ 运行结果</p>
		<p></p>
		<p>控制台上可以看到如下界面</p>
		<p>
			<img src="/uploads/2017/10/20171007154222212.jpg"
				alt="20171007154222212.jpg"><br>
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