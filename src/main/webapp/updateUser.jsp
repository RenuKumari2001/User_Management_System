<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.xpath.XPathEvaluationResult.XPathResultType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%ResultSet rs1=(ResultSet)request.getAttribute("existingTable"); %>
<form action="updateusernew" method="post">
<table border="">
<tr>
<th>UserId</th>
<th>UserName</th>
<th>UserEmail</th>
<th>UserAddress</th>
</tr>
<%
	while(rs1.next()){
	%>

<tr>
<td><input type="number"  name="userId" readonly="true" value="<%=rs1.getInt("userId")%>" required="required"></td>
<td><input type="text"  name="userName" value="<%=rs1.getString("userName")%>"  required="required" ></td>
<td><input type="text"  name="userEmail"   value="<%=rs1.getString("userEmail")%>"required="required"></td>
<td><input type="text"    name="userAddress"   value="<%=rs1.getString("userAddress")%>"required="required"><br></td>
</tr>
<%} %>

</table>
<input type="submit" value="Update">
</form>
</body>
</html>