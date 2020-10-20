package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		log.warn("Login Success");
		
		log.info("CustomLoginSuccess 컨트롤러 작동");
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority ->  {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		
		// 로그인 성공시 이동하는 화면
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/cplay/mlist");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/cplay/mlist");
			return;
		}
		response.sendRedirect("/");
	}
}
