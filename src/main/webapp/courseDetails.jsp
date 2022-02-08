<%-- 
    Document   : courseDetails
    Created on : Jan 22, 2020, 2:04:29 PM
    Author     : Chris.Cusack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/declarativemethods.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body>
        <h1>Post Example</h1>
        <%@include file="WEB-INF/jspf/navigation.jspf" %>
        <% setUpCourse();
     	Course qCourse = null;
     	if (request.getParameter("id") != null && isNumeric(request.getParameter("id"))) {
     		int id = getIntegerValue(request.getParameter("id"));
     		qCourse = course.getCourse(id);
     	}%>

        <table class="table">               
            <tr>                    
                <td>Course Id</td>
                <td><%=qCourse.getId() %></td>
            </tr>
            <tr>                    
                <td>Course Name</td>
                <td><%=qCourse.getName() %></td>
            </tr>
            <tr>                    
                <td>Course Term</td>
                <td><%=qCourse.getTerm() %></td>
            </tr>   
           
        </table>
      
        <a href="<%=response.encodeURL("courseForm.jsp")%>?id=<%=qCourse.getId()%>">Modify</a>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>    
</html>
