<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SELECT Operation</title>
</head>
<body>

<sql:setDataSource var="postgre" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/newsdb"
     user="power"  password="umsl"/>
 
<sql:query dataSource="${postgre}" var="result">
SELECT * from news;
</sql:query>
<%--
<sql:update dataSource="${postgre}" var="updateResult">
    INSERT INTO news VALUES (id, , ,); 
</sql:update>
 --%>
 
<center>
<h1>Project Name: ­ Power News Management System</h1>
<%--
<h4>Author: Kane, Alexander; Gurung, Gyan; Walker, Joel; Belton, Dillon; Stephen, Benjamin; szunrai@gmail.com; Dong, Wei</h4>
<p>
Welcome to the <b>Spring Boot-MVC-JPA-PostgreSQL-Maven Application!</b><br/>
</p>
 --%>
<h3>Course: UMSL CS5520-2017-Spring</h3>
	<fieldset>
		<form id="justSavedForm" 
			action="justSavedNews.jsp" method="POST">
		<br/>
		<input name = "id"      path="id" placeholder="Input id"/>
		<input name = "source"  path="source" placeholder="Input source"/>
		<input name = "title"   path="title" placeholder="Input title"/>
		<input name = "content" path="content" placeholder="Input content"/>
		<input type="submit" value="Save"/>
		<br/><br/>
		<br>

		<fieldset>
            <h4> Current news saved in database: </h4>
            <table border="1" width="100%">
            <tr>
               <th>ID</th>
               <th>Source</th>
               <th>Title</th>
               <th>Content</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
            <tr>
               <td><c:out value="${row.id}"/></td>
               <td><c:out value="${row.source}"/></td>
               <td><c:out value="${row.title}"/></td>
               <td><c:out value="${row.content}"/></td>
            </tr>
            </c:forEach>
            </table>
		</fieldset>
		

		</form>
	</fieldset>
 
</body>
</html>
