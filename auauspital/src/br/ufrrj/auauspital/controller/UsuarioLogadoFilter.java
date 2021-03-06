package br.ufrrj.auauspital.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter({ "/", "/index.jsp", "/main", "/main/" })
public class UsuarioLogadoFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		if((req.getSession(false)!=null)&&(req.getSession(false).getAttribute("logado") != null)) {
			res.sendRedirect(req.getContextPath() + "/main/home.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}

}
