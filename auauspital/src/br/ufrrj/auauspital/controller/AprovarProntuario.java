package br.ufrrj.auauspital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufrrj.auauspital.dao.DAO;
import br.ufrrj.auauspital.dao.ProntuarioDao;
import br.ufrrj.auauspital.model.Prontuario;
import br.ufrrj.auauspital.model.Usuario;

@WebServlet("/main/aprovarprontuario")
public class AprovarProntuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * Verifica se o usuario logado e professor e pode,
		 * portanto, realizar a aprovacao de prontuarios ou
		 * nao
		 */
		Usuario usuarioLogado = (Usuario) request.getSession(false).getAttribute("usuario");
		if(usuarioLogado.getTipo()!=0) {
			response.sendRedirect(request.getContextPath() + "/main/home.jsp");
			return;
		}
		
		int idProntuario = Integer.parseInt(request.getParameter("idProntuario"));
		
		/*
		 * Verifica se o ID passado e valido
		 */
		
		ProntuarioDao prontuarioDao = new ProntuarioDao();
		ArrayList<Prontuario> prontuarios = (ArrayList<Prontuario>)prontuarioDao.findPendentesAprovacao(usuarioLogado);
		
		boolean isIdValido = false;
		for(Prontuario p : prontuarios) {
			if(p.getIdProntuario()==idProntuario) {
				isIdValido = true;
			}
		}
		
		/*
		 * Se o id for invalido, retorna o hackerzinho
		 * para a pagina de home
		 */
		if(!isIdValido) {
			response.sendRedirect(request.getContextPath() + "/main/home.jsp");
			return;
		}
		
		/*
		 * Atualiza o prontuario para situacao de aprovado
		 */
		DAO.begin();
		Prontuario prontuario = prontuarioDao.find(idProntuario);
		prontuario.setIsAprovado(true);
		DAO.commit();
		
		/*
		 * Encaminha o usuario de volta a tela de aprovacao de
		 * prontuarios
		 */
		response.sendRedirect(request.getContextPath() + "/main/loadtelaaprovarprontuarios");
		return;
	}

}
