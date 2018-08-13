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
<title>员工管理</title>
<%
	boolean flag = (session.getAttribute("adminIsLogin") == null
			|| !session.getAttribute("adminIsLogin").equals("true"));
	if (flag) {
		response.sendRedirect("login.jsp");
	}
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String adminName = (String) session.getAttribute("adminName");
	System.out.println(session.getAttribute("adminIsLogin"));
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
			<a class="navbar-brand" href="#"><%=adminName%></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="link1" class="active"><a href="javascript:link1();">员工管理</a></li>
				<li id="link2"><a href="javascript:link2();">部门管理</a></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="搜索员工编号"
						id="emp_search_input">
				</div>
				<button type="button" class="btn btn-default" id="emp_search_btn">搜索</button>
			</form>
			<div>
				<ul class="nav navbar-nav">
					<li id="emp-add"><a href="javascript:link3();">添加员工</a></li>
					<li id="emp-delete-batch"><a href="javascript:link4();">批量删除</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript:logout();">退出登录</a></li>
				</ul>
			</div>
		</div>
	</nav>
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
								<input type="text" name="empName" class="form-control"
									id="empName_update_input" placeholder="输入员工姓名"> <span
									id="empName_helpBlock2" class="help-block"></span>
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
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-4">
								<!-- 提交部门id即可 -->
								<select class="form-control" name="dId" id="dept_update_select">
									<!-- <option>请选择部门</option> -->
								</select>
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


	<!-- 员工添加的模态框	 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp_add_form">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_add_input" placeholder="请输入员工姓名"><span
									id="empName_helpBlock" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_add_input" placeholder="例:email@gmail.com"> <span
									id="email_helpBlock" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-4">
								<!-- 提交部门id即可 -->
								<select class="form-control" name="dId" id="dept_add_select">
									<!-- <option>请选择部门</option> -->
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 关闭
					</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">
						<span class=" glyphicon glyphicon-ok"></span> 保存
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h3>员工信息管理</h3>
			</div>
		</div>

		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-bordered" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>编号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>邮箱</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="clo-md-6" id="page_nav_area" style="text-align: right"></div>
		</div>
	</div>
	<script type="text/javascript">
		//总记录数
		var totalRecord;
		//当前页面
		var currentPage;

		$(function() {
			//加深导航条
			$("#emp-li").addClass("active");
			to_page(1);
		});
		//1.页面加载完成以后, 直接发送一个Ajax请求, 要到分页数据
		function to_page(pn) {
			$.ajax({
				//json数据所在的url
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析显示分页条数据
					build_page_nav(result);
				}
			});
		}

		//显示员工列表
		function build_emps_table(result) {
			//清空table表格
			$("#emps_table tbody").empty();
			$("#check_all").prop("checked", false);
			var emps = result.extend.pageInfo.list;
			$
					.each(
							emps,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var empIdTd = $("<td></td>").append(item.empId);
								var empNameTd = $("<td></td>").append(
										item.empName);
								var genderTd = $("<td></td>").append(
										item.gender == "M" ? "男" : "女");
								var emailTd = $("<td></td>").append(item.email);
								var deptNameTd = $("<td></td>").append(
										item.department.deptName);
								var editBtn = $("<button></button>").addClass(
										"btn btn-info btn-sm edit_btn").append(
										$("<span></span>").addClass(
												"glyphicon glyphicon-pencil"))
										.append(" 编辑");
								//为编辑按钮添加一个自定义的属性,来表示当前于员工的id
								editBtn.attr("edit-id", item.empId);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-warning btn-sm delete_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append(" 删除");
								//为删除按钮添加一个自定义的属性,来表示当前于员工的id
								delBtn.attr("del-id", item.empId);
								var btnTd = $("<td></td>").append(editBtn)
										.append(" ").append(delBtn);
								$("<tr></tr>").append(checkBoxTd).append(
										empIdTd).append(empNameTd).append(
										genderTd).append(emailTd).append(
										deptNameTd).append(btnTd).appendTo(
										"#emps_table tbody");
							});
		}
		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前第" + result.extend.pageInfo.pageNum + "页," + "共"
							+ result.extend.pageInfo.pages + "页,"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}

		//解析显示分页条,并完成相应的点击事件
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			//位于首页时,不可点击首页和上一页
			if (!result.extend.pageInfo.hasPreviousPage) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为首页和上一页添加鼠标事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.prePage);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			//位于末页时,不可点击下一页和末页
			if (!result.extend.pageInfo.hasNextPage) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				//为末页和下一页添加鼠标事件
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.nextPage);
				});
			}

			//添加首页和上一页
			ul.append(firstPageLi).append(prePageLi);
			//遍历的是页码号,给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				//高亮当前页码
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				//绑定单击事件
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页
			ul.append(nextPageLi).append(lastPageLi);
			//把ul加入nav
			var navEla = $("<nav></nav>").append(ul);
			navEla.appendTo("#page_nav_area");
		}

		//重置表单
		function reset_form(element) {
			$(element)[0].reset();
			//清空表单样式
			$(element).find("input").parent().removeClass(
					"has-error has-success");
			$(element).find("span").text("");
		}

		//查出部门信息,显示在下拉列表中
		function getDepts(element) {
			$(element).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "get",
				success : function name(result) {
					//console.log(result);
					//显示部门信息在下拉列表中
					$.each(result.extend.depts, function() {
						var optionEle = $("<option></option>").append(
								this.deptName).attr("value", this.deptId);
						optionEle.appendTo(element);
					});
				}
			});
		}

		//后端检查员工名是否可用(针对添加)
		$("#empName_add_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var empName = this.value;
					$.ajax({
						url : "${APP_PATH}/checkuser",
						data : "empName=" + empName,
						type : "post",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#empName_add_input", true,
										"(后端消息)用户名可用");
								$("#emp_save_btn").attr("ajax-va", "success");
							} else {
								show_validate_msg("#empName_add_input", false,
										result.extend.va_msg);
								$("#emp_save_btn").attr("ajax-va", "error");
							}
						}
					});
				});

		//保存员工
		$("#emp_save_btn")
				.click(
						function() {
							//1.保存表单中的数据
							//先对要提交给服务器的数据进行校验
							if (!validate_add_form()) {
								return false;
							}
							//1.判断之前的ajax用户名校验是否成功.
							if ($(this).attr("ajax-va") == "error") {
								return false;
							}
							alert($("#emp_add_form").serialize());
							//2.发送ajax请求保存员工
							$
									.ajax({
										url : "${APP_PATH}/emp",
										type : "post",
										data : $("#emp_add_form").serialize(),
										success : function(result) {
											//校验成功
											if (result.code == 100) {
												//1.关闭模态框
												$("#empAddModal").modal("hide");
												//2.来到最后一页,显示刚才保存的数据
												//发送ajax请求,显示最后一页数据
												to_page(totalRecord);
											} else {
												if (undefined != result.extend.errorFields.email) {
													//显示邮箱错误信息
													show_validate_msg(
															"#email_add_input",
															false,
															result.extend.errorFields.email);
												}
												if (undefined != result.extend.errorFields.empName) {
													//显示员工名字错误信息
													show_validate_msg(
															"#empName_add_input",
															false,
															result.extend.errorFields.empName);
												}

											}
										}
									});
						});

		//校验表单数据
		function validate_add_form() {
			// 			//1.校验id
			// 			var empId = $("#empId_add_input").val();
			// 			var regName = /^[0-9]{1,10}$/;
			// 			if (!regName.test(empId)) {
			// 				show_validate_msg("#empId_add_input", false,
			// 						"(前端消息)员工编号为1-10位数字");
			// 				return false;
			// 			} else {
			// 				show_validate_msg("#empId_add_input", true, "ok");
			// 			}

			//2.拿到要校验的数据,使用正则表达式
			//校验用户名
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
			if (!regName.test(empName)) {
				//alert("用户名为2-5位中文或6-16位英文和数字组合,包括-_");
				show_validate_msg("#empName_add_input", false,
						"(前端消息)用户名为2-5位中文或6-16位英文和数字组合,包括-_");
				return false;
			} else {
				show_validate_msg("#empName_add_input", true, "ok");
			}

			//3.校验邮箱信息		
			var email = $("#email_add_input").val();
			var regMail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regMail.test(email)) {
				//alert("邮箱格式不正确!");
				show_validate_msg("#email_add_input", false, "(前端消息)邮箱格式不正确!");
				return false;
			} else {
				show_validate_msg("#email_add_input", true, "ok");
			}

			return true;
		}

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

		//单个删除按钮事件
		$(document).on("click", ".delete_btn", function() {
			//1.弹出是否删除对话框
			var empName = $(this).parents("tr").find("td:eq(2)").text()
			var empId = $(this).attr("del-id");
			if (confirm("确认删除[" + empName + "]吗?")) {
				//确认,发送ajax请求
				$.ajax({
					url : "${APP_PATH}/emp/" + empId,
					type : "delete",
					success : function(result) {
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});

		//使用jQuery新方法on为编辑按钮绑定事件,保证按钮在创建之后被绑定
		$(document).on("click", ".edit_btn", function() {
			//清除表单数据
			reset_form("#emp_update_form");
			//1.查出部门信息,显示部门列表
			getDepts("#dept_update_select");
			//2.查出员工信息,显示员工信息
			getEmp($(this).attr("edit-id"));
			//3.把员工的id传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
			//弹出模态框
			$("#empUpdateModal").modal({
				backdrop : "static"
			});
		});

		function getEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "get",
				success : function(result) {
					var empData = result.extend.emp;
					$("#empId_update_static").text(empData.empId);
					$("#empName_update_input").val(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empPassword_update_input").val(empData.empPassword);

					$("#empUpdateModal input[name=gender]").val(
							[ empData.gender ]);
					$("#dept_update_select").val(empData.dId);

				}
			});
		}

		function getSingleEmp(id) {
			//清空table表格
			$("#emps_table tbody").empty();
			$("#check_all").prop("checked", false);
			$("#page_info_area").empty();
			$("#page_nav_area").empty();
			$
					.ajax({
						url : "${APP_PATH}/emp/" + id,
						type : "get",
						success : function(result) {
							var item = result.extend.emp;
							if (item == null) {
								$("#page_info_area").append("暂无记录");
								return false;
							}
							$("#page_info_area").append("已显示全部记录");
							var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
							var empIdTd = $("<td></td>").append(item.empId);
							var empNameTd = $("<td></td>").append(item.empName);
							var genderTd = $("<td></td>").append(
									item.gender == "M" ? "男" : "女");
							var emailTd = $("<td></td>").append(item.email);
							var deptNameTd = $("<td></td>").append(
									item.department.deptName);
							var editBtn = $("<button></button>").addClass(
									"btn btn-info btn-sm edit_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-pencil"))
									.append(" 编辑");
							//为编辑按钮添加一个自定义的属性,来表示当前于员工的id
							editBtn.attr("edit-id", item.empId);
							var delBtn = $("<button></button>")
									.addClass(
											"btn btn-warning btn-sm delete_btn")
									.append(
											$("<span></span>")
													.addClass(
															"glyphicon glyphicon-trash"))
									.append(" 删除");
							//为删除按钮添加一个自定义的属性,来表示当前于员工的id
							delBtn.attr("del-id", item.empId);
							var btnTd = $("<td></td>").append(editBtn).append(
									" ").append(delBtn);
							$("<tr></tr>").append(checkBoxTd).append(empIdTd)
									.append(empNameTd).append(genderTd).append(
											emailTd).append(deptNameTd).append(
											btnTd)
									.appendTo("#emps_table tbody");
						}
					});
		}

		//后端检查员工名是否可用(针对更新)
		$("#empName_update_input").change(
				function() {
					//发送ajax请求校验用户名是否可用
					var empName = this.value;
					$
							.ajax({
								url : "${APP_PATH}/checkuser",
								data : "empName=" + empName,
								type : "post",
								success : function(result) {
									if (result.code == 100) {
										show_validate_msg(
												"#empName_update_input", true,
												"(后端消息)用户名可用");
										$("#emp_update_btn").attr("ajax-va",
												"success");
									} else {
										show_validate_msg(
												"#empName_update_input", false,
												result.extend.va_msg);
										$("#emp_update_btn").attr("ajax-va",
												"error");
									}
								}
							});
				});

		//点击更新,更新员工信息
		$("#emp_update_btn").click(function() {
			//1.保存表单中的数据
			//先对要提交给服务器的数据进行校验
			if (!validate_update_form()) {
				return false;
			}
			//1.判断之前的ajax用户名校验是否成功.
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
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

		//校验表单数据
		function validate_update_form() {
			// 			//1.校验id
			// 			var empId = $("#empId_update_input").val();
			// 			var regName = /^[0-9]{1,10}$/;
			// 			if (!regName.test(empId)) {
			// 				show_validate_msg("#empId_update_input", false,
			// 						"(前端消息)员工编号为1-10位数字");
			// 				return false;
			// 			} else {
			// 				show_validate_msg("#empId_update_input", true, "ok");
			// 			}

			//2.拿到要校验的数据,使用正则表达式
			//校验用户名
			var empName = $("#empName_update_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
			if (!regName.test(empName)) {
				//alert("用户名为2-5位中文或6-16位英文和数字组合,包括-_");
				show_validate_msg("#empName_update_input", false,
						"(前端消息)用户名为2-5位中文或6-16位英文和数字组合,包括-_");
				return false;
			} else {
				show_validate_msg("#empName_update_input", true, "ok");
			}

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

			return true;
		}

		//完成全选,全不选
		$("#check_all").click(function() {
			//原生的dom属性用prop获取,自定义的用attr设置和获取
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		//单个选择框的单击事件
		$(document)
				.on(
						"click",
						".check_item",
						function() {
							//判断当前选中的元素是不是5个,如果是,则选满
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_all").prop("checked", flag);
						});

		//员工搜索按钮
		$("#emp_search_btn").click(function() {
			var empId = $("#emp_search_input").val();
			var regName = /^[0-9]{1,10}$/;
			if (regName.test(empId)) {
				getSingleEmp(empId);
			}
		});

		//退出按钮
		function logout() {
			window.location.href = "adminlogout.jsp";
		}

		function link1() {
			$("#link1").addClass("active");
			$("#link2").removeClass("active");
			window.location.href = "index.jsp";
		}

		function link2() {
			$("#link2").addClass("active");
			$("#link1").removeClass("active");
			window.location.href = "dept.jsp";
		}

		//添加员工
		function link3() {
			//清除表单数据
			reset_form("#emp_add_form");
			//发送ajax请求,查出部门信息,显示在下拉列表中

			getDepts("#dept_add_select");
			//弹出模态框
			$("#empAddModal").modal({
				backdrop : "static"
			});
		}

		//批量删除员工
		function link4() {
			var empNames = "";
			var idStr = "";
			$.each($(".check_item:checked"),
					function() {
						empNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ",";
						idStr += $(this).parents("tr").find("td:eq(1)").text()
								+ "-";
					});
			empNames = empNames.substring(0, empNames.length - 1);
			idStr = idStr.substring(0, idStr.length - 1);
			//如果没有选中任何员工,批量按钮不做响应
			if (empNames.length == 0) {
				return false;
			}
			if (confirm("确认删除[" + empNames + "]吗?")) {
				$.ajax({
					url : "${APP_PATH}/emp/" + idStr,
					type : "delete",
					success : function(result) {
						to_page(currentPage);
					}
				});
			}

		}
	</script>
</body>
</html>