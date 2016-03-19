<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.nju.tss.model.User" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="<%=request.getContextPath() + "/css/bootstrap.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/bootstrap-modify.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/style.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/userinfo.css" %>" rel="stylesheet">
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="userinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">
				<s:form id="userinfo-form" action="/admin/updateuser" method="post" theme="simple">
					<table class="profile_list">
						<tr>
							<td class="first_col">* 用户名</td>
							<td><s:textfield id="userid" name="user.userid" readonly="true" />
							<span id="userid_error" class="error">请输入用户名</span></td>
						</tr>
						<tr>
							<td class="first_col">* 密码</td>
							<td><s:password id="password" name="user.password"/>
							<span id="password_error" class="error">请输入密码</span>
							</td>
						</tr>
						<tr>
							<td class="first_col">* 名字</td>
							<td><s:textfield id="uname" name="user.name" />
							<span id="uname_error" class="error">请输入名字</span></td>
						</tr>
						<tr>
							<td class="first_col">性别</td>
							<td><s:radio id="sex" name="user.sex" list="%{#{'Male':'男','Female':'女'}}" theme="simple"></s:radio></td>
						</tr>
						<tr>
							<td class="first_col">身份</td>
							<td><s:radio id="iden" name="user.iden" list="%{#{'Teacher':'老师','Student':'学生'}}" theme="simple"></s:radio></td>
						</tr>
						<tr>
							<td class="first_col">电话</td>
							<td><s:textfield id="phone" name="user.phone" /></td>
						</tr>
						<tr>
							<td class="first_col">邮箱</td>
							<td><s:textfield id="mail" name="user.mail" /></td>
						</tr>
					</table>
						<input type="hidden" name="user.id" />
				</s:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="button pink" data-dismiss="modal">关闭</button>
				<button type="button" class="button pink upd" data-dismiss="modal">保存修改</button>
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="">课程管理系统</a>
	</div>
	<div class="nav-center">
		<ul class="nav navbar-nav">
			<li class="active"><a href="">用户信息</a></li>
			<li><a href="<%=request.getContextPath() + "/admin/courselist" %>">课程列表</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li>
				<s:a namespace="/user" action="userinfo" >
					<s:param name="uid" value="#session.user.id"></s:param>
					<img class="avatar" src="${session.user.avatar}">
					${session.user.name}
				</s:a>
			</li>
			<li><s:a namespace="/admin" action="logout" >退出</s:a></li>
		</ul>
	</div>
