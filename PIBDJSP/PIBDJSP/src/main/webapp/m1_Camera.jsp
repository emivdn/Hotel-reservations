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
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<h1 class="text-center">Camere:</h1>
		<p class="text-center">
			<a href="modifica_Camera.jsp" class="btn btn-primary"><b>Inapoi</b></a> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		</p>
		<%
    jb.connect();
    int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
    ResultSet rs = jb.intoarceLinieDupaId("camere", "idcamera", aux);
    rs.first();
    String Tip_camera = rs.getString("tipcamera");
    int Capacitate = rs.getInt("capacitate");
    String Pret_noapte = rs.getString("pretnoapte");
    String Disponibilitate = rs.getString("disponibilitate");
    String Facilitati = rs.getString("facilitati");
    String Data_ultimei_curatari = rs.getString("dataultimeicuratari");
    rs.close();
    jb.disconnect();
    %>
		<form action="m2_Camera.jsp" method="post">
			<div class="form-group">
				<label>IdCamera:</label> <input type="text" class="form-control"
					name="idcamera" value="<%=aux%>" readonly />
			</div>
			<div class="form-group">
				<label>Tip camera:</label> <input type="text" class="form-control"
					name="tipcamera" value="<%=Tip_camera%>" />
			</div>
			<div class="form-group">
				<label>Capacitate camera:</label> <input type="text"
					class="form-control" name="capacitate" value="<%=Capacitate%>" />
			</div>
			<div class="form-group">
				<label>Pret pe noapte:</label> <input type="text"
					class="form-control" name="pretnoapte" value="<%=Pret_noapte%>" />
			</div>
			<div class="form-group">
				<label>Disponibilitate camera:</label> <input type="text"
					class="form-control" name="disponibilitate"
					value="<%=Disponibilitate%>" />
			</div>
			<div class="form-group">
				<label>Facilitati camera:</label> <input type="text"
					class="form-control" name="facilitati" value="<%=Facilitati%>" />
			</div>
			<div class="form-group">
				<label>Data ultimei curatari a camerei:</label> <input type="text"
					class="form-control" name="dataultimeicuratari"
					value="<%=Data_ultimei_curatari%>" />
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
