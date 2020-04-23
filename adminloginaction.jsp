<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
String s1=request.getParameter("regd_no");
String s2=request.getParameter("password");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ophdb", "root", "");
	PreparedStatement ps=con.prepareStatement("select * from admindetails where regd_no='"+s1+"' and password='"+s2+"'");
	ResultSet rs=ps.executeQuery();
	if(rs.next()) {
		response.sendRedirect("admin.html");
	}
	else
	{
		response.sendRedirect("login.html");
		}
		}
catch(Exception e) {
	e.printStackTrace();
}
		%>
</body>
</html>