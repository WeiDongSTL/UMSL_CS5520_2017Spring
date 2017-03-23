<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
String source = request.getParameter("source");
String title = request.getParameter("title");
String newsContent = request.getParameter("content");
try {
    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection( "jdbc:postgresql://localhost:5432/newsdb", "power", "umsl");
    Statement st = conn.createStatement();
    st.executeUpdate("INSERT INTO news (id , source, title, content) VALUES (" + id + ", '" + source + "', '" + title + "', '" + newsContent + "')" );
    out.println("Data has been successfully inserted into database:");
    out.println(id + "  " + source + "  " + title + "  " + newsContent);
}catch(Exception e) {
    System.out.println(e);
    e.printStackTrace();
}
%>
