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
			<a class="navbar-brand" href="#" id="emp_id_a"><%=empName%></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="link1"><a href="javascript:link1();">部门动态(link1)</a></li>
				<li id="link2"><a href="javascript:link2();">技术好文(link2)</a></li>
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">更多 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="http://www.yuntiy.com/">科技头条</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="EmpInfo.jsp">个人信息</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout();">退出登录</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 显示表格数据 -->
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<table class="table table-hover table-bordered" id="emps_table">
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>密码</th>
						<th>部门</th>
						<th>修改</th>
					</tr>
				</thead>
				<tbody>
					<td id="emp_id_td"></td>
					<td id="emp_name_td"></td>
					<td id="emp_gender_td"></td>
					<td id="emp_email_td"></td>
					<td id="emp_password_td"></td>
					<td id="emp_dept_td"></td>
					<td><button class="btn btn-info btn-sm edit_btn">
							<span class="glyphicon glyphicon-pencil"></span>编辑
						</button></td>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 员工修改的模态框	 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改员工信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp_update_form">
						<div class="form-group">
							<label for="empId_update_input" class="col-sm-2 control-label">员工编号</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empId_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="empName_update_input" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="email_update_input" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_update_input" placeholder="example:email@gmail.com">
								<span id="email_helpBlock2" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="empPassword_update_input"
								class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" name="empPassword" class="form-control"
									id="empPassword_update_input" placeholder="输入员工密码"> <span
									id="empPassword_helpBlock" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="gender_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-4">
								<p class="form-control-static" id="dept_update_static"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">Update</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			getEmp($("#emp_id_a").text());
		});

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

		function getEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "get",
				success : function(result) {
					var empData = result.extend.emp;
					$("#emp_id_td").text(empData.empId);
					$("#emp_name_td").text(empData.empName);
					$("#emp_gender_td").text(empData.gender);
					$("#emp_email_td").text(empData.email);
					$("#emp_password_td").text(empData.empPassword);
					$("#emp_dept_td").text(empData.department.deptName);
				}
			});
		}

		function getEmpUpdate(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "get",
				success : function(result) {
					var empData = result.extend.emp;
					$("#empId_update_static").text(empData.empId);
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empPassword_update_input").val(empData.empPassword);

					$("#gender_update_static").text(empData.gender);
					$("#dept_update_static").text(empData.department.deptName);

				}
			});
		}

		//重置表单
		function reset_form(element) {
			$(element)[0].reset();
			//清空表单样式
			$(element).find("input").parent().removeClass(
					"has-error has-success");
			$(element).find("span").text("");
		}

		//使用jQuery新方法on为编辑按钮绑定事件,保证按钮在创建之后被绑定
		$(document).on("click", ".edit_btn", function() {
			//清除表单数据
			reset_form("#emp_update_form");
			// 			//1.查出部门信息,显示部门列表
			// 			getDepts("#dept_update_select");
			//2.查出员工信息,显示员工信息
			getEmpUpdate($("#emp_id_a").text());
			//3.把员工的id传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id", $("#emp_id_a").text());
			//弹出模态框
			$("#empUpdateModal").modal({
				backdrop : "static"
			});
		});

		//校验表单数据
		function validate_update_form() {

			//3.校验邮箱信息		
			var email = $("#email_update_input").val();
			var regMail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regMail.test(email)) {
				//alert("邮箱格式不正确!");
				show_validate_msg("#email_update_input", false,
						"(前端消息)邮箱格式不正确!");
				return false;
			} else {
				show_validate_msg("#email_update_input", true, "ok");
			}

			var password = $("#empPassword_update_input").val();
			var regexPass = /(.){1,20}$/;
			if (!regexPass.test(password)) {
				show_validate_msg("#empPassword_update_input", false,
						"(前端消息)密码格式不正确!");
				return false;
			} else {
				show_validate_msg("#empPassword_update_input", true, "ok");
			}
			return true;
		}

		//点击更新,更新员工信息
		$("#emp_update_btn").click(function() {
			//1.保存表单中的数据
			//先对要提交给服务器的数据进行校验
			if (!validate_update_form()) {
				return false;
			}
			// 			//1.判断之前的ajax用户名校验是否成功.
			// 			if ($(this).attr("ajax-va") == "error") {
			// 				return false;
			// 			}
			//2.发送ajax请求,保存更新员工数据
			$.ajax({
				url : "${APP_PATH}/emp/" + $(this).attr("edit-id"),
				type : "POST",
				//Tomcat报错:警告: Request method 'POST' not supported
				//追加"&_method=put"
				data : $("#emp_update_form").serialize() + "&_method=put",
				success : function(result) {
					console.log(result);
					//关闭模态框
					$("#empUpdateModal").modal("hide");
					to_page(currentPage);
				}
			});
		});

		//校验方法
		function show_validate_msg(element, status, msg) {
			//清除当前元素校验状态
			$(element).parent().removeClass("has-success has-error");
			$(element).next("span").text("");
			//校验状态
			if (status) {
				$(element).parent().addClass("has-success");
				$(element).next("span").text(msg);
			} else {
				$(element).parent().addClass("has-error");
				$(element).next("span").text(msg);
			}
		}
	</script>
</body>
</html>