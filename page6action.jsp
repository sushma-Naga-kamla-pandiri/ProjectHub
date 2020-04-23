<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border="2">
<tr><td>Project title</td><td>Project theme</td><td>Technology Used</td></tr>
<%
String s1=request.getParameter("branch");
String s2=request.getParameter("batch");
String s3=request.getParameter("technologies");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ophdb", "root", "");
	PreparedStatement ps=con.prepareStatement("select * from admin where branch='"+s1+"' and batch='"+s2+"' and technologies='"+s3+"'");
	ResultSet rs=ps.executeQuery();
	%><h1>Project Details</h1><% 
	while(rs.next()) {
		%>
		<tr><td><%=rs.getString("project_title")%></td>
	<td><%=rs.getString("theme")%></td>
	<td><%=rs.getString("technologies")%></td></tr>
	
		<% 
	}
	
	%>
	</table><br><br><br>
	<a href="index.html">Home</a>
	<a href="page6.html">Back</a>
	<% 
	}catch(Exception e) {
	e.printStackTrace();
	}
%>

</body>
</html>