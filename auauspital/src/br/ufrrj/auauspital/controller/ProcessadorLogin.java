package br.ufrrj.auauspital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ufrrj.auauspital.dao.UsuarioDao;
import br.ufrrj.auauspital.model.Usuario;

@WebServlet("/processadorlogin")
public class ProcessadorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpf = request.getParameter("cpf");
		String senha = request.getParameter("senha");
		
		Usuario usuario = new Usuario(cpf, senha);
		UsuarioDao usuarioDao = new UsuarioDao();
		usuario = usuarioDao.findLogin(usuario);
		if(usuario==null) {
			response.sendRedirect(request.getContextPath() + "index.jsp");
			return;
		} else {
			if(request.getSession(false)!=null) {
				request.getSession(false).invalidate();
			}
			
			HttpSession session = request.getSession(true);
			session.setAttribute("logado", true);
			session.setAttribute("usuario", usuario);
			session.setMaxInactiveInterval(3600);
			response.sendRedirect(request.getContextPath() + "/main/home");
			return;
		}
		
	}

}
