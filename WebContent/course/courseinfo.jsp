<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link href="<%=request.getContextPath() + "/css/courseinfo.css" %>" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="">课程管理系统</a>
	</div>
	<div class="nav-center">
		<ul class="nav navbar-nav">
			<li class="active"><a href="">当前课程</a></li>
			<li><a href="<%=request.getContextPath() + "/admin/courselist" %>">课程列表</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li>
				<s:a namespace="/user" action="userinfo">
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
		<li role="presentation" class="active"><a href="#courseinfo" data-toggle="tab">课程信息</a></li>
		<li role="presentation"><a href="#assignment" data-toggle="tab">课程作业</a></li>
	</ul>
	<div class="tab-content">
		<!-- 课程信息 -->
		<div class="tab-pane fade in active" id="courseinfo">
			<div class="content">
				<table class="courseinfo">
					<tr>
						<td class="first_col">课程名称：</td>
						<td><s:property value="course.cname" /></td>
					</tr>
					<tr>
						<td class="first_col">任课教师：</td>
						<td><s:property value="course.iname" /></td>
					</tr>
					<tr>
						<td class="first_col">开课时间：</td>
						<td><s:property value="course.semester" /></td>
					</tr>
					<tr>
						<td class="first_col">结课时间：</td>
						<td><s:property value="course.end" /></td>
					</tr>
					<tr>
						<td class="first_col description">课程描述：</td>
						<td><s:property value="course.description" /></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 课程作业 -->
		<div class="tab-pane fade" id="assignment">
			<div class="content">
				课程作业
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
</html>