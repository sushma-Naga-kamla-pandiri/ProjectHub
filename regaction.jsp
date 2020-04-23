<%@page import="java.sql.Statement"%>
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
    String s1 = request.getParameter("regd_no");    
    String s2 = request.getParameter("password");
    String s3 = request.getParameter("branch");
    String s4 = request.getParameter("year");

    try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ophdb",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into student(regd_no,password,branch,year)values('"+s1+"','"+s2+"','"+s3+"','"+s4+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("index.html");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("reg.html");
    }
    }
    catch(Exception e) {
    	e.printStackTrace();
    }
%>
</body>
</html>