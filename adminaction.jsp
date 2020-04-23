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
<%
String project_title=request.getParameter("project_title");
String theme=request.getParameter("theme");
String branch=request.getParameter("branch");
String project_leader=request.getParameter("project_leader");
String batch=request.getParameter("batch");
String technologies=request.getParameter("technologies");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ophdb","root" ,"");
PreparedStatement ps=con.prepareStatement("insert into admin values('"+project_title+"','"+theme+"','"+branch+"','"+project_leader+"','"+batch+"','"+technologies+"')");
int i=ps.executeUpdate();
if(i>0) {
	//session.setAttribute("key",regd_no);
	//response.sendRedirect("Process_titles.jsp");
	%><h2>Successfully inserted</h2><br>
	<a href="admin.html">NEXT PROJECT DETAILS</a>&nbsp&nbsp&nbsp&nbsp&nbsp
	<a href="index.html">BACK TO HOME PAGE</a><%
}else{
%>
<h1>dosen't inserted</h1>
<%
}
}catch (Exception e){
	System.out.println(e);
}
%>
</body>
