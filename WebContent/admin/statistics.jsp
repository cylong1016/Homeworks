<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统-课程管理</title>
	<jsp:include  page="../jsp/head.jsp"/>
	<link href="<%=request.getContextPath() + "/css/statistics.css" %>" rel="stylesheet">
</head>
<body>
<jsp:include  page="../jsp/adminNavbar.jsp"/>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#course" data-toggle="tab">课程情况</a></li>
		<li role="presentation"><a href="#studentAssignment" data-toggle="tab">学生情况</a></li>
	</ul>
	<div class="tab-content">
		<!-- 课程情况 -->
		<div class="tab-pane fade in active" id="course">
			<div class="content">
				<h2>课程平均分</h2>
				<div style="width: 60%; margin: 0 20%">
					<canvas id="courseAvgScore" height="300px" width="500px"></canvas>
				</div>
			</div>
			<div class="content">
				<h2>课程作业数</h2>
				<div style="width: 60%; margin: 0 20%">
					<canvas id="canvasCourseAssignments" height="200" width="200"></canvas>
				</div>
			</div>
		</div>
		<!-- 学生情况 -->
		<div class="tab-pane fade" id="studentAssignment">
			<div class="content">
				<span class="btn btn-default" data-toggle="collapse" data-target="#j2ee">J2EE与中间件 </span>
				<div id="j2ee" class="collapse" style="height: 300px;">
					<div style="width: auto; margin: 0 0 0 30px; float: left;">
						<h2>提交人数</h2>
						<canvas id="assignmentsSubmit_jee" height="200" width="400"></canvas>
					</div>
					<div style="width: auto; margin: 0 30px 0 0; float: right;">
						<h2>分数情况</h2>
						<canvas id="assignmentsScore_jee" height="200" width="200"></canvas>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="content">
				<span class="btn btn-default" data-toggle="collapse" data-target="#linux">Linux程序设计 </span>
				<div id="linux" class="collapse" style="height: 300px;">
					<div style="width: auto; margin: 0 0 0 30px; float: left;">
						<h2>提交人数</h2>
						<canvas id="assignmentsSubmit_linux" height="200" width="400"></canvas>
					</div>
					<div style="width: auto; margin: 0 30px 0 0; float: right;">
						<h2>分数情况</h2>
						<canvas id="assignmentsScore_linux" height="150" width="150"></canvas>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
<script src="<%=request.getContextPath() + "/js/Chart.js" %>"></script>
<script>

	var radarChartData = {
		labels: ["J2EE与中间件", "Linux系统基础", "linux程序设计", "软件系统设计与体系结构", "课程1", "课程2", "课程3"],
		datasets: [{
			label: "",
			fillColor: "rgba(220, 220, 220, 0.2)",
			strokeColor: "rgba(220, 220, 220, 1)",
			pointColor: "rgba(220, 220, 220, 1)",
			pointStrokeColor: "#fff",
			pointHighlightFill: "#fff",
			pointHighlightStroke: "rgba(243,114,109, 1)",
			data: [6, 5, 9, 8, 6, 5, 4]
		}]
	};
	
	var lineChartData = {
		labels: ["J2EE与中间件", "Linux系统基础", "linux程序设计", "软件系统设计与体系结构", "课程1", "课程2", "课程3"],
		datasets : [{
			label: "",
			fillColor : "rgba(220, 220, 220, 0.2)",
			strokeColor : "rgba(220, 220, 220, 1)",
			pointColor : "rgba(220, 220, 220, 1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(243,114,109, 1)",
			data : [85, 90, 88, 72, 86, 85, 90]
		}]

	};
	
	var lineChartData_2 = {
			labels: ["作业1", "作业2", "作业3", "作业4"],
			datasets : [{
				label: "",
				fillColor : "rgba(220, 220, 220, 0.2)",
				strokeColor : "rgba(220, 220, 220, 1)",
				pointColor : "rgba(220, 220, 220, 1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(243,114,109, 1)",
				data : [1, 3, 2, 4]
			}]

		};
	
	var pieData = [{
					value: 3,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "<60"
					},
					{
						value: 5,
						color: "#46BFBD",
						highlight: "#5AD3D1",
						label: "60-69"
					},
					{
						value: 1,
						color: "#FDB45C",
						highlight: "#FFC870",
						label: "70-79"
					},
					{
						value: 4,
						color: "#949FB1",
						highlight: "#A8B3C5",
						label: "80-89"
					},
					{
						value: 12,
						color: "#4D5360",
						highlight: "#616774",
						label: "90-100"
					}
				];


	window.onload = function(){
		window.myRadar = new Chart(document.getElementById("canvasCourseAssignments").getContext("2d")).Radar(radarChartData, {
			responsive: true
		});
		
		var ctx = document.getElementById("courseAvgScore").getContext("2d");
		window.myLine = new Chart(ctx).Line(lineChartData, {
			responsive: true
		});
		
		var ctx_2 = document.getElementById("assignmentsSubmit_jee").getContext("2d");
		window.myLine_2 = new Chart(ctx_2).Line(lineChartData_2);
		
		var ctx_3 = document.getElementById("assignmentsScore_jee").getContext("2d");
		window.myPie = new Chart(ctx_3).Pie(pieData);
		
		var ctx_4 = document.getElementById("assignmentsSubmit_linux").getContext("2d");
		window.myLine_2 = new Chart(ctx_4).Line(lineChartData_2);
		
		var ctx_5 = document.getElementById("assignmentsScore_linux").getContext("2d");
		window.myPie = new Chart(ctx_5).Pie(pieData);
	}

	$(document).ready(function(){
		$("#statistics").attr("class", "active");
	});
</script>
</html>