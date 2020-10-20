package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.zerock.domain.Criteria;
import org.zerock.domain.MemberDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberJoinServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private MemberJoinService service;
	
	@Test
	public void testRegister() {
		MemberDAO member = new MemberDAO();
		member.setMem_id("admin");
		member.setMem_pw("1234");
		member.setMem_name("관리자");
		member.setMem_birth("20010501");
		member.setMem_email("adb1234@naver.com");
		member.setMem_phone("01012345678");
		member.setMem_gender("male");
		member.setMem_oaddress("06362");
		member.setMem_address("서울 강남구 밤고개로 76-2 (수서동)");
		member.setMem_detailaddress("1층 105호");
		
		service.memberRegister(member);
	}
	
//	@Test
//	public int testgetid() {
//		int jungbok = service.memberIdCheck("hihihi");
//		log.info(jungbok);
//		
//		return jungbok;
//	}
	
}
