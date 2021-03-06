<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<title>欢迎来到课程管理系统-课程管理</title>
	<jsp:include  page="../jsp/head.jsp"/>
	<link href="<%=request.getContextPath() + "/css/courselist.css" %>" rel="stylesheet">
</head>
<body>
<jsp:include  page="../jsp/adminNavbar.jsp"/>
<div class="container box">
	<ul class="nav nav-tabs nav-stacked sidebar">
		<li role="presentation" class="active"><a href="#allcourse" data-toggle="tab">全部课程</a></li>
		<li role="presentation"><a href="#setcourse" data-toggle="tab">添加课程</a></li>
	</ul>
	<div class="tab-content">
		<!-- 提示信息 -->
		<span id="hint" class="success"><s:property value="message"/></span>
		<!-- 全部课程 -->
		<div class="tab-pane fade in active" id="allcourse">
			<div class="content">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" aria-describedby="sizing-addon3" placeholder="搜索课程……">
					<span class="input-group-addon" id="sizing-addon3">
					<a href=""><span style="color:white">搜索</span></a></span>
				</div>
				<table class="courselist">
					<tr>
						<th>课程名</th>
						<th>任课教师</th>
						<th>开课时间</th>
						<th>结课时间</th>
					</tr>
					<s:iterator id="course" value="courseList">
						<tr id="${course.id}" data-toggle="modal" data-target="#courseinfo"
							data-id="${course.id}"
							data-cname="${course.cname}"
							data-instructor="${course.instructor}"
							data-iname="${course.iname}"
							data-semester="${course.semester}"
							data-end="${course.end}"
							data-description="${course.description}"> 
							<td>${course.cname}</td>
							<td>${course.iname}</td>
							<td>${course.semester}</td>
							<td>${course.end}</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<!-- 设置课程 -->
		<div class="tab-pane fade" id="setcourse">
			<div class="content">
				<s:form action="/admin/setcourse" method="post" theme="simple">
					<table class="courseinfo">
						<tr>
							<td class="first_col">* 课程名称</td>
							<td><s:textfield id="cname" name="course.cname" />
							<span id="cname_error" class="error">请输入名称</span></td>
						</tr>
						<tr>
							<td class="first_col">任课教师</td>
							<td><s:select name="course.instructor" list="%{teacherList}"
       							headerKey="空"
       							headerValue="请选择任课老师"
       							listKey="id"
								listValue="name" /></td>
						</tr>
						<tr>
							<td class="first_col">开课时间</td>
							<td><input type=month name="course.semester" /></td>
						</tr>
						<tr>
							<td class="first_col">结课时间</td>
							<td><input type=month name="course.end" /></td>
						</tr>
						<tr>
							<td class="first_col description">课程描述</td>
							<td><s:textarea name="course.description" /></td>
						</tr>
						<tr>
							<td class="first_col"></td>
				   			<td>
								<input class="button pink" type="submit" onclick="return check_input()" value="添加" />
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="courseinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">
				<s:form id="courseinfo-form" action="/admin/updatecourse" method="post" theme="simple">
					<table class="courseinfo">
						<tr>
							<td class="first_col">* 课程名称</td>
							<td><s:textfield id="cname" name="course.cname" />
							<span id="cname_error" class="error">请输入名称</span></td>
						</tr>
						<tr>
							<td class="first_col">任课教师</td>
							<td><s:select id="instructor" name="course.instructor" list="%{teacherList}"
       							headerKey="空"
       							headerValue="请选择任课老师"
       							listKey="id"
								listValue="name" /></td>
						</tr>
						<tr>
							<td class="first_col">开课时间</td>
							<td><input type=month id="semester" name="course.semester" /></td>
						</tr>
						<tr>
							<td class="first_col">结课时间</td>
							<td><input type=month id="end" name="course.end" /></td>
						</tr>
						<tr>
							<td class="first_col description">课程描述</td>
							<td><s:textarea id="description" name="course.description" /></td>
						</tr>
					</table>
						<input type="hidden" name="course.id" />
				</s:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="button pink" data-dismiss="modal">关闭</button>
				<button type="button" class="button pink upd" data-dismiss="modal">保存更改</button>
				<button type="button" class="button red del" data-dismiss="modal">删除</button>
			</div>
		</div>
	</div>
</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="<%=request.getContextPath() + "/js/bootstrap.js" %>"></script>
<script src="<%=request.getContextPath() + "/js/my.js" %>"></script>
<script>

	var hint = $("#hint");
	var message = "<%=request.getParameter("message") %>";
	
	if(message != "null") {
		hint.css("visibility", "visible");
		hint.fadeIn("fast");
		hint.fadeOut(3000);	// 几秒后消失
	}
	
	//检查输入是否合法
	function check_input() {
	    var cname = document.getElementById("cname").value;
	    var cname_error = document.getElementById("cname_error");
	    var skip = true; // 是否跳转
	    if(cname.length == 0) {
	    	cname_error.style.visibility = "visible";
	        skip = false;
	    } else {
	        userid_error.style.visibility = "hidden";
	    }
	   
	    return skip;
	}
	
	$('#courseinfo').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var id = button.data('id')
		var cname = button.data('cname')
		var instructor = button.data('instructor')
		var iname = button.data('iname')
		var semester = button.data('semester')
		var end = button.data('end')
		var description = button.data('description')
		var modal = $(this)
		modal.find('.modal-title').text(cname)
		modal.find('input[name="course.id"]').val(id)
		modal.find('#cname').val(cname)
		modal.find('#semester').val(semester);
		modal.find('#end').val(end);
		modal.find('#instructor').val(instructor);
		modal.find('#description').val(description);
		modal.find('.del').attr("id", id)
	})
	
	$(".del").click(function(){
		del($(this).attr("id"), hint, "<%=request.getContextPath() + "/admin/deletecourse" %>");
	});
	
	$(".upd").click(function(){
		upd($("#courseinfo-form").serialize(), hint, "<%=request.getContextPath() + "/admin/updatecourse" %>");
	});
	
	$(document).ready(function(){
		$("#courselist").attr("class", "active");
	});
</script>
</html>