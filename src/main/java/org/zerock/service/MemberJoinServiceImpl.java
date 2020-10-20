package org.zerock.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberDAO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberJoinServiceImpl implements MemberJoinService{
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Autowired
	private SqlSessionTemplate memberSqlSession;
	private MemberMapper mapper;
	
	
	/* 회원등록 */
	@Override
	public void memberRegister(MemberDAO member) {
		log.info("Member join................ " + member);
		String preEncoding_pw = pwencoder.encode(member.getMem_pw()); //입력받은 비밀번호 암호화 
		member.setMem_pw(preEncoding_pw); //암호화 한 비밀번호 다시 셋팅
		mapper.memberJoin(member);
	}
	
	/* 아이디 중복 검사 */
	@Override
	public int memberIdCheck(String mem_id) {
//		mapper = memberSqlSession.getMapper(MemberMapper.class);
		return mapper.checkOverId(mem_id);
	}
}
