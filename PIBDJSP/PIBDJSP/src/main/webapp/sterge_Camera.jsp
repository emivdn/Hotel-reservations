<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Camere</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<%
		String[] s = request.getParameterValues("primarykey");
		if (s != null) {
			jb.connect();
			jb.stergeDateTabela(s, "camere", "idcamera");
			jb.disconnect();
		%>
		<div class="alert alert-success">Datele selectate au fost
			sterse.</div>
		<%
		} else {
		%>
		<div class="alert alert-warning">Niciun element selectat pentru
			stergere.</div>
		<%
		}
		%>
		<p class="text-center mt-4">
			<a href="index.html" class="btn btn-primary"><b>Home</b></a> <a
				href="tabela_Camere.jsp" class="btn btn-secondary"><b>Camere</b></a>

		</p>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
