<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆</title>
</head>
<body>
	<jsp:include page="../jsp/navbar.jsp"  flush="true"/>
	<br>
	<s:form action="/user/login" method="post">
		<table>
			<tr>
				<td><s:textfield name="admin.userid" label="用户名" /></td>
			</tr>
			<tr>
				<td><s:password name="admin.password" label="密码" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><s:submit value="提交" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>