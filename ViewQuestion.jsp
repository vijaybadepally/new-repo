<%@page import="java.util.List"%>
<%@page import="com.virtusa.entities.Questions"%>
<%@page import="com.virtusa.dao.QuestionsDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.virtusa.dao.DaoConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#FFF0F5">




 <form style="background-color:#B0E0E6 " method="get" action="ViewQuestion.jsp">
   <center>
       Question_name:
<input type="text" name="Query_name"><br>


<input type="submit"   value=" view"><br>
       

</center>
    </form>
    <%   
            if(request.getParameter("Query_name") != null){
            QuestionsDAO questions=new QuestionsDAO();
            List<Questions> qes=questions.viewQuestion(request.getParameter("Query_name"));
           // if(qes!=null){
    %>
            <table border="3">
    <tr>
      
        <th>Query_id</th>
        <th>Query_name</th>
        <th>Query_desription</th>
        <th>Query_status</th>
        <th>Posted_date</th>
    </tr>
    <tr>
     <%
     for(Questions q:qes){
     %>
         
         <td><%=q.getQuestion_id() %></td>
        <td><%=q.getQuestion_name() %>
        <td><%=q.getQuestion_description() %></td>
        <td><%=q.getQuestion_status() %> </td>
        <td><%=q.getQuestion_posted_date() %></td>
    </tr>
                <%
           }
            }
            else{
            	out.println("no such question found.....");
            }
            
              %>
 <center>
<div class="logout">
<input type="button" name="logout" value="Logout" onclick="window.location='Login.html'">
</div><br/>
<div class="Back">
<input type="button" name="Back" value="Back" onclick="window.location='queries.html'">
</div>
</center>
</body>
</html>
