<%--
	Document: person
	Created on: Feb 7, 2022
	Author: Jason Densmore
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="WEB-INF/jspf/declarativemethods.jspf" %>
<%@ page import="edu.nbcc.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>People</title>
		<%@include file="WEB-INF/jspf/header.jspf" %>	
	</head>
	<body>
		<%@ include file="WEB-INF/jspf/navigation.jspf" %>
		<% setUpPerson(); %>
		<h1>Person</h1>
		<table class="table table-striped">
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email Address</th>
				<th>Salary</th>
			</tr>
			<% for (Person p : person.getPeople()) { %>
			<tr>
				<td><a href="<%=response.encodeURL("personDetails.jsp") %>?id=<%=p.getId()%>">Edit</a></td>
				<td><%=p.getFirstName() %></td>
				<td><%=p.getLastName() %></td>
				<td><%=p.getEmailAddress() %></td>
				<td><%=p.getSalary() %></td>
			</tr>
			<% } %>
		</table>
		<%@include file="WEB-INF/jspf/footer.jspf" %>
	</body>
</html>