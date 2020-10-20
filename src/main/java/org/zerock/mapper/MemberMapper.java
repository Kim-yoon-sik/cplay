package org.zerock.mapper;

import org.zerock.domain.MemberDAO;

public interface MemberMapper {
	public MemberDAO read(String mem_id); //회원정보 DB에서 읽기
	
	public void memberJoin(MemberDAO member); //회원정보 DB 저장
	
	public int checkOverId(String mem_id); //아이디 중복검사
}
