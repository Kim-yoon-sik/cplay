<html>
<head>
	<title>Home</title>
	<script type="text/javascript">
	self.location ="/cplay/mlist";
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<%-- <P>  The time on the server is ${serverTime}. </P> --%>
	
	<%
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_birth = request.getParameter("mem_birth");
		String mem_phone = request.getParameter("mem_phone");
		String mem_address = request.getParameter("mem_address");
		
		out.println(mem_id + "<br>");
		out.println(mem_name + "<br>");
		out.println(mem_birth + "<br>");
		out.println(mem_phone + "<br>");
		out.println(mem_address + "<br>");
	%>
</body>
</html>
