package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Conexao;
import dao.IncluirAtorDAO;
import dao.IncluirFilmeDAO;

/**
 * Servlet implementation class ServletIncluiContato
 */
@WebServlet("/incluirAtor")
public class ServletIncluirAtor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletIncluirAtor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Recuperar parametros
		String nome = request.getParameter("nome");
		String ano = request.getParameter("ano");
		String cidade_nasc = request.getParameter("cidade_nasc");
		//Obter uma conexao com o BD
		Connection conexao = Conexao.getConexao();
		//Criar a DAO
		IncluirAtorDAO iad = new IncluirAtorDAO(conexao);
		//Inclui o contato
		boolean resultado = iad.IncluirAtor(nome, ano, cidade_nasc);
		
		//----- Escrevendo a resposta ao cliente -----
		PrintWriter out = response.getWriter();
		out.println("<HTML><HEAD><TITLE>INCLUS�O DE Ator</TITLE></HEAD>");
		out.println("<BODY>");
				
		//Verificar se a inclusao foi bem sucedida
		if (resultado) {
			out.println("<H1>CONTATO INCLU�DO COM SUCESSO</H1>");
		} else {
			out.println("<H1>ERRO AO INCLUIR CONTATO</H1>");
		}
				
		out.println("</BODY></HTML>");
	}

}
