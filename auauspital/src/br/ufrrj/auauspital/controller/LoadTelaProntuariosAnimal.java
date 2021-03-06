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
import br.ufrrj.auauspital.dao.UsuarioDao;
import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Prontuario;
import br.ufrrj.auauspital.model.Usuario;

/**
 * Servlet implementation class LoadTelaProntuariosAnimal
 */
@WebServlet("/main/loadtelaprontuariosanimal")
public class LoadTelaProntuariosAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProntuarioDao prontuarioDao = new ProntuarioDao();
		AnimalDao animalDao = new AnimalDao();
		ArrayList<Prontuario> prontuarios = prontuarioDao.findAllByAnimal();
		request.setAttribute("prontuarios", prontuarios);
		ArrayList<Animal> animais = animalDao.findAllAnimal();
		request.setAttribute("animais", animais);
		RequestDispatcher rd =  request.getRequestDispatcher("/main/prontAnimal.jsp");
		rd.forward(request, response);
		return;
	}

}
