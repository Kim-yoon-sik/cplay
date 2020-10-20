package org.zerock.service;

import org.zerock.domain.MemberDAO;

public interface MemberJoinService {
	public void memberRegister(MemberDAO member); // 회원 등록
	
	public int memberIdCheck(String mem_id); // 아이디 중복 검사
}
