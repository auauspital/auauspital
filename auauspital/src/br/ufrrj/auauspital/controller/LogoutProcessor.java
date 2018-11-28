package br.ufrrj.auauspital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutProcessor
 */
@WebServlet("/main/logoutprocessor")
public class LogoutProcessor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession velhaSession = request.getSession(false);

		if (velhaSession != null) {
			velhaSession.invalidate();
		}

		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

}
