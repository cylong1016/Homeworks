<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
	<title>欢迎来到课程管理系统-课程管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="<%=request.getContextPath() + "/css/bootstrap.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/bootstrap-modify.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/style.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/courselist.css" %>" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="">课程管理系统</a>
	</div>
	<div class="nav-center">
		<ul class="nav navbar-nav">
			<li><a href="<%=request.getContextPath() + "/user/userlist" %>">用户管理 </a></li>
			<li class="active"><a href="<%=request.getContextPath() + "/user/courselist" %>">教学计划 </a></li>
			<li><a href="">课程管理 </a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<jsp:useBean id="admin" type="edu.nju.tss.model.Admin" scope="session" /> 
			<li><a href=""><img class="avatar" src="<jsp:getProperty name="admin" property="avatar" />">
			<jsp:getProperty name="admin" property="name" />
			</a></li>
		</ul>
	</div>
</nav>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#allcourse" data-toggle="tab">全部课程</a></li>
		<li role="presentation"><a href="#setcourse" data-toggle="tab">设置课程</a></li>
	</ul>
	<div class="tab-content">
		<!-- 提示信息 -->
		<span id="hint" class="success"><s:property value="message"/></span>
		<!-- 全部课程 -->
		<div class="tab-pane fade in active" id="allcourse">
			<div class="content">
				全部课程
			</div>
		</div>
		<!-- 设置课程 -->
		<div class="tab-pane fade" id="setcourse">
			<div class="content">
				设置课程
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
<script src="<%=request.getContextPath() + "/js/my.js" %>"></script>
</html>