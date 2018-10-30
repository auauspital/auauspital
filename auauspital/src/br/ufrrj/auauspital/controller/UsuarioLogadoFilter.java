package br.ufrrj.auauspital.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter({ "/", "/index.jsp" })
public class UsuarioLogadoFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		if((req.getSession(false)==null) && (req.getSession(false).getAttribute("loggedIn") != null)) {
			res.sendRedirect(req.getContextPath() + "/main/PAGINA_PRINCIPAL_PARA_USUARIOS_LOGADOS_AQUI");
			return;
		} else {
			chain.doFilter(request, response);
		}
		
	}

}
