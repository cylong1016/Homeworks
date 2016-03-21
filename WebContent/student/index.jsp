<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统-学生主页</title>
	<jsp:include  page="../jsp/head.jsp"/>
	<link href="<%=request.getContextPath() + "/css/tablelist.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/sindex.css" %>" rel="stylesheet">
</head>
<body>
<jsp:include  page="../jsp/navbar.jsp"/>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#allcourse" data-toggle="tab">全部课程</a></li>
	</ul>
	<div class="tab-content">
		<!-- 全部课程 -->
		<jsp:include  page="../jsp/allcourse.jsp"/>
	</div>
</div>
</body>
</html>