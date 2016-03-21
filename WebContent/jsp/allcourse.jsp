<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 全部课程 -->
<div class="tab-pane fade in active" id="allcourse">
	<div class="content">
		<table class="list">
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
						<s:a namespace="/user" action="userinfo" target="external">
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