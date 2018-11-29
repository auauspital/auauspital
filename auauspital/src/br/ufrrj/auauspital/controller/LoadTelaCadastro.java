package br.ufrrj.auauspital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufrrj.auauspital.dao.AnimalDao;
import br.ufrrj.auauspital.dao.UsuarioDao;
import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Usuario;

@WebServlet("/main/loadtelacadastro")
public class LoadTelaCadastro extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuarioLogado = (Usuario)request.getSession(false).getAttribute("usuario");
		UsuarioDao usuarioDao = new UsuarioDao();
		byte tipo = (byte)((usuarioLogado.getTipo()==1) ? (0) : (1));
		List<Usuario> membros = usuarioDao.findByTipo(tipo);
		
		/*
		 * se esse if ativar, significa que o usuario buscou
		 * por um animal ja cadastrado
		 */
		if(request.getParameter("animal")!=null) {
			int idAnimal = Integer.parseInt(request.getParameter("animal"));
			AnimalDao animalDao = new AnimalDao();
			Animal animal = animalDao.findById(idAnimal);
			request.setAttribute("animal", animal);
			request.setAttribute("isEditarCadastro", true);
		}
		
		request.setAttribute("membrosCadastro", membros);
		RequestDispatcher rd = request.getRequestDispatcher("/main/cadastro.jsp");
		rd.forward(request, response);
		return;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Usuario usuarioLogado = (Usuario)request.getSession(false).getAttribute("usuario");
			UsuarioDao usuarioDao = new UsuarioDao();
			byte tipo = (byte)((usuarioLogado.getTipo()==1) ? (0) : (1));
			List<Usuario> membros = usuarioDao.findByTipo(tipo);
			
			request.setAttribute("membrosCadastro", membros);
			RequestDispatcher rd = request.getRequestDispatcher("/main/cadastro.jsp");
			rd.forward(request, response);
			return;
	}

}
