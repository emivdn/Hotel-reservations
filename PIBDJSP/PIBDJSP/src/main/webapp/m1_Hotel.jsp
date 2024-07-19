<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Hoteluri</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div class="container mt-4">
		<h1 class="text-center">Hoteluri:</h1>
		<p class="text-center">
			<a href="modifica_Hotel.jsp" class="btn btn-primary mr-2"><b>Inapoi</b></a> <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		</p>
		<%
    jb.connect();
		String nume, prenume, email, nrtelefon, datacheckin, datacheckout, tipcamera, capacitate, pretnoapte, disponibilitate, facilitati, dataultimeicuratari, nume_hotel, oras, nrstele, animaledecompanie;
		int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
		ResultSet rs = jb.intoarceHotelId(aux);
		rs.first();
		int id1 = rs.getInt("idcamera_hotel");
		int id2 = rs.getInt("idclient_hotel");
		tipcamera = rs.getString("tipcamera");
		capacitate = rs.getString("capacitate");
		pretnoapte = rs.getString("pretnoapte");
		disponibilitate = rs.getString("disponibilitate");
		facilitati = rs.getString("facilitati");
		dataultimeicuratari = rs.getString("dataultimeicuratari");
		nume = rs.getString("nume");
		prenume = rs.getString("prenume");
		email = rs.getString("email");
		nrtelefon = rs.getString("nrtelefon");
		datacheckin = rs.getString("datacheckin");
		datacheckout = rs.getString("datacheckout");
		nume_hotel = rs.getString("numehotel");
		oras = rs.getString("oras");
		nrstele = rs.getString("nrstele");
		animaledecompanie = rs.getString("animaledecompanie");
		ResultSet rs1 = jb.vedeTabela("camere");
		ResultSet rs2 = jb.vedeTabela("clienti");
		int idcamera, idclient;
    %>
		<form action="m2_Hotel.jsp" method="post">
			<div class="form-group">
				<label for="idhotel">IdHotel:</label> <input type="text"
					class="form-control" name="idhotel" size="30" value="<%=aux%>"
					readonly />
			</div>
			<div class="form-group">
				<label for="idcamera">IdCamera:</label> <select class="form-control"
					name="idcamera">
					<%
						while (rs1.next()) {
							idcamera = rs1.getInt("idcamera");
							tipcamera = rs1.getString("tipcamera");
							capacitate = rs1.getString("capacitate");
							pretnoapte = rs1.getString("pretnoapte");
							disponibilitate = rs1.getString("disponibilitate");
							facilitati = rs1.getString("facilitati");
							dataultimeicuratari = rs1.getString("dataultimeicuratari");
							if (idcamera != id1) {
						%>
					<OPTION VALUE="<%=idcamera%>"><%=idcamera%>,
						<%=tipcamera%>,
						<%=capacitate%>,
						<%=pretnoapte%>,
						<%=disponibilitate%>,
						<%=facilitati%>,
						<%=dataultimeicuratari%></OPTION>
					<%
						} else {
						%>
					<OPTION selected="yes" VALUE="<%=idcamera%>"><%=idcamera%>,
						<%=tipcamera%>,
						<%=capacitate%>,
						<%=pretnoapte%>,
						<%=disponibilitate%>,
						<%=facilitati%>,
						<%=dataultimeicuratari%></OPTION>
					<%
						}
						}
						%>
				</select>
			</div>
			<div class="form-group">
				<label for="idclient">IdClient:</label> <select class="form-control"
					name="idclient">
					<%
						while (rs2.next()) {
							idclient = rs2.getInt("idclient");
							nume = rs2.getString("nume");
							prenume = rs2.getString("prenume");
							email = rs2.getString("email");
							nrtelefon = rs2.getString("nrtelefon");
							datacheckin = rs2.getString("datacheckin");
							datacheckout = rs2.getString("datacheckout");
							if (idclient != id2) {
						%>
						<OPTION VALUE="<%=idclient%>"><%=idclient%>,
							<%=nume%>,
							<%=prenume%>,
							<%=email%>,
							<%=nrtelefon%>,
							<%=datacheckin%>,
							<%=datacheckout%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idclient%>"><%=idclient%>,
							<%=nume%>,
							<%=prenume%>,
							<%=email%>,
							<%=nrtelefon%>,
							<%=datacheckin%>,
							<%=datacheckout%></OPTION>
						<%
						}
						}
						%>
				</select>
			</div>
			<div class="form-group">
				<label for="numehotel">Nume hotel:</label> <input type="text"
					class="form-control" name="numehotel" value="<%=nume_hotel%>" />
			</div>
			<div class="form-group">
				<label for="oras">Oras:</label> <input type="text"
					class="form-control" name="oras" value="<%=oras%>" />
			</div>
			<div class="form-group">
				<label for="nrstele">Numar de stele:</label> <input type="text"
					class="form-control" name="nrstele" value="<%=nrstele%>" />
			</div>
			<div class="form-group">
				<label for="animaledecompanie">Animale de companie:</label> <input
					type="text" class="form-control" name="animaledecompanie"
					value="<%=animaledecompanie%>" />
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
<%
 rs.close();
 rs1.close();
 rs2.close();
 jb.disconnect();
 %>
</html>