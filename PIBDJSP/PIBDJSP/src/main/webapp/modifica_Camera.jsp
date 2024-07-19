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
		<h1 class="text-center">Camere</h1>
		<p class="text-center">
			 <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
		</p>
		<form action="m1_Camera.jsp" method="post">
			<table class="table table-hover table-bordered" align="center">
				<thead class="thead-dark">
					<tr>
						<th><b>Mark:</b></th>
						<th><b>IdCamera:</b></th>
						<th><b>Tip Camera:</b></th>
						<th><b>Capacitate:</b></th>
						<th><b>Pret pe noapte:</b></th>
						<th><b>Disponibilitate:</b></th>
						<th><b>Facilitati:</b></th>
						<th><b>Data ultimei curatari:</b></th>
					</tr>
				</thead>
				<tbody>
					<%
                jb.connect();
                ResultSet rs = jb.vedeTabela("camere");
                long x;
                while (rs.next()) {
                    x = rs.getLong("idcamera");
                %>
					<tr>
						<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
						<td><%= x%></td>
						<td><%=rs.getString("tipcamera")%></td>
						<td><%=rs.getInt("capacitate")%></td>
						<td><%=rs.getString("pretnoapte")%></td>
						<td><%=rs.getString("disponibilitate")%></td>
						<td><%=rs.getString("facilitati")%></td>
						<td><%=rs.getString("dataultimeicuratari")%></td>
					</tr>
					<%
                }
                jb.disconnect();
                %>
				</tbody>
			</table>
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
