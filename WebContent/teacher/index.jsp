<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统-教师主页</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="<%=request.getContextPath() + "/css/bootstrap.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/bootstrap-modify.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/style.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/tindex.css" %>" rel="stylesheet">
</head>
<body>
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
		<li role="presentation" class="active"><a href="#allcourse" data-toggle="tab">全部课程</a></li>
		<li role="presentation"><a href="#mycourse" data-toggle="tab">我的课程</a></li>
	</ul>
	<div class="tab-content">
		<!-- 全部课程 -->
		<div class="tab-pane fade in active" id="allcourse">
			<div class="content">
				<table class="courselist">
					<tr>
						<th>课程名</th>
						<th>任课教师</th>
						<th>开课时间</th>
						<th>结课时间</th>
					</tr>
					<s:iterator id="course" value="#session.courseList">
						<tr>
							<td>
								<s:a namespace="/course" action="courseinfo">
									<s:param name="cid" value="#course.id"></s:param>
									${course.cname}
								</s:a>
							</td>
							<td>
								<s:a namespace="/user" action="userinfo">
									<s:param name="uid" value="#course.instructor"></s:param>
									${course.iname}
								</s:a>
							</td>
							<td>${course.semester}</td>
							<td>${course.end}</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<!-- 我的课程 -->
		<div class="tab-pane fade" id="mycourse">
			<div class="content">
				<table class="courselist">
					<tr>
						<th>课程名</th>
						<th>任课教师</th>
						<th>开课时间</th>
						<th>结课时间</th>
					</tr>
					<s:iterator id="course" value="#session.courseList">
					<s:if test="%{#course.instructor == #session.user.id}">
						<tr>
							<td>
								<s:a namespace="/course" action="courseinfo">
								<s:param name="cid" value="#course.id"></s:param>
								${course.cname}</s:a>
							</td>
							<td>
								<s:a namespace="/user" action="userinfo">
									<s:param name="uid" value="#course.instructor"></s:param>
									${course.iname}
								</s:a>
							</td>
							<td>${course.semester}</td>
							<td>${course.end}</td>
						</tr>
					</s:if>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
</html>