package br.ufrrj.auauspital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufrrj.auauspital.dao.UsuarioDao;
import br.ufrrj.auauspital.model.Usuario;

@WebServlet("/main/loadtelacadastro")
public class LoadTelaCadastro extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Usuario usuarioLogado = (Usuario)request.getSession(false).getAttribute("usuario");
			UsuarioDao usuarioDao = new UsuarioDao();
			byte tipo = (byte)((usuarioLogado.getTipo()==1) ? (0) : (1));
			List<Usuario> membros = usuarioDao.findByTipo(tipo);
			request.getSession(false).setAttribute("membrosCadastro", membros);
			response.sendRedirect(request.getContextPath() + "/main/cadastro.jsp");
			return;
	}

}
