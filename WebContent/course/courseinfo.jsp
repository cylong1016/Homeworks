<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.nju.tss.model.*"%>
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
	<link href="<%=request.getContextPath() + "/css/tableinfo.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/tablelist.css" %>" rel="stylesheet">
	<link href="<%=request.getContextPath() + "/css/input.css" %>" rel="stylesheet">
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
		<%
		User my = (User)session.getAttribute("user");
		Course course = (Course)request.getAttribute("course");
		if(my.getId().equals(course.getInstructor())) {
			out.print("<li role=\"presentation\"><a href=\"#courseStudent\" data-toggle=\"tab\">选课学生</a></li>");
			out.print("<li role=\"presentation\"><a href=\"#courseAssistants\" data-toggle=\"tab\">课程助教</a></li>");
			out.print("<li role=\"presentation\"><a href=\"#setassignment\" data-toggle=\"tab\">添加作业</a></li>");
		}
		%>
	</ul>
	<div class="tab-content">
		<!-- 提示信息 -->
		<span id="hint" class="success"><s:property value="message"/></span>
		<!-- 课程信息 -->
		<div class="tab-pane fade in active" id="courseinfo">
			<div class="content">
				<table class="info">
					<tr>
						<td class="first_col">课程名称：</td>
						<td><s:property value="course.cname" /></td>
					</tr>
					<tr>
						<td class="first_col">任课教师：</td>
						<td>
							<s:a namespace="/user" action="userinfo">
								<s:param name="uid" value="course.instructor"></s:param>
								${course.iname}
							</s:a>
						</td>
					</tr>
					<tr>
						<td class="first_col">课程助教：</td>
						<td>
							<s:iterator id="assistant" value="assistantList">
								<s:a namespace="/user" action="userinfo"  target="external">
									<s:param name="uid" value="#assistant.id"></s:param>
									${assistant.name}
								</s:a>
								&nbsp;&nbsp;
							</s:iterator>
						</td>
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
			<s:iterator id="ass" value="assignmentList">
			<div class="content">
				<table class="info" id="assign-table">
					<tr>
						<td class="first_col">提交截止日期：</td>
						<td> ${ass.deadline}</td>
					</tr>
					<tr>
						<td class="first_col">批改截止日期：</td>
						<td> ${ass.correctDeadline}</td>
					</tr>
					<tr>
						<td class="first_col">作业文件格式：</td>
						<td> ${ass.format}</td>
					</tr>
					<tr>
						<td class="first_col">分数：</td>
						<td> ${ass.score}</td>
					</tr>
					<tr>
						<td class="first_col">附件：</td>
						<td><a href="fileDownload?file=/uploadfile/${ass.fileName}&fileName=${ass.fileName}">${ass.fileName}</a></td>
					</tr>
					<tr>
						<s:iterator id="stu" value="studentList">
						<s:if test="%{#stu.id == session.user.id}">
							<td class="first_col">上传作业：</td>
							<td>
								<a href="javascript:;" class="file" id="">选择文件
									<input type="file" name="myAssignment" id="${ass.id}">
									<span class="${ass.id}">
										<s:iterator id="sa" value="saList">
										<s:if test="%{#sa.assignmentid == #ass.id && #sa.studentid == session.user.userid}">
											${sa.fileName}
										</s:if>
										</s:iterator>
									</span>
								</a>
							</td>
						</s:if>
						</s:iterator>
					</tr>
					<tr>
						<td class="first_col description">作业描述：</td>
						<td> ${ass.description}</td>
					</tr>
					<tr>
						<s:iterator id="assistant" value="assistantList">
						<s:if test="%{#assistant.id == session.user.id}">
							<td class="first_col">上传作业批改情况：</td>
							<td>
								<a href="javascript:;" class="file" id="">选择文件
									<input type="file" name="myAssignment" id="${ass.id}">
									<span class="${ass.id}">
										<s:iterator id="sa" value="saList">
										<s:if test="%{#sa.assignmentid == #ass.id && #sa.studentid == session.user.userid}">
											${sa.fileName}
										</s:if>
										</s:iterator>
									</span>
								</a>
							</td>
						</s:if>
						</s:iterator>
					</tr>
					<tr>
						<td class="first_col description">
							<span class="button pink" data-toggle="collapse" data-target="#assistant${ass.id}">助教批改情况 </span>
						</td>
						<td>
							<div id="assistant${ass.id}" class="collapse">
								<div class="list-group">
									<s:iterator id="sa" value="saList">
										<s:iterator id="assistant" value="assistantList">
										<s:if test="%{#sa.studentid == #assistant.userid && #sa.assignmentid == #ass.id}">
											<a href="fileDownload?file=/uploadfile/assignment/${ass.id}_${sa.fileName}&fileName=${sa.fileName}"
											class="list-group-item">${sa.fileName}</a>
										</s:if>
										</s:iterator>
									</s:iterator>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<s:iterator id="assistant" value="assistantList">
						<s:if test="%{#assistant.id == session.user.id">
							<td class="first_col description">
								<span class="button pink" data-toggle="collapse" data-target="#sa${ass.id}">全部学生作业 </span>
							</td>
							<td>
								<div id="sa${ass.id}" class="collapse">
									<div class="list-group">
										<s:iterator id="sa" value="saList">
										<s:if test="%{#sa.assignmentid == #ass.id && #sa.studentid != session.user.userid}">
											<a href="fileDownload?file=/uploadfile/assignment/${ass.id}_${sa.fileName}&fileName=${sa.fileName}"
											class="list-group-item">${sa.fileName}</a> 	
										</s:if>
										</s:iterator>
									</div>
								</div>
							</td>
						</s:if>
						</s:iterator>
					</tr>
					<s:if test="%{session.user.iden == 'Teacher'}">
						<tr>
							<td class="first_col description">
								<span class="button pink" data-toggle="collapse" data-target="#sa${ass.id}">全部学生作业 </span>
							</td>
							<td>
								<div id="sa${ass.id}" class="collapse">
									<div class="list-group">
										<s:iterator id="sa" value="saList">
										<s:if test="%{#sa.assignmentid == #ass.id}">
											<a href="fileDownload?file=/uploadfile/assignment/${ass.id}_${sa.fileName}&fileName=${sa.fileName}"
											class="list-group-item">${sa.fileName}</a>
										</s:if>
										</s:iterator>
									</div>
								</div>
							</td>
						</tr>
					</s:if>
				</table>
			</div>
			</s:iterator>
		</div>
		<!-- 课程学生界面 -->
		<div class="tab-pane fade" id=courseStudent>
			<div class="content">
				<div class="input-group input-group-sm">
					<input type="text" id="studentid" class="form-control" aria-describedby="sizing-addon3" placeholder="输入学生账户添加学生……">
					<span class="input-group-addon" id="addstu"> 添加  </span>
				</div>
			</div>
			<div class="content">
				<table class="list" id="student_list_table">
					<tr>
						<th>姓名</th>
						<th>账号</th>
						<th>性别</th>
						<th>电话</th>
						<th>邮箱</th>
						<th>操作</th>
					</tr>
					<s:iterator id="stu" value="studentList">
						<tr id="tr${stu.userid}"> 
							<td>
								<s:a namespace="/user" action="userinfo" target="external">
									<s:param name="uid" value="#stu.id"></s:param>
									${stu.name}
								</s:a>
							</td>
							<td>${stu.userid}</td>
							<td>${stu.sex}</td>
							<td>${stu.phone}</td>
							<td>${stu.mail}</td>
							<td id="${stu.userid}" class="delstu">删除</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<!-- 课程助教 -->
		<div class="tab-pane fade" id="courseAssistants">
			<div class="content">
				<div class="input-group input-group-sm">
					<input type="text" id="assistantid" class="form-control" aria-describedby="sizing-addon3" placeholder="输入助教账户添加助教……">
					<span class="input-group-addon" id="addass"> 添加  </span>
				</div>
			</div>
			<div class="content">
				<table class="list" id="assistant_list_table">
					<tr>
						<th>姓名</th>
						<th>账号</th>
						<th>性别</th>
						<th>电话</th>
						<th>邮箱</th>
						<th>操作</th>
					</tr>
					<s:iterator id="ass" value="assistantList">
						<tr id="tr${ass.userid}"> 
							<td>
								<s:a namespace="/user" action="userinfo" target="external">
									<s:param name="uid" value="#ass.id"></s:param>
									${ass.name}
								</s:a>
							</td>
							<td>${ass.userid}</td>
							<td>${ass.sex}</td>
							<td>${ass.phone}</td>
							<td>${ass.mail}</td>
							<td id="${ass.userid}" class="delass">删除</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<!-- 添加作业 -->
		<div class="tab-pane fade" id=setassignment>
			<div class="content">
				<s:form action="/course/setassignment" id="assigment-form" method="post" theme="simple" enctype="multipart/form-data">
					<table class="info">
						<tr>
							<td class="first_col">提交截止日期</td>
							<td><input type="datetime-local" name="assignment.deadline" /></td>
						</tr>
						<tr>
							<td class="first_col">批改截止日期</td>
							<td><input type="datetime-local" name="assignment.correctDeadline" /></td>
						</tr>
						<tr>
							<td class="first_col">作业文件格式</td>
							<td><s:textfield name="assignment.format"/></td>
						</tr>
						<tr>
							<td class="first_col">分数</td>
							<td><s:textfield name="assignment.score"/></td>
						</tr>
						<tr>
							<td class="first_col">附件</td>
							<td>
								<a href="javascript:;" class="file">选择文件
									<input type="file" name="attach" id="attachid">
									<span class="attachid"></span>
								</a>
						</tr>
						<tr>
							<td class="first_col description">作业描述</td>
							<td><s:textarea name="assignment.description" /></td>
						</tr>
						<tr>
							<td class="first_col"></td>
				   			<td>
								<input class="button pink" id="setassignmentbtn" type="submit" readonly="readonly" value="添加" />
							</td>
						</tr>
					</table>
					<input type="hidden" name="course.id" value="${course.id}"/>
				</s:form>
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
<script src="<%=request.getContextPath() + "/js/ajaxfileupload.js" %>"></script>
<script src="<%=request.getContextPath() + "/js/my.js" %>"></script>
<script>
	
	var hint = $("#hint");
	
	function ajaxFileUpload(fileElementId) {
		$.ajaxFileUpload ({
			url: '<%=request.getContextPath() + "/course/uploadMyAssignment" %>',
			secureuri: false,
			fileElementId: fileElementId,
			dataType: 'json',
			data: {
				assignmentid: fileElementId,
				studentid: '<%=((User)session.getAttribute("user")).getUserid() %>',
				courseid: '<%=((Course)request.getAttribute("course")).getId() %>'
			},
			success: function (data) {
				msghint('上传成功', hint);
			},
			error: function (data, status, e) {
				alert("上传发生异常");
			}
		})
	}
	
	function adduser(uid, hint, url, delbtnName) {
		$.ajax({
			type : "post",
			url : url,
			data : {
				uid: uid,
				courseid: '<%=((Course)request.getAttribute("course")).getId() %>'
			},
			cache : false,
			dataType : "json",
			success : function(data) {
				var d = eval("(" + data + ")");
				msghint(d.message, hint);
				var table = $('#' + d.tableID);
				var str = "<tr id='tr" + d.user.userid + "'> ";
				str += "<td><a href='/TSS/user/userinfo?uid=" + d.user.id + "' target='external'>" + d.user.name + "</a></td>";
				str += "<td>" + d.user.userid + "</td>";
				str += "<td>" + d.user.sex + "</td>";
				str += "<td>" + d.user.phone + "</td>";
				str += "<td>" + d.user.mail + "</td>";
				str += "<td id='" + d.user.userid + "' class='" + delbtnName + "'>删除</td>";
				str += "</tr>";
				table.append(str);
			},
			error : function(data) {
				alert("系统异常，请稍后重试！");
			}
		});  
	}
	
	function deluser(hint, url, uid) {
		$.ajax({
			type:"post",
			url:url,
			data:{//设置数据源 
				uid: uid,
				courseid: "<%=((Course)request.getAttribute("course")).getId() %>"
			},
			dataType:"json",
			success: function(data){
				var d = eval("(" + data + ")");
				msghint(d.message, hint);
				$("#tr" + uid).hide(1000);
			},
			error:function(){
				alert("系统异常，请稍后重试！");
			}
		})
	}
	
	$(document).ready(function(){
		$("#addass").on("click", function() {
			adduser($("#assistantid").val(), hint, '<%=request.getContextPath() + "/course/addassistant" %>', "delass");
		});
		
		$("#addstu").on("click", function() {
			adduser($("#studentid").val(), hint, '<%=request.getContextPath() + "/course/addstudent" %>', "delstu");
		});
		
		$(".delass").on("click", function() {
			deluser(hint, '<%=request.getContextPath() + "/course/deleteassistant" %>', $(this).attr("id"));
		});
		
		$(".delstu").on("click", function() {
			deluser(hint, '<%=request.getContextPath() + "/course/deletestudent" %>', $(this).attr("id"));
		});
		
		$(".file").on("change", "input[type='file']", function(){
			var id = $(this).attr("id");
		    var filePath = $(this).val();
	        var arr = filePath.split('\\');
	        var fileName = arr[arr.length-1];
	        $("." + id).html(fileName);
	        if(id != "attachid") {
	        	ajaxFileUpload(id);
	        }
		})
	});
	
</script>
</html>