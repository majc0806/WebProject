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
		<h1>Mybatis高级映射多对多查询</h1>
	</div>
	<div class="jumbotron col-md-8 col-md-offset-2">
		<p>
			紧接着上一篇文章：<a href="https://liuyanzhao.com/5847.html" target="_blank"
				rel="noopener noreferrer">Mybatis高级映射一对多查询</a>&nbsp;写
		</p>
		<h2>一、开发准备</h2>
		<p>
			<strong>1、新建数据表（四张表）和添加测试数据</strong>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-sql" start="1">
				<li class="alt"><span class="keyword">DROP</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;IF&nbsp;EXISTS&nbsp;`items`;</li>
				<li class=""><span class="keyword">DROP</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;IF&nbsp;EXISTS&nbsp;`orders`;</li>
				<li class="alt"><span class="keyword">DROP</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;IF&nbsp;EXISTS&nbsp;`<span
					class="func">user</span>`;</li>
				<li class=""><span class="keyword">DROP</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;IF&nbsp;EXISTS&nbsp;`orderdetail`;</li>
				<li class="alt"></li>
				<li class="">/*items是商品表*/</li>
				<li class="alt"><span class="keyword">CREATE</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;`items`&nbsp;(</li>
				<li class="">&nbsp;&nbsp;`id`&nbsp;<span class="keyword">INT</span>(11)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;AUTO_INCREMENT,
				</li>
				<li class="alt">&nbsp;&nbsp;`<span class="keyword">name</span>`&nbsp;<span
					class="keyword">VARCHAR</span>(32)&nbsp;<span class="op">NOT</span>&nbsp;<span
					class="op">NULL</span>&nbsp;COMMENT&nbsp;'商品名称',
				</li>
				<li class="">&nbsp;&nbsp;`price`&nbsp;<span class="keyword">FLOAT</span>(10,1)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'商品定价',
				</li>
				<li class="alt">&nbsp;&nbsp;`detail`&nbsp;TEXT&nbsp;COMMENT&nbsp;'商品描述',</li>
				<li class="">&nbsp;&nbsp;`pic`&nbsp;<span class="keyword">VARCHAR</span>(64)&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'商品图片',
				</li>
				<li class="alt">&nbsp;&nbsp;`createtime`&nbsp;DATETIME&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'生产日期',
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">PRIMARY</span>&nbsp;<span
					class="keyword">KEY</span>&nbsp;(`id`)
				</li>
				<li class="alt">)&nbsp;ENGINE=INNODB&nbsp;AUTO_INCREMENT=4&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;CHARSET=utf8;
				</li>
				<li class=""></li>
				<li class="alt">/*<span class="func">user</span>是用户表*/
				</li>
				<li class=""><span class="keyword">CREATE</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;`<span class="func">user</span>`&nbsp;(</li>
				<li class="alt">&nbsp;&nbsp;`id`&nbsp;<span class="keyword">INT</span>(11)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;AUTO_INCREMENT,
				</li>
				<li class="">&nbsp;&nbsp;`username`&nbsp;<span class="keyword">VARCHAR</span>(32)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'用户名称',
				</li>
				<li class="alt">&nbsp;&nbsp;`birthday`&nbsp;<span
					class="keyword">DATE</span>&nbsp;<span class="keyword">DEFAULT</span>&nbsp;<span
					class="op">NULL</span>&nbsp;COMMENT&nbsp;'生日',
				</li>
				<li class="">&nbsp;&nbsp;`gender`&nbsp;<span class="keyword">CHAR</span>(1)&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'性别',
				</li>
				<li class="alt">&nbsp;&nbsp;`address`&nbsp;<span
					class="keyword">VARCHAR</span>(256)&nbsp;<span class="keyword">DEFAULT</span>&nbsp;<span
					class="op">NULL</span>&nbsp;COMMENT&nbsp;'地址',
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">PRIMARY</span>&nbsp;<span
					class="keyword">KEY</span>&nbsp;(`id`)
				</li>
				<li class="alt">)&nbsp;ENGINE=INNODB&nbsp;AUTO_INCREMENT=27&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;CHARSET=utf8;
				</li>
				<li class=""></li>
				<li class="alt">/*orders是订单表*/</li>
				<li class=""><span class="keyword">CREATE</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;`orders`&nbsp;(</li>
				<li class="alt">&nbsp;&nbsp;`id`&nbsp;<span class="keyword">INT</span>(11)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;AUTO_INCREMENT,
				</li>
				<li class="">&nbsp;&nbsp;`user_id`&nbsp;<span class="keyword">INT</span>(11)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'下单用户id',
				</li>
				<li class="alt">&nbsp;&nbsp;`number`&nbsp;<span class="keyword">VARCHAR</span>(32)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'订单号',
				</li>
				<li class="">&nbsp;&nbsp;`createtime`&nbsp;DATETIME&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'创建订单时间',
				</li>
				<li class="alt">&nbsp;&nbsp;`note`&nbsp;<span class="keyword">VARCHAR</span>(100)&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'备注',
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">PRIMARY</span>&nbsp;<span
					class="keyword">KEY</span>&nbsp;(`id`),
				</li>
				<li class="alt">&nbsp;&nbsp;<span class="keyword">KEY</span>&nbsp;`FK_orders_1`&nbsp;(`user_id`),
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">CONSTRAINT</span>&nbsp;`FK_orders_id`&nbsp;<span
					class="keyword">FOREIGN</span>&nbsp;<span class="keyword">KEY</span>&nbsp;(`user_id`)&nbsp;<span
					class="keyword">REFERENCES</span>&nbsp;`<span class="func">user</span>`&nbsp;(`id`)&nbsp;<span
					class="keyword">ON</span>&nbsp;<span class="keyword">DELETE</span>&nbsp;<span
					class="keyword">NO</span>&nbsp;<span class="keyword">ACTION</span>&nbsp;<span
					class="keyword">ON</span>&nbsp;<span class="keyword">UPDATE</span>&nbsp;<span
					class="keyword">NO</span>&nbsp;<span class="keyword">ACTION</span></li>
				<li class="alt">)&nbsp;ENGINE=INNODB&nbsp;AUTO_INCREMENT=6&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;CHARSET=utf8;
				</li>
				<li class=""></li>
				<li class="alt">/*orderdetail是订单明细表*/</li>
				<li class=""><span class="keyword">DROP</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;IF&nbsp;EXISTS&nbsp;orderdetail;</li>
				<li class="alt"><span class="keyword">CREATE</span>&nbsp;<span
					class="keyword">TABLE</span>&nbsp;`orderdetail`&nbsp;(</li>
				<li class="">&nbsp;&nbsp;`id`&nbsp;<span class="keyword">INT</span>(11)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;AUTO_INCREMENT,
				</li>
				<li class="alt">&nbsp;&nbsp;`orders_id`&nbsp;<span
					class="keyword">INT</span>(11)&nbsp;<span class="op">NOT</span>&nbsp;<span
					class="op">NULL</span>&nbsp;COMMENT&nbsp;'订单id',
				</li>
				<li class="">&nbsp;&nbsp;`items_id`&nbsp;<span class="keyword">INT</span>(11)&nbsp;<span
					class="op">NOT</span>&nbsp;<span class="op">NULL</span>&nbsp;COMMENT&nbsp;'商品id',
				</li>
				<li class="alt">&nbsp;&nbsp;`items_num`&nbsp;<span
					class="keyword">INT</span>(11)&nbsp;<span class="keyword">DEFAULT</span>&nbsp;<span
					class="op">NULL</span>&nbsp;COMMENT&nbsp;'商品购买数量',
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">PRIMARY</span>&nbsp;<span
					class="keyword">KEY</span>&nbsp;(`id`),
				</li>
				<li class="alt">&nbsp;&nbsp;<span class="keyword">KEY</span>&nbsp;`FK_orderdetail_1`&nbsp;(`orders_id`),
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">KEY</span>&nbsp;`FK_orderdetail_2`&nbsp;(`items_id`),
				</li>
				<li class="alt">&nbsp;&nbsp;<span class="keyword">CONSTRAINT</span>&nbsp;`FK_orderdetail_1`&nbsp;<span
					class="keyword">FOREIGN</span>&nbsp;<span class="keyword">KEY</span>&nbsp;(`orders_id`)&nbsp;<span
					class="keyword">REFERENCES</span>&nbsp;`orders`&nbsp;(`id`)&nbsp;<span
					class="keyword">ON</span>&nbsp;<span class="keyword">DELETE</span>&nbsp;<span
					class="keyword">NO</span>&nbsp;<span class="keyword">ACTION</span>&nbsp;<span
					class="keyword">ON</span>&nbsp;<span class="keyword">UPDATE</span>&nbsp;<span
					class="keyword">NO</span>&nbsp;<span class="keyword">ACTION</span>,
				</li>
				<li class="">&nbsp;&nbsp;<span class="keyword">CONSTRAINT</span>&nbsp;`FK_orderdetail_2`&nbsp;<span
					class="keyword">FOREIGN</span>&nbsp;<span class="keyword">KEY</span>&nbsp;(`items_id`)&nbsp;<span
					class="keyword">REFERENCES</span>&nbsp;`items`&nbsp;(`id`)&nbsp;<span
					class="keyword">ON</span>&nbsp;<span class="keyword">DELETE</span>&nbsp;<span
					class="keyword">NO</span>&nbsp;<span class="keyword">ACTION</span>&nbsp;<span
					class="keyword">ON</span>&nbsp;<span class="keyword">UPDATE</span>&nbsp;<span
					class="keyword">NO</span>&nbsp;<span class="keyword">ACTION</span></li>
				<li class="alt">)&nbsp;ENGINE=INNODB&nbsp;AUTO_INCREMENT=5&nbsp;<span
					class="keyword">DEFAULT</span>&nbsp;CHARSET=utf8;
				</li>
			</ol>
		</div>
		<p>为了测试，我这里随便填了些数据</p>
		<p>
			<img src="/uploads/2017/10/20171007155334244.png"
				alt="20171007155334244.png"><br>
		</p>
		<p>
			<img src="/uploads/2017/10/20171007155349805.png"
				alt="20171007155349805.png"><br>
		</p>
		<p>
			<br>
		</p>
		<p>
			<img src="/uploads/2017/10/20171007155410485.png"
				alt="20171007155410485.png"><br>
		</p>
		<p>
			<br>
		</p>
		<p>
			<strong><img src="/uploads/2017/10/20171007155450773.png"
				alt="20171007155450773.png"></strong>
		</p>
		<p>
			<strong>2、思路分析</strong>
		</p>
		<p>
			<img src="/uploads/2017/10/20171007155545742.png"
				alt="20171007155545742.png"><br>
		</p>
		<p>订单项和订单明细是一对多的关系，所以本文主要来查询订单表，然后关联订单明细表，这样就有一对多的问题出来了。</p>
		<p>
			<span>因为多对多比较复杂，总公共有四张表，我们先来分析一下思路：</span>
		</p>
		<blockquote>
			<p>
				<span>1、将用户信息映射到User中；</span>
			</p>
			<p>
				<span>2、在User类中添加订单列表属性<code>
						List
						<orders>ordersList</orders>
					</code>，将用户创建的订单映射到ordersList中；
				</span>
			</p>
			<p>
				<span>3、在Orders中添加订单明细列表属性<code>
						List
						<orderdetail>orderDetails</orderdetail>
					</code>，将订单的明细映射到orderDetails中；
				</span>
			</p>
			<p>
				<span>4、在OrderDetail中添加Items属性，将订单明细所对应的商品映射到Items中。</span>
			</p>
		</blockquote>
		<p>经过这样分析后，感觉虽然有点复杂，但是好像不是很难的样子，映射的方法也跟前面的一样，只不过这里表有点多，关系有点复杂。下面来写映射文件：</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-sql" start="1">
				<li class="alt">&lt;<span class="keyword">select</span>&nbsp;id=<span
					class="string">"findUserAndItemsResultMap"</span>&nbsp;resultMap=<span
					class="string">"UserAndItemsResultMap"</span>&gt;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">SELECT</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orders.*,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="func">user</span>.`username`,
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="func">user</span>.`sex`,
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="func">user</span>.`address`,
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.`id`&nbsp;orderdetail_id,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.`items_id`,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.`items_num`,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.`orders_id`,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items.`<span
					class="keyword">name</span>`&nbsp;items_name,
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items.`detail`&nbsp;items_detail,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items.`price`&nbsp;items_price</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">FROM</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orders,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="func">USER</span>,
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">WHERE</span>&nbsp;orders.`user_id`=<span
					class="func">user</span>.`id`&nbsp;<span class="op">AND</span>&nbsp;orders.`id`&nbsp;=&nbsp;orderdetail.`orders_id`&nbsp;<span
					class="op">AND</span>&nbsp;orderdetail.`items_id`=items.`id`
				</li>
				<li class="">
					<!--<span class="keyword"-->select&gt;
				</li>
			</ol>
		</div>
		<p>我们先看一下查询结果：</p>
		<p>
			<img src="/uploads/2017/10/2017100717420134.png"
				alt="2017100717420134.png"><br>
		</p>
		<p>
			<br>
		</p>
		<h2>二、代码实现</h2>
		<p>
			<strong>1、四个持久化类</strong>
		</p>
		<p>① User.java</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao.mybatis.po;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.util.Date;</li>
				<li class=""><span class="keyword">import</span>&nbsp;java.util.List;</li>
				<li class="alt"></li>
				<li class=""><span class="comment">/**</span></li>
				<li class="alt"><span class="comment">&nbsp;*&nbsp;用户的持久类</span></li>
				<li class=""><span class="comment">&nbsp;*/</span></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;User&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;id;&nbsp;<span class="comment">//编号</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;username;&nbsp;<span
					class="comment">//用户名</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;gender;&nbsp;<span
					class="comment">//性别</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;Date&nbsp;birthday;&nbsp;<span
					class="comment">//生日</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;address;&nbsp;<span
					class="comment">//地址</span></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;List<orders>&nbsp;getOrdersList()&nbsp;{</orders></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;ordersList;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setOrdersList(List<orders>&nbsp;ordersList)&nbsp;{</orders></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.ordersList&nbsp;=&nbsp;ordersList;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">//用户创建的订单列表</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;List<orders>&nbsp;ordersList;</orders></li>
				<li class=""></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getId()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setId(<span class="keyword">int</span>&nbsp;id)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.id&nbsp;=&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getUsername()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;username;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setUsername(String&nbsp;username)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.username&nbsp;=&nbsp;username;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getGender()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;gender;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setGender(String&nbsp;gender)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.gender&nbsp;=&nbsp;gender;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Date&nbsp;getBirthday()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;birthday;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setBirthday(Date&nbsp;birthday)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.birthday&nbsp;=&nbsp;birthday;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getAddress()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;address;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setAddress(String&nbsp;address)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.address&nbsp;=&nbsp;address;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">}</li>
			</ol>
		</div>
		<p>注意：需要在用户表中加入 订单列表</p>
		<p>&nbsp;</p>
		<p>② Items.java</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao.mybatis.po;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.util.Date;</li>
				<li class=""></li>
				<li class="alt"><span class="comment">/**</span></li>
				<li class=""><span class="comment">&nbsp;*&nbsp;商品的持久类</span></li>
				<li class="alt"><span class="comment">&nbsp;*/</span></li>
				<li class=""><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Items&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;name;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">double</span>&nbsp;price;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;detail;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;pic;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;Date&nbsp;createTime;
				</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getId()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setId(<span class="keyword">int</span>&nbsp;id)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.id&nbsp;=&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getName()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;name;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setName(String&nbsp;name)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.name&nbsp;=&nbsp;name;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">double</span>&nbsp;getPrice()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;price;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setPrice(<span class="keyword">double</span>&nbsp;price)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.price&nbsp;=&nbsp;price;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getDetail()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;detail;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setDetail(String&nbsp;detail)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.detail&nbsp;=&nbsp;detail;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getPic()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;pic;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setPic(String&nbsp;pic)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.pic&nbsp;=&nbsp;pic;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Date&nbsp;getCreateTime()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;createTime;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setCreateTime(Date&nbsp;createTime)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.createTime&nbsp;=&nbsp;createTime;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
			</ol>
		</div>
		<p>&nbsp;</p>
		<p>③ Orders.java</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao.mybatis.po;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.util.Date;</li>
				<li class=""><span class="keyword">import</span>&nbsp;java.util.List;</li>
				<li class="alt"></li>
				<li class=""><span class="comment">/**</span></li>
				<li class="alt"><span class="comment">&nbsp;*&nbsp;订单的持久类和扩展类</span></li>
				<li class=""><span class="comment">&nbsp;*/</span></li>
				<li class="alt"><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Orders&nbsp;{</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;id;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;userId;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;number;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;Date&nbsp;createTime;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;String&nbsp;note;
				</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">//订单明细</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;List<orderdetail>&nbsp;orderdetails;</orderdetail></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;List<orderdetail>&nbsp;getOrderdetails()&nbsp;{</orderdetail></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;orderdetails;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setOrderdetails(List<orderdetail>&nbsp;orderdetails)&nbsp;{</orderdetail></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.orderdetails&nbsp;=&nbsp;orderdetails;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getId()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setId(<span class="keyword">int</span>&nbsp;id)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.id&nbsp;=&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getUserId()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;userId;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setUserId(<span class="keyword">int</span>&nbsp;userId)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.userId&nbsp;=&nbsp;userId;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getNumber()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;number;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setNumber(String&nbsp;number)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.number&nbsp;=&nbsp;number;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Date&nbsp;getCreateTime()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;createTime;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setCreateTime(Date&nbsp;createTime)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.createTime&nbsp;=&nbsp;createTime;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;String&nbsp;getNote()&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;note;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setNote(String&nbsp;note)&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.note&nbsp;=&nbsp;note;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
			</ol>
		</div>
		<p>注意：订单列表中，需要订单的详细信息，不需要用户信息</p>
		<p>&nbsp;</p>
		<p>④ Orderdetail.java</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao.mybatis.po;</li>
				<li class=""></li>
				<li class="alt"><span class="comment">/**</span></li>
				<li class=""><span class="comment">&nbsp;*&nbsp;订单明细的持久类</span></li>
				<li class="alt"><span class="comment">&nbsp;*/</span></li>
				<li class=""><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;Orderdetail&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;id;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;ordersId;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;itemsId;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;<span
					class="keyword">int</span>&nbsp;itemsNum;
				</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">//明细对应的商品信息</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private</span>&nbsp;Items&nbsp;items;
				</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;Items&nbsp;getItems()&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;items;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setItems(Items&nbsp;items)&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.items&nbsp;=&nbsp;items;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getId()&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;id;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setId(<span class="keyword">int</span>&nbsp;id)&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.id&nbsp;=&nbsp;id;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getOrdersId()&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;ordersId;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setOrdersId(<span class="keyword">int</span>&nbsp;ordersId)&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.ordersId&nbsp;=&nbsp;ordersId;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getItemsId()&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;itemsId;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setItemsId(<span class="keyword">int</span>&nbsp;itemsId)&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.itemsId&nbsp;=&nbsp;itemsId;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">int</span>&nbsp;getItemsNum()&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">return</span>&nbsp;itemsNum;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setItemsNum(<span class="keyword">int</span>&nbsp;itemsNum)&nbsp;{
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="keyword">this</span>.itemsNum&nbsp;=&nbsp;itemsNum;
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="">}</li>
			</ol>
		</div>
		<p>注意：订单明细里，需要 商品信息</p>
		<p>&nbsp;</p>
		<p>
			<strong>2、订单代理 即mapper.java</strong>
		</p>
		<p>OrdersMapperCustom.java</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao.mybatis.mapper;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;com.liuyanzhao.mybatis.po.User;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.util.List;</li>
				<li class=""></li>
				<li class="alt"><span class="comment">/**</span></li>
				<li class=""><span class="comment">&nbsp;*&nbsp;订单&nbsp;mapper</span></li>
				<li class="alt"><span class="comment">&nbsp;*/</span></li>
				<li class=""><span class="keyword">public</span>&nbsp;<span
					class="keyword">interface</span>&nbsp;OrdersMapperCustom&nbsp;{</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">//查询用户购买的商品信息</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;List<user>&nbsp;findUserAndItemsResultMap()&nbsp;<span
						class="keyword">throws</span>&nbsp;Exception;</user></li>
				<li class="">}</li>
			</ol>
		</div>
		<p>&nbsp;</p>
		<p>
			<span><strong>3、OrdersMapperCustom.xml &nbsp;
					&nbsp;映射文件</strong></span>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-xml" start="1">
				<li class="alt"><span class="tag"> <!--?</span--> <span
						class="tag-name">xml</span>&nbsp;<span class="attribute">version</span>=<span
						class="attribute-value">"1.0"</span>&nbsp;<span class="attribute">encoding</span>=<span
						class="attribute-value">"UTF-8"</span>&nbsp;<span class="tag">?&gt;</span>
				</span></li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUBLIC&nbsp;"-//mybatis.org//DTD&nbsp;Mapper&nbsp;3.0//EN"</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"http://mybatis.org/dtd/mybatis-3-mapper.dtd"<span
					class="tag">&gt;</span></li>
				<li class="alt"></li>
				<li class=""><span class="tag">&lt;</span><span
					class="tag-name">mapper</span>&nbsp;<span class="attribute">namespace</span>=<span
					class="attribute-value">"com.liuyanzhao.mybatis.mapper.OrdersMapperCustom"</span><span
					class="tag">&gt;</span></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="comments">
						<!--查询用户购买的商品-->
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">resultMap</span>&nbsp;<span class="attribute">id</span>=<span
					class="attribute-value">"UserAndItemsResultMap"</span>&nbsp;<span
					class="attribute">type</span>=<span class="attribute-value">"com.liuyanzhao.mybatis.po.User"</span><span
					class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--用户信息-->
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">id</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"user_id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"id"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">id</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"username"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"username"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"gender"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"gender"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"address"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"address"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt"></li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--订单信息-->
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--一个用户可以对应多个订单，故使用collection映射-->
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">collection</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"ordersList"</span>&nbsp;<span
					class="attribute">ofType</span>=<span class="attribute-value">"com.liuyanzhao.mybatis.po.Orders"</span><span
					class="tag">&gt;</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">id</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"id"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">id</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"user_id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"userId"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"number"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"number"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"createtime"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"createTime"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"node"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"node"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--订单明细-->
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--一个订单包括多个明细，故使用collection-->
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">collection</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"orderdetails"</span>&nbsp;<span
					class="attribute">ofType</span>=<span class="attribute-value">"com.liuyanzhao.mybatis.po.Orderdetail"</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">id</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"orderdetail_id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"id"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">id</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"items_id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"itemsId"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"items_num"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"itemsNum"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"orders_id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"ordersId"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--商品信息-->
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comments"> <!--一个订单明细对应一个商品-->
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">association</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"items"</span>&nbsp;<span
					class="attribute">javaType</span>=<span class="attribute-value">"com.liuyanzhao.mybatis.po.Items"</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">id</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"items_id"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"id"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">id</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"items_name"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"name"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"items_price"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"price"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag">&lt;</span><span class="tag-name">result</span>&nbsp;<span
					class="attribute">column</span>=<span class="attribute-value">"items_detail"</span>&nbsp;<span
					class="attribute">property</span>=<span class="attribute-value">"detail"</span><span
					class="tag">&gt;</span><span class="tag"> <!--</span--> <span
						class="tag-name">result</span><span class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag"> <!--</span--> <span class="tag-name">association</span><span
						class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag"> <!--</span--> <span class="tag-name">collection</span><span
						class="tag">&gt;</span>
				</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="tag"> <!--</span--> <span class="tag-name">collection</span><span
						class="tag">&gt;</span>
				</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">
						<!--</span--> <span class="tag-name">resultMap</span><span
						class="tag">&gt;</span>
				</span></li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span
					class="tag-name">select</span>&nbsp;<span class="attribute">id</span>=<span
					class="attribute-value">"findUserAndItemsResultMap"</span>&nbsp;<span
					class="attribute">resultMap</span>=<span class="attribute-value">"UserAndItemsResultMap"</span><span
					class="tag">&gt;</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SELECT</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orders.*,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;user.username,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;user.gender,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;user.address,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.id&nbsp;orderdetail_id,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.items_id,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.items_num,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail.orders_id,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items.name&nbsp;items_name,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items.detail&nbsp;items_detail,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items.price&nbsp;items_price</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FROM</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orders,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;user,</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orderdetail,</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;items</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WHERE&nbsp;<span
					class="attribute">orders.user_id</span>=user.id&nbsp;AND&nbsp;<span
					class="attribute">orders.id</span>&nbsp;=&nbsp;<span
					class="attribute-value">orderdetail</span>.orders_id&nbsp;AND&nbsp;<span
					class="attribute">orderdetail.items_id</span>=items.id
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">
						<!--</span--> <span class="tag-name">select</span><span
						class="tag">&gt;</span>
				</span></li>
				<li class=""></li>
				<li class="alt"><span class="tag"> <!--</span--> <span
						class="tag-name">mapper</span><span class="tag">&gt;</span>
				</span></li>
			</ol>
		</div>
		<p>&nbsp;</p>
		<p>
			<span>4、测试类 OrderMapperCustomTest.java</span>
		</p>
		<div class="dp-highlighter">
			<div class="bar"></div>
			<ol class="dp-j" start="1">
				<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao.mybatis.test;</li>
				<li class=""></li>
				<li class="alt"><span class="keyword">import</span>&nbsp;com.liuyanzhao.mybatis.mapper.OrdersMapperCustom;</li>
				<li class=""><span class="keyword">import</span>&nbsp;com.liuyanzhao.mybatis.po.User;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;org.apache.ibatis.io.Resources;</li>
				<li class=""><span class="keyword">import</span>&nbsp;org.apache.ibatis.session.SqlSession;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;org.apache.ibatis.session.SqlSessionFactory;</li>
				<li class=""><span class="keyword">import</span>&nbsp;org.apache.ibatis.session.SqlSessionFactoryBuilder;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;org.junit.Before;</li>
				<li class=""><span class="keyword">import</span>&nbsp;org.junit.Test;</li>
				<li class="alt"></li>
				<li class=""><span class="keyword">import</span>&nbsp;java.io.InputStream;</li>
				<li class="alt"><span class="keyword">import</span>&nbsp;java.util.List;</li>
				<li class=""></li>
				<li class="alt"><span class="comment">/**</span></li>
				<li class=""><span class="comment">&nbsp;*&nbsp;Created&nbsp;by&nbsp;Liu_Yanzhao&nbsp;on&nbsp;2017/8/12.</span></li>
				<li class="alt"><span class="comment">&nbsp;*/</span></li>
				<li class=""><span class="keyword">public</span>&nbsp;<span
					class="keyword">class</span>&nbsp;OrderMapperCustomTest&nbsp;{</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;SqlSessionFactory&nbsp;sqlSessionFactory;</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="annotation">@Before</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;setUp()&nbsp;<span class="keyword">throws</span>&nbsp;Exception&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;resource&nbsp;=&nbsp;<span
					class="string">"Configuration.xml"</span>;
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InputStream&nbsp;inputStream&nbsp;=&nbsp;Resources.getResourceAsStream(resource);</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sqlSessionFactory&nbsp;=&nbsp;<span
					class="keyword">new</span>&nbsp;SqlSessionFactoryBuilder()
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.build(inputStream);</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class=""></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="annotation">@Test</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public</span>&nbsp;<span
					class="keyword">void</span>&nbsp;testFindUserAndItemsResultMap()&nbsp;<span
					class="keyword">throws</span>&nbsp;Exception&nbsp;{
				</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SqlSession&nbsp;sqlSession&nbsp;=&nbsp;sqlSessionFactory.openSession();</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comment">//创建代理对象</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OrdersMapperCustom&nbsp;ordersMapperCustom&nbsp;=&nbsp;sqlSession.getMapper(OrdersMapperCustom.<span
					class="keyword">class</span>);
				</li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comment">//调用mapper对象</span></li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;List<user>&nbsp;list&nbsp;=&nbsp;ordersMapperCustom.findUserAndItemsResultMap();</user></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(list);</li>
				<li class="alt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="comment">//释放资源</span></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sqlSession.close();</li>
				<li class="alt"></li>
				<li class="">&nbsp;&nbsp;&nbsp;&nbsp;}</li>
				<li class="alt">}</li>
			</ol>
		</div>
		<p>还有其他文件就不补充了，如 mybatis 全局配置文件</p>
		<p>&nbsp;</p>
		<h2>小结</h2>
		<p>
			<span>这样多对多的映射就搞定了。不过还有个问题，就是这里多对多的查询会把所有关联的表的信息都查询出来，然后放到pojo中的对应的List或者某个类中，所以即使我只查了个用户信息，但是这个用户里包含了订单，订单项，商品等信息，感觉装的有点多，好像有时候并不需要这么多冗余的数据出来，但是如果用resultType的话查询出来的字段必须对应pojo中的属性，如果有List等，需要手动装入才行。所以下面总结一下对于这种查询数据比较多的时候，resultType和resultMap各有什么作用？</span>
		</p>
		<blockquote>
			<ol>
				<li>比如我们只需要将查询用户购买的商品信息明细清单（如用户名、用户地址、购买商品名称、购买商品时间、购买商品数量），那么我们完全不需要其他的信息，这个时候就没必要使用resultMap将所有的信息都搞出来，我们可以自己定义一个pojo，包含我们需要的字段即可，然后查询语句只查询我们需要的字段，这样使用resultType会方便很多。</li>
				<li>如果我们需要查询该用户的所有详细信息，比如用户点击该用户或者鼠标放上去，会出来跟该用户相关的订单啊，订单明细啊，商品啊之类的，然后我们要点进去看下详细情况的时候，那就需要使用resultMap了，必须将所有信息都装到这个User中，然后具体啥信息再从User中取，很好理解。</li>
				<li>总结一点：使用resultMap是针对那些对查询结果映射有特殊要求的功能，，比如特殊要求映射成list中包括多个list。否则使用resultType比较直接。</li>
			</ol>
		</blockquote>
		<p>
			<span>到这里，mybatis的多对多映射就总结完了。&nbsp;</span>
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