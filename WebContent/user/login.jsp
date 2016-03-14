<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆</title>
</head>
<body>
	<table width="650" border="0">
		<tr>
			<td><a href="index.do">首页</a></td>
			<td><a href="/login.jsp">登陆</a></td>
			<td><a href="/register.jsp">注册</a></td>
			<td><a href="logout.do">退出</a></td>
			<td><a href="loadUser.do">个人信息</a></td>
		</tr>
	</table>
	<br>
	<s:form action="/user/login" method="post">
		<table align="center" border="0">
			<tr>
				<td><s:textfield name="user.userid" label="用户名" /></td>
			</tr>
			<tr>
				<td><s:password name="passwordOne" label="密码" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><s:submit value="提交" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>