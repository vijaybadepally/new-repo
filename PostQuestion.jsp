<%@page import="com.virtusa.entities.Questions"%>
<%@page import="com.virtusa.dao.QuestionsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.virtusa.dao.DaoConnection"%>
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
int question_id=new QuestionsDAO().generateQuestionId();
%>
    <form method="get" action="PostQuestion.jsp">
    <center>
     
        Query_id:
        <input type="text" name="query_id" value=<%=question_id %> readonly="readonly" /><br/><br/>
        Query_name:
        <input type="text" name="query_name"/><br/><br/>
        Query_description:
        <input type="text" name="query_description"/><br/><br/>
     
        <input type="submit" value="post_query"/><br/><br/>
    </center>
    </form>
     <center>
<div class="logout">
<input type="button" name="logout" value="Logout" onclick="window.location='Login.html'">
</div>
<br/>
<div class="Back">
<input type="button" name="Back" value="Back" onclick="window.location='queries.html'">
</div>
</center>
   <%
    QuestionsDAO dao=new QuestionsDAO();
    Questions questions=new Questions();
     if(request.getParameter("query_name")!=null){   
        
       questions.setQuestion_id(Integer.parseInt(request.getParameter("query_id")));
       questions.setQuestion_name(request.getParameter("query_name"));
       questions.setQuestion_description(request.getParameter("query_description"));
        out.println(dao.addQuestionsDAO(questions));      
       }
  %>
</body>
</html>
