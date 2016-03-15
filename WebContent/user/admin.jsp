<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到教学管理系统</title>
</head>
<body>
	<jsp:useBean id="admin" type="edu.nju.tss.model.Admin" scope="session" /> 
	欢迎 <jsp:getProperty name="admin" property="userid" /><br/>
	<ul>
		<li><s:a namespace="/user" action="userlist">用户管理</s:a></li>
		<li>设置教学计划</li>
		<li>课程管理</li>
	</ul>
</body>
</html>