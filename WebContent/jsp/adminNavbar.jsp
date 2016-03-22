<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:useBean id="admin" type="edu.nju.tss.model.Admin" scope="session" /> 
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="">课程管理系统</a>
	</div>
	<div class="nav-center">
		<ul class="nav navbar-nav">
			<li id="userlist"><a href="<%=request.getContextPath() + "/admin/userlist" %>">用户管理 </a></li>
			<li id="courselist"><a href="<%=request.getContextPath() + "/admin/courselist" %>">教学计划 </a></li>
			<li id="statistics"><a href="<%=request.getContextPath() + "/admin/statistics.jsp" %>">统计 </a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href=""><img class="avatar" src="<jsp:getProperty name="admin" property="avatar" />">
			<jsp:getProperty name="admin" property="name" />
			</a></li>
			<li><s:a namespace="/admin" action="logout" >退出</s:a></li>
		</ul>
	</div>
</nav>