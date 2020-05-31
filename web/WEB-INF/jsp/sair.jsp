<%-- 
    Document   : sair
    Created on : 12/04/2019, 21:20:09
    Author     : ufrn
--%>

<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sair</title>
    </head>
    <body>
        <!--JSP apenas para encerrar a sessão-->
        <h1>Saindo...</h1>
        <%
            session.invalidate();

            response.sendRedirect("home");
        %>
    </body>
</html>
