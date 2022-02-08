<%--
	Document   : personDetails
	Created On : Feb 7, 2022
	Author     : Jason Densmore
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="WEB-INF/jspf/declarativemethods.jspf" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Person Details</title>
		<%@ include file="WEB-INF/jspf/header.jspf" %>
	</head>
	<body>
		<h1>Person Details</h1>
		<%@ include file="WEB-INF/jspf/navigation.jspf" %>
		<%
			setUpPerson();
			Person qPerson = null;
			if (request.getParameter("id") != null && isNumeric(request.getParameter("id"))) {
				int id = getIntegerValue(request.getParameter("id"));
				qPerson = person.getPerson(id);
			}
		%>
		
		<table class="table">
			<tr>
				<td>Id</td>
				<td><%=qPerson.getId() %></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><%=qPerson.getFirstName() %></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><%=qPerson.getLastName() %></td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><%=qPerson.getEmailAddress() %></td>
			</tr>
			<tr>
				<td>Salary</td>
				<td><%=qPerson.getSalary() %></td>
			</tr>
		</table>
		<a href="<%=response.encodeURL("personForm.jsp") %>?id=<%=qPerson.getId() %>">Modify</a>
		
		<%@ include file="WEB-INF/jspf/footer.jspf" %>
	</body>
</html>