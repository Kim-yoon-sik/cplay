package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.MemberDAO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
//	@Test
//	public void testRead() {
//		int overlap = mapper.checkOverId("hihihi");
//		
//		log.info(overlap);
//		
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
//	}
	
//	@Test
//	public void testRead() {
//		MemberVO vo = mapper.read("admin90");
//		
//		log.info(vo);
//		
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
//	}
	
//	@Test
//	public void testRead() {
//		MemberDAO dao = mapper.read1("hihihi");
//		
//		log.info(dao);
//		
//		dao.getAuthList().forEach(authVO1 -> log.info(authVO1));
//	}
	
//	@Test
//	public void testInsert() {
//		MemberDAO member = new MemberDAO();
//		member.setMem_id("id");
//		member.setMem_pw("pw");
//		member.setMem_name("name");
//		member.setMem_birth("birth");
//		member.setMem_email("email");
//		member.setMem_phone("phone");
//		member.setMem_gender("gender");
//		member.setMem_oaddress("oaddress");
//		member.setMem_address("address");
//		member.setMem_detailaddress("detailaddress");
//		
//		mapper.memberJoin(member);
//		
//		log.info(member);
//	}
}
