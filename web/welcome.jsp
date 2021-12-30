<html>

<%!String greeting = "Welcome to Web Shopping Mall";
	String tagline = "Welcome to Web Mall";%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>

<head>
	<link rel="stylesheet"
		  href="./resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>

<body>
	<%@include file="menu.jsp" %>
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>

	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>

			<%
				response.setIntHeader("Refresh", 5);
				Date day = new java.util.Date();
				String am_pm = "AM";
				int hour = day.getHours();
				int min = day.getMinutes();
				int sec = day.getSeconds();
				
				if((hour / 12) == 0){
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour - 12;
				}
				
				String CT = hour + ":" + min + ":" + sec + am_pm;
				out.print("현재 접속 시간 " + CT + "\n");
			%>
			
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>

</body>


</html>