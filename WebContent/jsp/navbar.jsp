<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table>
	<tr>
		<td><a href="<%=request.getContextPath() + "/index.jsp" %>">首页</a></td>
		<td><a href="<%=request.getContextPath() + "/user/login.jsp" %>">登陆</a></td>
		<td><a href="<%=request.getContextPath() + "/user/register.jsp" %>">注册</a></td>
		<td><a href="loadUser.do">个人信息</a></td>
		<td><a href="logout.do">退出</a></td>
	</tr>
</table>