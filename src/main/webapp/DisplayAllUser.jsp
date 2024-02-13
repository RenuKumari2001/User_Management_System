<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%ResultSet rs=(ResultSet)request.getAttribute("userList"); %>
<table border="">
	<tr>
	<th>UserId</th>
	<th>UserName</th>
	<th>UserEmail</th>
	<th>UserAddress</th>
	<th>Update</th>
	<th>Delete</th>
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
	<td><%=rs.getInt("userId")%></td>
	<td><%=rs.getString("userName")%></td>
	<td><%=rs.getString("userEmail")%></td>
	<td><%=rs.getString("userAddress")%></td>
	<td><a href="updateUser?userId=<%=rs.getInt("userId")%>">UPDATE</a></td>
	<td><a href="deleteUser?userId=<%=rs.getInt("userId")%>">DELETE</a></td>
	</tr>
	<%
	}
	%>
	</tr>
</body>
</html>