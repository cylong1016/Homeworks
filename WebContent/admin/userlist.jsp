<%@ page language="java" import="edu.nju.tss.model.User" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统-用户管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="<%=request.getContextPath() + "/css/bootstrap.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/bootstrap-modify.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/style.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/userlist.css" %>" rel="stylesheet">
</head>
<body>
<%!
	String teacher = User.TEACHER;
	String student = User.STUDENT;
	String male = User.MALE;
	String female = User.FEMALE;
%>
<jsp:useBean id="admin" type="edu.nju.tss.model.Admin" scope="session" /> 
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="">课程管理系统</a>
	</div>
	<div class="nav-center">
		<ul class="nav navbar-nav">
			<li class="active"><a href="<%=request.getContextPath() + "/admin/userlist" %>">用户管理 </a></li>
			<li><a href="<%=request.getContextPath() + "/admin/courselist" %>">教学计划 </a></li>
			<li><a href="<%=request.getContextPath() + "/admin/statistics.jsp" %>">统计 </a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href=""><img class="avatar" src="<jsp:getProperty name="admin" property="avatar" />">
			<jsp:getProperty name="admin" property="name" />
			</a></li>
			<li><s:a namespace="/admin" action="logout" >退出</s:a></li>
		</ul>
	</div>
</nav>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#alluser" data-toggle="tab">全部用户</a></li>
		<li role="presentation"><a href="#register" data-toggle="tab">注册用户</a></li>
	</ul>
	<div class="tab-content">
		<!-- 提示信息 -->
		<span id="hint" class="success"><s:property value="message"/></span>
		<!-- 全部用户 -->
		<div class="tab-pane fade in active" id="alluser">
			<div class="content">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" aria-describedby="sizing-addon3" placeholder="搜索用户……">
					<span class="input-group-addon" id="sizing-addon3">
					<a href=""><span style="color:white">搜索</span></a></span>
				</div>
				<ul class="nav nav-tabs userlist-tab">
					<li role="presentation" class="active"><a href="#teacher" data-toggle="tab">老师</a></li>
					<li role="presentation"><a href="#student" data-toggle="tab">学生</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="teacher">
						<table class="userlist">
							<tr>
								<th>头像</th>
								<th>姓名</th>
								<th>账号</th>
								<th>密码</th>
								<th>性别</th>
								<th>电话</th>
								<th>邮箱</th>
							</tr>
							<s:iterator id="user" value="userList"> 
							<s:if test="%{#user.iden == 'Teacher'}">
								<tr id="${user.id}" data-toggle="modal" data-target="#userinfo"
									data-id="${user.id}"
									data-userid="${user.userid}"
									data-password="${user.password}"
									data-sex="${user.sex}"
									data-iden="${user.iden}"
									data-phone="${user.phone}"
									data-mail="${user.mail}"
									data-name="${user.name}"> 
									<td><img class="item-avatar" id="${user.id}" src="${user.avatar}"></td>
									<td>${user.name}</td>
									<td>${user.userid}</td>
									<td>${user.password}</td>
									<td>
										<s:if test="%{#user.sex == 'Male'}">男</s:if>
										<s:else>女</s:else>
									</td>
									<td>${user.phone}</td>
									<td>${user.mail}</td>
								</tr>
							</s:if>
							</s:iterator>
						</table>
					</div>
					<div class="tab-pane fade" id="student">
						<table class="userlist">
							<tr>
								<th>头像</th>
								<th>姓名</th>
								<th>账号</th>
								<th>密码</th>
								<th>性别</th>
								<th>电话</th>
								<th>邮箱</th>
							</tr>
							<s:iterator id="user" value="userList">
							<s:if test="%{#user.iden == 'Student'}">
								<tr id="${user.id}" data-toggle="modal" data-target="#userinfo"
									data-id="${user.id}"
									data-userid="${user.userid}"
									data-password="${user.password}"
									data-sex="${user.sex}"
									data-iden="${user.iden}"
									data-phone="${user.phone}"
									data-mail="${user.mail}"
									data-name="${user.name}"> 
									<td><img class="item-avatar" id="${user.id}" src="${user.avatar}"></td>
									<td>${user.name}</td>
									<td>${user.userid}</td>
									<td>${user.password}</td>
									<td>${user.sex}</td>
									<td>${user.phone}</td>
									<td>${user.mail}</td>
								</tr>
							</s:if>
							</s:iterator>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 注册用户 -->
		<div class="tab-pane fade" id="register">
			<div class="content">
				<s:form action="/admin/register" method="post" theme="simple">
					<table class="profile_list">
						<tr>
							<td class="first_col">* 用户名</td>
							<td><s:textfield id="userid" name="user.userid"/>
							<span id="userid_error" class="error">请输入用户名</span></td>
						</tr>
						<tr>
							<td class="first_col">* 密码</td>
							<td><s:password id="password" name="user.password"/>
							<span id="password_error" class="error">请输入密码</span>
							</td>
						</tr>
						<tr>
							<td class="first_col">* 重复输入密码</td>
							<td><s:password id="pass_2" name="password_2" />
							<span id="pass_2_error" class="error">两次输入的密码不同</span></td>
						</tr>
						<tr>
							<td class="first_col">* 名字</td>
							<td><s:textfield id="uname" name="user.name" />
							<span id="uname_error" class="error">请输入名字</span></td>
						</tr>
						<tr>
							<td class="first_col">性别</td>
							<td><s:radio name="user.sex" list="%{#{'Male':'男','Female':'女'}}" value="'Male'" theme="simple"></s:radio></td>
						</tr>
						<tr>
							<td class="first_col">身份</td>
							<td><s:radio name="user.iden" list="%{#{'Teacher':'老师','Student':'学生'}}" value="'Student'" theme="simple"></s:radio></td>
						</tr>
						<tr>
							<td class="first_col">电话</td>
							<td><s:textfield name="user.phone" /></td>
						</tr>
						<tr>
							<td class="first_col">邮箱</td>
							<td><s:textfield id="mail" name="user.mail" /></td>
						</tr>
						<tr>
							<td class="first_col"></td>
				   			<td>
								<input class="button pink" type="submit" onclick="return check_input()" value="注册" />
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="userinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">${user.name}</h4>
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
				<button type="button" class="button pink upd" data-dismiss="modal">保存更改</button>
				<button type="button" class="button red del" data-dismiss="modal">删除</button>
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
		modal.find('.del').attr("id", id)
	})

	var hint = $("#hint");
	var message = "<%=request.getParameter("message") %>";
	
	$(".del").click(function(){
		del($(this).attr("id"), hint, "<%=request.getContextPath() + "/admin/deleteuser" %>");
	});
	
	$(".upd").click(function(){
		upd($("#userinfo-form").serialize(), hint, "<%=request.getContextPath() + "/admin/updateuser" %>");
	});
	
	if(message != "null") {
		hint.css("visibility", "visible");
		hint.fadeIn("fast");
		hint.fadeOut(3000);	// 几秒后消失
	}
	
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