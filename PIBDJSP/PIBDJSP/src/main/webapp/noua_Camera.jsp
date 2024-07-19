<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga camera</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<%
		String Tip_camera = request.getParameter("tipcamera");
		String Capacitate = request.getParameter("capacitate");
		String Pret_noapte = request.getParameter("pretnoapte");
		String Disponibilitate = request.getParameter("disponibilitate");
		String Facilitati = request.getParameter("facilitati");
		String Data_ultimei_curatari = request.getParameter("dataultimeicuratari");
		//int Capacitate=Integer.parseInt(capacitate);
		if (Tip_camera != null) {
			jb.connect();
			jb.adaugaCamera(Tip_camera, Capacitate, Pret_noapte, Disponibilitate, Facilitati, Data_ultimei_curatari);
			jb.disconnect();
		%>
		<div class="alert alert-success">Datele au fost adaugate.</div>
		<%
		} else {
		%>
		<h1 class="text-center">Adauga o noua camera!</h1>
		<form action="noua_Camera.jsp" method="post">
			<div class="form-group">
				<label for="tipcamera">Tip camera:</label> <input type="text"
					class="form-control" name="tipcamera" id="tipcamera" />
			</div>
			<div class="form-group">
				<label for="capacitate">Capacitate camera:</label> <input
					type="text" class="form-control" name="capacitate" id="capacitate" />
			</div>
			<div class="form-group">
				<label for="pretnoapte">Pret pe noapte:</label> <input type="text"
					class="form-control" name="pretnoapte" id="pretnoapte" />
			</div>
			<div class="form-group">
				<label for="disponibilitate">Disponibilitate camera:</label> <input
					type="text" class="form-control" name="disponibilitate"
					id="disponibilitate" />
			</div>
			<div class="form-group">
				<label for="facilitati">Facilitati camera:</label> <input
					type="text" class="form-control" name="facilitati" id="facilitati" />
			</div>
			<div class="form-group">
				<label for="dataultimeicuratari">Data ultimei curatari a
					camerei:</label> <input type="text" class="form-control"
					name="dataultimeicuratari" id="dataultimeicuratari" />
			</div>
			<input type="submit" value="Adauga camera" class="btn btn-primary" />
		</form>
		<%
		}
		%>
		<br /> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		<a href="tabela_Camere.jsp" class="btn btn-secondary"><b>Camere</b></a>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
