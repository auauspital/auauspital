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
import br.ufrrj.auauspital.model.Usuario;
import br.ufrrj.auauspital.model.Prontuario;


@WebServlet("/main/loadtelaaprovarprontuarios")
public class LoadTelaAprovarProntuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * Verifica se o usuario logado e professor e pode,
		 * portanto, visualizar a tela de aprovar prontuarios
		 * ou nao
		 */
		Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute("usuario");
		if(usuarioLogado.getTipo()!=0) {
			response.sendRedirect(request.getContextPath() + "/main/home.jsp");
			return;
		}
		
		ProntuarioDao prontuarioDao = new ProntuarioDao();
		ArrayList<Prontuario> prontuarios = (ArrayList<Prontuario>)prontuarioDao.findPendentesAprovacao(usuarioLogado);
		for(Prontuario p : prontuarios) {
			p.setMotivos(p.getMotivos().replaceAll("(\r\n|\n\r|\r|\n)", "<br />"));
			p.setPrescricoes(p.getPrescricoes().replaceAll("(\r\n|\n\r|\r|\n)", "<br />"));
		}
		request.setAttribute("prontuarios", prontuarios);
		RequestDispatcher rd = request.getRequestDispatcher("/main/aprovações.jsp");
		rd.forward(request, response);
	}

}
