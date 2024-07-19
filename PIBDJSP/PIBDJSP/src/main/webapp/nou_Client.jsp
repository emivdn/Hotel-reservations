<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Client</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<%
		String Nume = request.getParameter("nume");
		String Prenume = request.getParameter("prenume");
		String Email = request.getParameter("email");
		String Numar_telefon = request.getParameter("nrtelefon");
		String Data_check_in = request.getParameter("datacheckin");
		String Data_check_out = request.getParameter("datacheckout");
		if (Nume != null) {
			jb.connect();
			jb.adaugaClient(Nume, Prenume, Email, Numar_telefon, Data_check_in, Data_check_out);
			jb.disconnect();
		%>
		<div class="alert alert-success">Datele au fost adaugate.</div>
		<%
		} else {
		%>
		<h1 class="text-center">Adauga un nou client!</h1>
		<form action="nou_Client.jsp" method="post">
			<div class="form-group">
				<label for="nume">Nume client:</label> <input type="text"
					class="form-control" name="nume" id="nume" />
			</div>
			<div class="form-group">
				<label for="prenume">Prenume client:</label> <input type="text"
					class="form-control" name="prenume" id="prenume" />
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="text"
					class="form-control" name="email" id="email" />
			</div>
			<div class="form-group">
				<label for="nrtelefon">Numar telefon:</label> <input type="text"
					class="form-control" name="nrtelefon" id="nrtelefon" />
			</div>
			<div class="form-group">
				<label for="datacheckin">Data check-in:</label> <input type="text"
					class="form-control" name="datacheckin" id="datacheckin" />
			</div>
			<div class="form-group">
				<label for="datacheckout">Data check-out:</label> <input type="text"
					class="form-control" name="datacheckout" id="datacheckout" />
			</div>
			<input type="submit" value="Adauga clientul" class="btn btn-primary" />
		</form>
		<%
		}
		%>
		<br /> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		<a href="tabela_Clienti.jsp" class="btn btn-secondary"><b>Clienti</b></a>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
