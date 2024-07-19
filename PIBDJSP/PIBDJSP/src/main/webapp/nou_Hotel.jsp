<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga hotel</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<%
    int idcamera_hotel, idclient_hotel;
		String id1, id2, tipcamera, capacitate, pretnoapte, disponibilitate, facilitati, dataultimeicuratari, nume, prenume, email, nrtelefon, datacheckin, datacheckout, nume_hotel, oras, nrstele, animaledecompanie;    id1 = request.getParameter("idcamera");
    id2 = request.getParameter("idclient");
    nume_hotel = request.getParameter("numehotel");
    oras = request.getParameter("oras");
    nrstele = request.getParameter("nrstele");
    animaledecompanie = request.getParameter("animaledecompanie");
    if (id1 != null) {
        jb.connect();
        jb.adaugaHotel(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), nume_hotel, oras, nrstele, animaledecompanie);
        jb.disconnect();
    %>
		<div class="alert alert-success">Datele au fost adaugate.</div>
		<%
    } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("camere");
        ResultSet rs2 = jb.vedeTabela("clienti");
    %>
		<h1 class="text-center">Adauga un nou hotel!</h1>
		<form action="nou_Hotel.jsp" method="post">
			<div class="form-group">
				<label for="idcamera">IdCamera:</label> <select class="form-control"
					name="idcamera" id="idcamera">
					<%
						while (rs1.next()) {
							idcamera_hotel = rs1.getInt("idcamera");
							tipcamera = rs1.getString("tipcamera");
							capacitate = rs1.getString("capacitate");
							pretnoapte = rs1.getString("pretnoapte");
							disponibilitate = rs1.getString("disponibilitate");
							facilitati = rs1.getString("facilitati");
							dataultimeicuratari = rs1.getString("dataultimeicuratari");
						%>
					<OPTION VALUE="<%=idcamera_hotel%>"><%=idcamera_hotel%>,<%=tipcamera%>,<%=capacitate%>,<%=pretnoapte%>,<%=disponibilitate%>,<%=facilitati%>,<%=dataultimeicuratari%></OPTION>
					<%
						}
						%>
				</SELECT>
			</div>
			<div class="form-group">
				<label for="idclient">IdClient:</label> <select class="form-control"
					name="idclient" id="idclient">
					<%
						while (rs2.next()) {
							idclient_hotel = rs2.getInt("idclient");
							nume = rs2.getString("nume");
							prenume = rs2.getString("prenume");
							email = rs2.getString("email");
							nrtelefon = rs2.getString("nrtelefon");
							datacheckin = rs2.getString("datacheckin");
							datacheckout = rs2.getString("datacheckout");
						%>
					<OPTION VALUE="<%=idclient_hotel%>"><%=idclient_hotel%>,<%=nume%>,<%=prenume%>,<%=email%>,<%=nrtelefon%>,<%=datacheckin%>,<%=datacheckout%></OPTION>
					<%
						}
						%>
				</SELECT>
			</div>
			<div class="form-group">
				<label for="numehotel">Nume hotel:</label> <input type="text"
					class="form-control" name="numehotel" id="numehotel" />
			</div>
			<div class="form-group">
				<label for="oras">Oras:</label> <input type="text"
					class="form-control" name="oras" id="oras" />
			</div>
			<div class="form-group">
				<label for="nrstele">Numar de stele:</label> <input type="text"
					class="form-control" name="nrstele" id="nrstele" />
			</div>
			<div class="form-group">
				<label for="animaledecompanie">Animale de companie:</label> <input
					type="text" class="form-control" name="animaledecompanie"
					id="animaledecompanie" />
			</div>
			<input type="submit" value="Adauga hotelul" class="btn btn-primary" />
		</form>
		<%
        rs1.close();
        rs2.close();
        jb.disconnect();
    }
    %>
		<br /> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		<a href="tabela_Hoteluri.jsp" class="btn btn-secondary"><b>Hoteluri</b></a>
		<br />
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
