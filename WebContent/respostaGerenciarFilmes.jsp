<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Filme" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerenciar Filmes</title>
</head>
<body>

<a href="/IMDb/index.html">In�cio</a>


<h1>Todos os filmes</h1>

<% ArrayList<Filme> filmes = (ArrayList<Filme>) request.getAttribute("filme");  %>

<table border=1>
<td>Filmes</td>

		<%for(Filme f: filmes){%>
				<tr><td>
				<a href="gerenciarDetalharFilme?id_filme=<%=f.getId_filme() %>"><%=f.getTitulo()%></a></td>
				<td><form action="/IMDb/excluirFilme"><input type="hidden" name="id_filme" value="<%=f.getId_filme() %>">
				<input type="submit" value="Excluir!"/></td></tr>
				
			<% }%>

</table>

<a href="/IMDb/paginaIncluirFilme">Adicionar Filme(+)</a>


</body>
</html>-->