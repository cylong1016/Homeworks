<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register user</title>
</head>
<body>

<table width="650" border="0" >
  <tr>
    <td width="650" height="80" background="<%=request.getContextPath()+"/image/top.jpg" %>">&nbsp;</td>
  </tr>
  <tr>
    <td >
	<a href="<%=request.getContextPath()+"/user/login.jsp" %>" >Login</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/user/register.html" %>">Register</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/StockListServlet" %>">Watch Stock List</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/logout.do" %>">Log off</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/loadUser.do" %>">My Profile</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/showWatchList.do" %>">Watch My Stock List</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/index.do" %>">Order Cancellation</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()+"/stock/search.jsp" %>" >Search</a>
	</td>
  </tr>
</table>
<H1>Online Stock.</H1>
<BR>

<jsp:useBean id="user"
	type="edu.nju.tss.model.User"
	scope="session"></jsp:useBean> 

<H1>user with id 
<jsp:getProperty name="user" property="id" />
 was added.</H1>


</body>
</html>