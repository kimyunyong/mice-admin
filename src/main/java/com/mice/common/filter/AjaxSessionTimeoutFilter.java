package com.mice.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;

public class AjaxSessionTimeoutFilter  implements Filter{

	@SuppressWarnings("unused")
	private FilterConfig config;

	private String ajaxHeader = "";
	

	public String getAjaxHeader() {
		return ajaxHeader;
	}

	public void setAjaxHeader(String ajaxHeader) {
		this.ajaxHeader = ajaxHeader;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;


        if (isAjaxRequest(req)) {

                try {

                       chain.doFilter(req, res);

                } catch (AccessDeniedException e) {

                       res.sendError(HttpServletResponse.SC_FORBIDDEN);

                } catch (AuthenticationException e) {

                       res.sendError(HttpServletResponse.SC_UNAUTHORIZED);

                }

        } else {

                chain.doFilter(req, res);

        }

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	private boolean isAjaxRequest(HttpServletRequest req) {

        return req.getHeader(ajaxHeader) != null && req.getHeader(ajaxHeader).equals(Boolean.TRUE.toString());
	}
	
	public void destroy() {

	}
}
