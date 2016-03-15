<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册用户</title>
</head>
<body>
	<s:property value="message"/>
	<s:form action="/user/register" method="post">
		<table>
			<tr>
				<td><s:textfield name="user.userid" label="用户名" /></td>
			</tr>
			<tr>
				<td><s:password name="user.password" label="密码" /></td>
			</tr>
			<tr>
				<td><s:password name="password_2" label="重复输入密码" /></td>
			</tr>
			<tr>
				<td><s:textfield name="user.name" label="名字" /></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><s:radio name="user.sex" list="%{#{'Male':'男','Female':'女'}}" theme="simple"></s:radio></td>
			</tr>
			<tr>
				<td>身份：</td>
				<td><s:radio name="user.iden" list="%{#{'Teacher':'老师','Student':'学生'}}" theme="simple"></s:radio></td>
			</tr>
			<tr>
				<td><s:textfield name="user.phone" label="电话" /></td>
			</tr>
			<tr>
				<td><s:textfield name="user.mail" label="电子邮件" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><s:submit value="提交" /></td>
				<td><s:reset value="重置" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>