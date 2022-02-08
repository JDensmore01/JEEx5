<%--
	Document   : Person Form
	Created On : Feb 7, 2022
	Author	   : Jason Densmore
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="WEB-INF/jspf/declarativemethods.jspf" %>

<%
	errors.clear();
	setUpPerson();
	Person qPerson = new Person();
	boolean submitted = false;
	int id = 0;
	String firstName = "";
	String lastName = "";
	String email = "";
	double salary = 0;
	if (request.getParameter("btnSubmit") != null) {
		submitted = true;
		if (request.getParameter("id") != null && isNumeric(request.getParameter("id"))) {
			id = getIntegerValue(request.getParameter("id"));
			qPerson.setId(id);
		} else {
			qPerson = new Person();
		}
		
		qPerson.setFirstName(checkRequiredField(request.getParameter("firstName"), "First Name"));
		qPerson.setLastName(checkRequiredField(request.getParameter("lastName"), "Last Name"));
		qPerson.setEmailAddress(checkRequiredField(request.getParameter("emailAddress"), "Email Address"));
		String salaryParameter = checkRequiredField(request.getParameter("salary"), "Salary");
		qPerson.setSalary( 
			!salaryParameter.equals("") && isNumeric(salaryParameter, "Salary") ?
				getDoubleValue(salaryParameter) : 0
			);
		
		
		if (errors.size() == 0) {
			submitted = true;
		}
	} else {
		if (request.getParameter("id") != null && isNumeric(request.getParameter("id"))) {
			id = getIntegerValue(request.getParameter("id"));
			qPerson = person.getPerson(id);
		}
	}	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Person Form</title>
		<%@ include file="WEB-INF/jspf/header.jspf" %>
	</head>
	<body>
		<h1>Person Form</h1>
		<%@ include file="WEB-INF/jspf/navigation.jspf" %>
		
		<% if (!submitted || !errors.isEmpty()) { %>
		<form method="POST">
			<table class="table">
			<% if (qPerson != null) { %>
				<tr>
					<td>Id</td>
					<td>
						<input type="hidden" name="id"
						 value='<%=qPerson != null ? qPerson.getId() : "" %>'>
					</td>
				</tr>
				<tr>
					<td>First Name</td>
					<td>
						<input type="text" name="firstName"
						 value='<%=qPerson != null ? qPerson.getFirstName() : "" %>'>
					 </td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td>
						<input type="text" name="lastName"
						 value='<%=qPerson != null ? qPerson.getLastName() : "" %>'>
					</td>
				</tr>
				<tr>
					<td>Email Address</td>
					<td>
						<input type="text" name="emailAddress"
						 value='<%=qPerson != null ? qPerson.getEmailAddress() : "" %>'>
					</td>
				</tr>
				<tr>
					<td>Salary</td>
					<td>
						<input type="text" name="salary"
						 value='<%=qPerson != null ? qPerson.getSalary() : "" %>'>
					</td>
				</tr>
			<% } %>
			</table>
			<button name="btnSubmit" class="btn btn-primary">Submit</button>
		</form>
		<div>
			<% if (errors.size() > 0) { %>
			<ul>
				<% for (String err : errors) { %>
					<li><%=err %></li>
				<% } %>
			</ul>
			<% } %>
		</div>
		<% } else { %>
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
		<% } %>
		<%@ include file="WEB-INF/jspf/footer.jspf" %>
	</body>
</html>