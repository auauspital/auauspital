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
import br.ufrrj.auauspital.dao.ProprietarioDao;
import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Proprietario;

/**
 * Servlet implementation class LoadTelaAtendimento
 */
@WebServlet("/main/loadtelaatendimento")
public class LoadTelaAtendimento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnimalDao animalDao = new AnimalDao();
		ProprietarioDao proprietarioDao = new ProprietarioDao();
		ArrayList<Animal> animais = (ArrayList<Animal>)animalDao.findAll();
		ArrayList<Proprietario> proprietarios = (ArrayList<Proprietario>)proprietarioDao.findAll();
		request.setAttribute("animais", animais);
		request.setAttribute("proprietarios", proprietarios);
		RequestDispatcher rd = request.getRequestDispatcher("/main/atendimento.jsp");
		rd.forward(request, response);
	}

}
