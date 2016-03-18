<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>课程管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() + "/css/style.css" %>" />
</head>
<body>
	<div class="wrapper">
		<h1>课程管理系统</h1>
		<h2>亲！今天你学习了吗？</h2>
		<div class="content">
			<div id="form_wrapper" class="form_wrapper">
				<s:form class="login active" action="/admin/login" method="post" theme="simple">
					<h3>登陆</h3>
					<div>
						<label>用户名：</label><span style="color:black" class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<s:textfield id="username" name="admin.userid"/>
                           <span id="username_error" class="error">请输入用户名</span>
					</div>
					<div>
						<label>密码：</label>
						<s:password id="password" name="admin.password"/>
                           <span id = "password_error" class="error">请输入密码</span>
					</div>
					<div class="bottom">
						<div class="remember"><input type="checkbox" name="save_pass" value="true" checked /><span>保持登陆</span></div>
						<input class="button pink" type="submit" onclick="return check_input()" value="登陆">
						<div class="clear"></div>
					</div>
				</s:form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
<script>
    // 检查输入是否合法
    function check_input() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var username_error = document.getElementById("username_error");
        var password_error = document.getElementById("password_error");
        var skip = true; // 是否跳转
        if(username.length == 0) {
            username_error.style.visibility = "visible";
            skip = false;
        } else {
            username_error.style.visibility = "hidden";
        }

        if(password.length == 0) {
            password_error.style.visibility = "visible";
            skip = false;
        } else {
            password_error.style.visibility = "hidden";
        }
        return skip;
    }
</script>
</html>
