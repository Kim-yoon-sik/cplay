package org.zerock.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.domain.MemberDAO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	
	private MemberDAO member;

	public CustomUser(String username, String password, boolean enabled,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDAO dao) {
		super(dao.getMem_id(), dao.getMem_pw(), dao.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.member = dao;
	}
}
