<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="">课程管理系统</a>
	</div>
	<div class="nav-center">
		<ul class="nav navbar-nav">
			<li class="active"><a href="<%=request.getContextPath() + "/admin/courselist" %>">课程列表</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li>
				<s:a namespace="/user" action="userinfo" target="external">
					<s:param name="uid" value="#session.user.id"></s:param>
					<img class="avatar" src="${session.user.avatar}">
					${session.user.name}
				</s:a>
			</li>
			<li><s:a namespace="/admin" action="logout" >退出</s:a></li>
		</ul>
	</div>
</nav>