<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.Filme" %>
<%@ page import="model.Ator" %>
<%@ page import="model.Genero" %>
<%@ page import="model.Diretor" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalhes do Filme</title>
</head>
<body>

<%
Filme filme = (Filme) request.getAttribute("filme");
ArrayList<Ator> atores = (ArrayList<Ator>) request.getAttribute("ator"); 
ArrayList<Ator> todosAtores = (ArrayList<Ator>) request.getAttribute("todosAtores"); 

ArrayList<Genero> genero = (ArrayList<Genero>) request.getAttribute("genero");
ArrayList<Diretor> diretores = (ArrayList<Diretor>) request.getAttribute("diretor");
%>


			Nome: <%= filme.getTitulo() %><br>
		    T�tulo em Ingl�s: <%= filme.getTitulo_ingles() %><br>
		    Ano de lan�amento: <%= filme.getAno() %> <br>
			Nota: <%= filme.getNota() %><br>
			Dura��o: <%= filme.getDuracao() %><br>
			Sinopse: <%= filme.getSinopse() %><br>
			
<td>G�nero: </td>

<%
	for (Genero g : genero) {
		out.println("<td><a href='/IMDb/detalharGenero?id_genero=" + g.getId_genero() + "&mensagem='>"
				+ g.getTipo() + "</a></td>");
	}
%><br>

<td>Diretor:<td>
<%
	for (Diretor diretor : diretores) {
		out.println("<tr><td><a href='/IMDb/detalharDiretor?id_diretor=" + diretor.getId_diretor() + "&mensagem='>"
	+ diretor.getNome() + "</a></td></tr>" );
	}
%><br>



<table border=2>
<td>Personagem</td><td>Ator</td>

<%
	for (Ator ator : atores) {
		out.println("<tr><td>" + ator.getPersonagem() + "</td><td><a href='/IMDb/detalharAtor?id_ator=" + ator.getId_ator() + "&mensagem='>"
	+ ator.getNome() + "</a></td></tr>");
	}
%>

</table>








<table>
 <tr>
 <%//name='idfilme' value='" + f.getIdfilme() + "'
 out.println("<form action='/IMDb/associarAtorAFilme' method='GET'>");
 
 %>
 <td>
<select name="id_ator">
<%
for (Ator a: todosAtores) {
out.println("<option value='" + a.getId_ator() + "'>" +  a.getNome() + "</option>");
}
%>
</select>			
</td>
<td>
<input type='text' name='personagem'>
</td>
<td>
<%
out.println("<input type='hidden' name='id_filme' value='" + filme.getId_filme() + "'>" +
			"<input type='submit' name='inserindo' value='Inserir'>");
%>
</td>
</form>
</tr>
 <tr>
 <%//name='idfilme' value='" + f.getIdfilme() + "'
 out.println("<form action='/IMDb/associarDiretorAFilme' method='GET'>");
 
 %>
 <td>
<select name="id_diretor">
<%
for (Diretor d: diretores) {
out.println("<option value='" + d.getId_diretor() + "'>" +  d.getNome() + "</option>");
}
%>
</select>			
</td>
<td>
<%
out.println("<input type='hidden' name='id_filme' value='" + filme.getId_filme() + "'>" +
			"<input type='submit' name='inserindo' value='Inserir'>");
%>
</td>
</form>
</tr>
</table>

</body>
</html>