package org.zerock.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.domain.MemberDAO;
import org.zerock.mapper.MemberMapper;

public class MemberRegService {
	
	@Autowired
	private SqlSessionTemplate memberSqlSession;
	private MemberMapper mapper;
	
	public int memberIdCheck(String mem_id) {
		
		mapper = memberSqlSession.getMapper(MemberMapper.class);
		return mapper.checkOverId(mem_id);
	}
}
