<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Ator" %>
<%@ page import="model.Diretor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Diretores</title>
</head>
<body>
<h1>Todos os Diretores</h1>

<% ArrayList<Diretor> diretores = (ArrayList<Diretor>) request.getAttribute("diretor");  %>

<table border=1>
<tr><th>Diretores</th></tr>

<%
	for (Diretor diretor : diretores) {
		out.println("<tr><td><a href='/IMDb/detalharDiretor?id_diretor=" + diretor.getId_diretor() + "&mensagem='>"
	+ diretor.getNome() + "</a></td></tr>" );
	}
%>

</table>

<a href="/IMDb/index.html">P�gina Anterior</a>

</body>
</html>