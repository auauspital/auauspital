package br.ufrrj.auauspital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufrrj.auauspital.dao.AnimalDao;
import br.ufrrj.auauspital.dao.ProntuarioDao;
import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Prontuario;

/**
 * Servlet implementation class LoadTelaAtendimentoData
 */
@WebServlet("/main/loadtelaatendimentodata")
public class LoadTelaAtendimentoData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProntuarioDao prontuarioDao = new ProntuarioDao();
		ArrayList<Prontuario> prontuarios = prontuarioDao.findAllByAnimalData();
		request.setAttribute("prontuarios", prontuarios);
		
		RequestDispatcher rd =  request.getRequestDispatcher("/main/animalRetorno.jsp");
		rd.forward(request, response);
	}

}
