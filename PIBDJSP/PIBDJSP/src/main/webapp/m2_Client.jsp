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
		<h1 class="text-center">Tabela Clienti:</h1>
		<p class="text-center">
			<a href="tabela_Clienti.jsp" class="btn btn-primary"><b>Clienti</b></a> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		</p>
		<%
    jb.connect();
    int aux = java.lang.Integer.parseInt(request.getParameter("idclient"));
    String Nume = request.getParameter("nume");
    String Prenume = request.getParameter("prenume");
    String Email = request.getParameter("email");
    String Numar_telefon = request.getParameter("nrtelefon");
    String Data_check_in = request.getParameter("datacheckin");
    String Data_check_out = request.getParameter("datacheckout");
    String[] valori = { Nume, Prenume, Email, Numar_telefon, Data_check_in, Data_check_out };
    String[] campuri = { "nume", "prenume", "email", "nrtelefon", "datacheckin", "datacheckout" };
    jb.modificaTabela("clienti", "idclient", aux, campuri, valori);
    jb.disconnect();
    %>
		<h2 class="text-center text-success">Modificarile au fost
			efectuate!</h2>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
