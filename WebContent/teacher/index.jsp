<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统-教师主页</title>
	<jsp:include  page="../jsp/head.jsp"/>
	<link href="<%=request.getContextPath() + "/css/tablelist.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/tindex.css" %>" rel="stylesheet">
</head>
<body>
<jsp:include  page="../jsp/navbar.jsp"/>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#allcourse" data-toggle="tab">全部课程</a></li>
		<li role="presentation"><a href="#mycourse" data-toggle="tab">我的课程</a></li>
	</ul>
	<div class="tab-content">
		<!-- 全部课程 -->
		<jsp:include  page="../jsp/allcourse.jsp"/>
		<!-- 我的课程 -->
		<div class="tab-pane fade" id="mycourse">
			<div class="content">
				<table class="list">
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
								<s:a namespace="/user" action="userinfo" target="external">
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