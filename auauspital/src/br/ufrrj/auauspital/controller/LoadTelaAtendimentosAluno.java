package br.ufrrj.auauspital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufrrj.auauspital.dao.ProntuarioDao;
import br.ufrrj.auauspital.dao.UsuarioDao;
import br.ufrrj.auauspital.model.Prontuario;
import br.ufrrj.auauspital.model.Usuario;

/**
 * Servlet implementation class LoadTelaAtendimentosAluno
 */
@WebServlet("/main/loadtelaatendimentosaluno")
public class LoadTelaAtendimentosAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProntuarioDao prontuarioDao = new ProntuarioDao();
		UsuarioDao usuarioDao = new UsuarioDao();
		ArrayList<Prontuario> prontuarios = prontuarioDao.findAllByAluno();
		request.setAttribute("prontuarios", prontuarios);
		ArrayList<Usuario> usuarios = usuarioDao.findAllAlunos();
		request.setAttribute("usuarios", usuarios);
		RequestDispatcher rd =  request.getRequestDispatcher("/main/atendAluno.jsp");
		rd.forward(request, response);
		return;
	}

}
