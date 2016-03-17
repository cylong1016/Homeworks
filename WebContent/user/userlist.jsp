<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>
	<s:property value="message"/><br/>
	<a href="register.jsp">注册用户</a><br/>
	<table>
		<tr>
			<td>姓名</td>
			<td>账号</td>
			<td>密码</td>
			<td>性别</td>
			<td>电话</td>
			<td>邮箱</td>
			<td>身份</td>
		</tr>
		<s:iterator id="user" value="userList"> 
		<tr id="${user.id}"> 
			<td>${user.name}</td>
			<td>${user.userid}</td>
			<td>${user.password}</td>
			<td>${user.sex}</td>
			<td>${user.phone}</td>
			<td>${user.mail}</td>
			<td>${user.iden}</td>
			<td><a href="<s:url action="To"><s:param name="user.userid" value="user.userid"/></s:url>">编辑</a></td> 
			<td><button id="${user.id}">删除</button></td> 
		</tr>
		</s:iterator>
	</table>
</body>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script>
	function del($id) {
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath() + "/user/deleteuser" %>",
			data:{//设置数据源 
				id: $id
			},
			dataType:"json",
			success:function(data){
				var d = eval("(" + data + ")");
				// alert(d.message);
				$("#" + $id).hide(1000);
			},
			error:function(){ 
				alert("系统异常，请稍后重试！"); 
			}
		})
	}
	$("button").click(function(){
		del($(this).attr("id"));
	});
</script>
</html>