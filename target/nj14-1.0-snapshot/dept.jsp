<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面管理</title>
<%
	if (session.getAttribute("adminIsLogin") == null || !session.getAttribute("adminIsLogin").equals("true")) {
		response.sendRedirect("login.jsp");
	}
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	String adminName = (String) session.getAttribute("adminName");
	System.out.println("返回后,会刷新?");
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
				<li id="link1"><a href="javascript:link1();">员工管理</a></li>
				<li id="link2" class="active"><a href="javascript:link2();">部门管理</a></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="搜索部门名称或编号"
						id="dept_search_input">
				</div>
				<button type="button" class="btn btn-default" id="dept_search_btn">搜索</button>
			</form>
			<div>
				<ul class="nav navbar-nav">
					<li id="emp-add"><a href="javascript:link3();">添加部门</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript:logout();">退出登录</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="modal fade" id="deptAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加部门</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="dept_add_form">
						<div class="form-group">
							<label for="deptName_add_input" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-10">
								<input type="text" name="deptName" class="form-control"
									id="deptName_add_input" placeholder="请输入部门名称"><span
									id="deptName_helpBlock" class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 关闭
					</button>
					<button type="button" class="btn btn-primary" id="dept_save_btn">
						<span class=" glyphicon glyphicon-ok"></span> 保存
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 部门修改的模态框	 -->
	<div class="modal fade" id="deptUpdateModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改部门信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="dept_update_form">
						<div class="form-group">
							<label for="deptName_update_input" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-10">
								<input type="text" name="deptName" class="form-control"
									id="deptName_update_input" placeholder="输入新的部门名称"> <span
									id="deptName_helpBlock" class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="dept_update_btn">Update</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h3>部门信息管理</h3>
			</div>
		</div>

		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-bordered" id="depts_table">
					<thead>
						<tr>
							<th>编号</th>
							<th>部门名称</th>
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
			$("#dept-li").addClass("active");
			to_page(1);
		});

		//显示部门列表
		function reset_form(element) {
			$(element)[0].reset();
			//清空表单样式
			$(element).find("input").parent().removeClass(
					"has-error has-success");
			$(element).find("span").text("");
		}
		function to_page(pn) {
			$.ajax({
				//json数据所在的url
				url : "${APP_PATH}/deptsinfo",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					//1.解析并显示员工数据
					build_depts_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析显示分页条数据
					build_page_nav(result);
				}
			});
		}

		function build_depts_table(result) {
			//清空table表格
			$("#depts_table tbody").empty();
			$("#check_all").prop("checked", false);
			var depts = result.extend.pageInfo.list;
			$.each(depts, function(index, item) {
				var deptIdTd = $("<td></td>").append(item.deptId);
				var deptNameTd = $("<td></td>").append(item.deptName);
				var editBtn = $("<button></button>").addClass(
						"btn btn-info btn-sm edit_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append(" 编辑");
				//为编辑按钮添加一个自定义的属性,来表示当前于员工的id
				editBtn.attr("edit-id", item.deptId);
				var btnTd = $("<td></td>").append(editBtn);
				$("<tr></tr>").append(deptIdTd).append(deptNameTd)
						.append(btnTd).appendTo("#depts_table tbody");
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

		//后端检查部门名是否可用(针对新增部门)
		$("#deptName_add_input").change(
				function() {
					//发送ajax请求校验部门名是否可用
					var deptName = this.value;
					$.ajax({
						url : "${APP_PATH}/checkdept",
						data : "deptName=" + deptName,
						type : "post",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#deptName_add_input", true,
										"(后端消息)部门名可用");
								$("#dept_save_btn").attr("ajax-va", "success");
							} else {
								show_validate_msg("#deptName_add_input", false,
										result.extend.va_msg);
								$("#dept_save_btn").attr("ajax-va", "error");
							}
						}
					});
				});

		//后端检查部门名是否可用(针对更新部门)
		$("#deptName_update_input").change(
				function() {
					//发送ajax请求校验部门名是否可用
					var deptName = this.value;
					$.ajax({
						url : "${APP_PATH}/checkdept",
						data : "deptName=" + deptName,
						type : "post",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#deptName_update_input",
										true, "(后端消息)部门名可用");
								$("#dept_update_btn")
										.attr("ajax-va", "success");
							} else {
								show_validate_msg("#deptName_update_input",
										false, result.extend.va_msg);
								$("#dept_update_btn").attr("ajax-va", "error");
							}
						}
					});
				});

		//保存员工
		$("#dept_save_btn")
				.click(
						function() {
							//1.保存表单中的数据
							//先对要提交给服务器的数据进行校验
							if (!validate_add_form()) {
								return false;
							}
							//1.判断之前的ajax部门名校验是否成功.
							if ($(this).attr("ajax-va") == "error") {
								show_validate_msg("#deptName_add_input", false,
										"(前端消息)部门名已存在");
								return false;
							}
							//2.发送ajax请求保存员工
							$
									.ajax({
										url : "${APP_PATH}/dept",
										type : "post",
										data : $("#dept_add_form").serialize(),
										success : function(result) {
											//校验成功
											if (result.code == 100) {
												//1.关闭模态框
												$("#deptAddModal")
														.modal("hide");
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
												if (undefined != result.extend.errorFields.deptName) {
													//显示员工名字错误信息
													show_validate_msg(
															"#deptName_add_input",
															false,
															result.extend.errorFields.deptName);
												}

											}
										}
									});
						});

		//校验添加的表单数据
		function validate_add_form() {
			//1.拿到要校验的数据,使用正则表达式
			//校验部门名
			var deptName = $("#deptName_add_input").val();
			var regName = /^[\u2E80-\u9FFF]{1,20}$/;
			if (!regName.test(deptName)) {
				show_validate_msg("#deptName_add_input", false,
						"(前端消息)部门名为1-20位中文字符");
				return false;
			} else {
				show_validate_msg("#deptName_add_input", true, "");
			}
			return true;
		}

		//校验更新的表单数据
		function validate_update_form() {
			//1.拿到要校验的数据,使用正则表达式
			//校验部门名
			var deptName = $("#deptName_update_input").val();
			var regName = /^[\u2E80-\u9FFF]{1,20}$/;
			if (!regName.test(deptName)) {
				show_validate_msg("#deptName_update_input", false,
						"(前端消息)部门名为1-20位中文字符");
				return false;
			} else {
				show_validate_msg("#deptName_update_input", true, "");
			}
			return true;
		}

		//显示校验信息
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

		//使用jQuery新方法on为编辑按钮绑定事件,保证按钮在创建之后被绑定
		$(document).on("click", ".edit_btn", function() {
			//清除表单数据
			reset_form("#dept_update_form");
			//1.查出部门信息,显示部门列表
			getDept($(this).attr("edit-id"));
			//3.把员工的id传递给模态框的更新按钮
			$("#dept_update_btn").attr("edit-id", $(this).attr("edit-id"));
			//弹出模态框
			$("#deptUpdateModal").modal({
				backdrop : "static"
			});
		});

		function getDept(id) {
			$.ajax({
				url : "${APP_PATH}/dept/" + id,
				type : "get",
				success : function(result) {
					var deptData = result.extend.dept;
					$("#deptName_update_input").val(deptData.deptName);
				}
			});
		}

		function getSingleDept(dept) {
			$("#depts_table tbody").empty();
			$("#page_info_area").empty();
			$("#page_nav_area").empty();
			$.ajax({
				url : "${APP_PATH}/dept/" + dept,
				type : "get",
				success : function(result) {
					var item = result.extend.dept;
					if (item == null) {
						$("#page_info_area").append("暂无记录");
						return false;
					}
					$("#page_info_area").append("已显示全部记录");
					var deptIdTd = $("<td></td>").append(item.deptId);
					var deptNameTd = $("<td></td>").append(item.deptName);
					var editBtn = $("<button></button>").addClass(
							"btn btn-info btn-sm edit_btn").append(
							$("<span></span>").addClass(
									"glyphicon glyphicon-pencil"))
							.append(" 编辑");
					//为编辑按钮添加一个自定义的属性,来表示当前于员工的id
					editBtn.attr("edit-id", item.deptId);
					var btnTd = $("<td></td>").append(editBtn);
					$("<tr></tr>").append(deptIdTd).append(deptNameTd).append(
							btnTd).appendTo("#depts_table tbody");
				}
			});
		}

		//点击更新,更新员工信息
		$("#dept_update_btn").click(
				function() {
					//1.校验邮箱信息		
					if (!validate_update_form()) {
						return false;
					}

					//1.判断之前的ajax部门名校验是否成功.
					if ($(this).attr("ajax-va") == "error") {
						show_validate_msg("#deptName_update_input", false,
								"(前端消息)部门名已存在");
						return false;
					}

					//2.发送ajax请求,保存更新员工数据
					$.ajax({
						url : "${APP_PATH}/dept/" + $(this).attr("edit-id"),
						type : "POST",
						//Tomcat报错:警告: Request method 'POST' not supported
						//追加"&_method=put"
						data : $("#dept_update_form").serialize()
								+ "&_method=put",
						success : function(result) {
							//关闭模态框
							$("#deptUpdateModal").modal("hide");
							to_page(currentPage);
						}
					});
				});

		//搜素按钮
		$("#dept_search_btn").click(function() {
			var dept = $("#dept_search_input").val();
			if (dept.length != 0) {
				getSingleDept(dept);
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
		//添加新部门
		function link3() {
			//清除表单数据
			reset_form("#dept_add_form");
			//弹出模态框
			$("#deptAddModal").modal({
				backdrop : "static"
			});
		}
	</script>
</body>
</html>