</nav>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#userinfo" data-toggle="tab">用户信息</a></li>
		<li role="presentation"><a href="#myinfo" data-toggle="tab">我的信息</a></li>
	</ul>
	<div class="tab-content">
		<!-- 提示信息 -->
		<span id="hint" class="success"><s:property value="message"/></span>
		<!-- 我的信息 -->
		<div class="tab-pane fade" id="myinfo">
			<div class="content">
				<table class="profile_list">
					<tr>
						<td class="first_col">账户：</td>
						<td><s:property value="session.user.userid"/></td>
					</tr>
					<tr>
						<td class="first_col">姓名：</td>
						<td><s:property value="session.user.name"/></td>
					</tr>
					<tr>
						<td class="first_col">性别：</td>
						<td>
						<%
							User my = (User)session.getAttribute("user");
							if(my.getSex().equals(User.MALE)) {
								out.print("男");
							} else {
								out.print("女");
							}
						%>
						</td>
						
					</tr>
					<tr>
						<td class="first_col">身份：</td>
						<td>
						<%
							if(my.getIden().equals(User.TEACHER)) {
								out.print("老师");
							} else {
								out.print("学生");
							}
						%>
						</td>
					</tr>
					<tr>
						<td class="first_col">电话：</td>
						<td><s:property value="session.user.phone"/></td>
					</tr>
					<tr>
						<td class="first_col">邮箱：</td>
						<td><s:property value="session.user.mail"/></td>
					</tr>
					<tr>
						<td class="first_col"></td>
						<td>
							<button type="button" id="updbtn" class="button pink"  data-toggle="modal" data-target="#userinfo"
								data-id="${session.user.id}"
								data-userid="${session.user.userid}"
								data-password="${session.user.password}"
								data-sex="${session.user.sex}"
								data-iden="${session.user.iden}"
								data-phone="${session.user.phone}"
								data-mail="${session.user.mail}"
								data-name="${session.user.name}">
								修改</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 用户信息 -->
		<div class="tab-pane fade in active" id="userinfo">
			<div class="content">
				<table class="profile_list">
					<tr>
						<td class="first_col">账户：</td>
						<td><s:property value="user.userid"/></td>
					</tr>
					<tr>
						<td class="first_col">姓名：</td>
						<td><s:property value="user.name"/></td>
					</tr>
					<tr>
						<td class="first_col">性别：</td>
						<td>
						<%
							User user = (User)request.getAttribute("user");
							if(user.getSex().equals(User.MALE)) {
								out.print("男");
							} else {
								out.print("女");
							}
						%>
						</td>
						
					</tr>
					<tr>
						<td class="first_col">身份：</td>
						<td>
						<%
							if(user.getIden().equals(User.TEACHER)) {
								out.print("老师");
							} else {
								out.print("学生");
							}
						%>
						</td>
					</tr>
					<tr>
						<td class="first_col">电话：</td>
						<td><s:property value="user.phone"/></td>
					</tr>
					<tr>
						<td class="first_col">邮箱：</td>
						<td><s:property value="user.mail"/></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
<script src="<%=request.getContextPath() + "/js/my.js" %>"></script>
<script>
	$('#userinfo').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var id = button.data('id')
		var userid = button.data('userid')
		var password = button.data('password')
		var name = button.data('name')
		var sex = button.data('sex')
		var iden = button.data('iden')
		var phone = button.data('phone')
		var mail = button.data('mail')
		var modal = $(this)
		modal.find('.modal-title').text(name)
		modal.find('input[name="user.id"]').val(id)
		modal.find('#userid').val(userid)
		modal.find('#password').val(password)
		modal.find('#uname').val(name)
		modal.find('input:radio[name="user.sex"][value="' + sex + '"]').prop('checked', true)
		modal.find('input:radio[name="user.iden"][value="' + iden + '"]').prop('checked', true)
		modal.find('#phone').val(phone)
		modal.find('#mail').val(mail)
	})

	var hint = $("#hint");
	
	$(".upd").click(function(){
		upd($("#userinfo-form").serialize(), hint, "<%=request.getContextPath() + "/admin/updateuser" %>");
	});
	
	// 检查输入是否合法
    function check_input() {
        var userid = document.getElementById("userid").value;
        var password = document.getElementById("password").value;
        var pass_2 = document.getElementById("pass_2").value;
        var userid_error = document.getElementById("userid_error");
        var password_error = document.getElementById("password_error");
        var pass_2_error = document.getElementById("pass_2_error");
        var uname = document.getElementById("uname").value;
        var uname_error = document.getElementById("uname_error");
        var skip = true; // 是否跳转
        if(userid.length == 0) {
            userid_error.style.visibility = "visible";
            userid_error.innerHTML = "请输入用户名";
            skip = false;
        } else {
            userid_error.style.visibility = "hidden";
        }
        
        if(uname.length == 0) {
            uname_error.style.visibility = "visible";
            uname_error.innerHTML = "请输入名字";
            skip = false;
        } else {
            uname_error.style.visibility = "hidden";
        }
        
        if(password.length == 0) {
            password_error.style.visibility = "visible";
            skip = false;
        } else {
            password_error.style.visibility = "hidden";
        }

        if(pass_2.length == 0 || pass_2 != password) {
            pass_2_error.style.visibility = "visible";
            skip = false;
        } else {
            pass_2_error.style.visibility = "hidden";
        }

        return skip;
    }
</script>
</html>