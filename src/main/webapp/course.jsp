<%-- 
    Document   : people
    Created on : Feb 1, 2021, 7:58:03 AM
    Author     : Chris.Cusack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/declarativemethods.jspf" %>
<%@ page import="edu.nbcc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navigation.jspf" %>
         <% setUpCourse(); %>
        <h1>Course</h1>
        <table class="table table-striped">
            <tr>
                <th>
                    Course Id
                </th>
                <th>Course Name</th>
                <th>Course Term</th>              
            </tr>           
           <% for (Course c : course.getCourses()) { %>
            <tr>
                <td><a href="<%=response.encodeURL("courseDetails.jsp")%>?id=<%=c.getId()%>">Click Me</a></td>
                <td><%= c.getName() %></td>
                <td><%= c.getTerm() %></td>
             
            </tr>
           <% } %> 
                
        </table>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
