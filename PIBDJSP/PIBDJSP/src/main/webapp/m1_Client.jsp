<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Clienti</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<h1 class="text-center">Clienti</h1>
		<p class="text-center">
			<a href="modifica_Client.jsp" class="btn btn-primary"><b>Inapoi</b></a> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		</p>
		<%
    jb.connect();
    int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
    ResultSet rs = jb.intoarceLinieDupaId("clienti", "idclient", aux);
    rs.first();
    String Nume = rs.getString("nume");
    String Prenume = rs.getString("prenume");
    String Email = rs.getString("email");
    String Numar_telefon = rs.getString("nrtelefon");
    String Data_check_in = rs.getString("datacheckin");
    String Data_check_out = rs.getString("datacheckout");
    rs.close();
    jb.disconnect();
    %>
		<form action="m2_Client.jsp" method="post">
			<div class="form-group">
				<label>IdClient:</label> <input type="text" class="form-control"
					name="idclient" value="<%=aux%>" readonly />
			</div>
			<div class="form-group">
				<label>Nume:</label> <input type="text" class="form-control"
					name="nume" value="<%=Nume%>" />
			</div>
			<div class="form-group">
				<label>Prenume:</label> <input type="text" class="form-control"
					name="prenume" value="<%=Prenume%>" />
			</div>
			<div class="form-group">
				<label>Email:</label> <input type="text" class="form-control"
					name="email" value="<%=Email%>" />
			</div>
			<div class="form-group">
				<label>Numar de telefon:</label> <input type="text"
					class="form-control" name="nrtelefon" value="<%=Numar_telefon%>" />
			</div>
			<div class="form-group">
				<label>Data check-in:</label> <input type="text"
					class="form-control" name="datacheckin" value="<%=Data_check_in%>" />
			</div>
			<div class="form-group">
				<label>Data check-out:</label> <input type="text"
					class="form-control" name="datacheckout"
					value="<%=Data_check_out%>" />
			</div>
			<p class="text-center">
				<input type="submit" value="Modifica linia" class="btn btn-primary">
			</p>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
