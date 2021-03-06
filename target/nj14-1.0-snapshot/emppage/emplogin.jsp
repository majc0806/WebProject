<%@page
	import="org.apache.taglibs.standard.lang.jstl.test.PageContextImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工登录</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
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
#form-div {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 30%;
}

#outer {
	position: absolute;
	width: 100%;
	height: 100%;
}

.in-line {
	display: inline-block;
}
</STYLE>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="link1"><a href="javascript:link1();"><span
						class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;管理员登录</a></li>
				<li id="link2" class="active"><a href="javascript:link2();"><span
						class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;员工登录</a></li>
			</ul>
		</div>
	</nav>
	<div id="outer">
		<div id="form-div">
			<div class="col-md-offset-5 col-md-7">
				<h4>请使用员工编号登录</h4>
			</div>
			<div>&nbsp;</div>
			<form class="form-horizontal" action="${APP_PATH}/emplogin.action"
				id="userlogin-form">
				<div class="form-group">
					<label for="inputEmail3" class="col-md-5 control-label">员工编号</label>
					<div class="col-md-2">
						<input type="text" class="form-control" id="inputId"
							placeholder="输入员工编号" name="empId">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-md-5 control-label">密码</label>
					<div class="col-md-2">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="输入密码" name="empPassword">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-5 col-sm-7">
						<button type="button" class="btn btn-primary" id="submit-btn">
							<span class="glyphicon glyphicon-plane" aria-hidden="true"></span>&nbsp;登录
						</button>
						<button type="reset" class="btn btn-primary" id="reset-btn">
							<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>&nbsp;重置
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//提交按钮
		$("#submit-btn").click(function() {
			var regex = /^[0-9]{1,10}$/;
			var id = $("#inputId").val();
			if (regex.test(id)) {
				$("#userlogin-form").submit();
			} else {
				alert("请输入id(数字)");
			}
		});

		function link1() {
			$("#link1").addClass("active");
			$("#link2").removeClass("active");
			window.location.href = "../login.jsp";
		}

		function link2() {
			$("#link2").addClass("active");
			$("#link1").removeClass("active");
			window.location.href = "emplogin.jsp";
		}
	</script>
</body>
</html>