package org.zerock.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberDAO;
import org.zerock.domain.MovieDAO;
import org.zerock.service.MemberJoinService;
import org.zerock.service.MemberRegService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class CommonController {
	private MemberJoinService service;

	@Inject
	JavaMailSender mailSender;
	
	//이메일 인증
	@PostMapping("/auth.do")
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException{
		log.info("auth.do............");
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311;
		
		String setfrom = "gunmaru54@gmail.com";
		String tomail = request.getParameter("mem_email");
		String title = "회원가입 인증 이메일 입니다.";
		String content =
				System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
				System.getProperty("line.separator")+
				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	            +System.getProperty("line.separator")+
	            System.getProperty("line.separator")+
	            " 인증번호는 " +dice+ " 입니다. "
	            +System.getProperty("line.separator")+
	            System.getProperty("line.separator")+
	            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();  //여기서 mailSender는 root-context.xml에서 명시한 bean을 의미
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함 
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
		}catch(Exception e) {
			System.out.println(e);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/emailAuthorityInput");     //뷰의이름 //이메일로 인증번호 발송 후에 나오는 화면
		mv.addObject("mem_email", tomail); // Model객체를  View로 넘길 준비
        mv.addObject("dice", dice);
       
        System.out.println("mv: " + mv);
        
        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        return mv;
	}
	
	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
    //틀리면 다시 원래 페이지로 돌아오는 메소드
	@PostMapping("/join_injeung.do{dice}")
	public ModelAndView join_injeung(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals, HttpServletRequest request) throws IOException {
		String mem_email = request.getParameter("mem_email");
		
		System.out.println("마지막 : email_injeung : " + email_injeung);
        System.out.println("마지막 : dice : " + dice);
        System.out.println("마지막 : email : " + mem_email);
		
        ModelAndView mv = new ModelAndView();
        
        if (email_injeung.equals(dice)) {
        	mv.setViewName("/memberJoin"); //성공시 이돟할 뷰 이름을 설정 (controller에 등록 되어있음)
            mv.addObject("e_mail",email_injeung); //뷰로 보낼 데이터 값 이메일 값이 아닌 인증 코드값임.
            mv.addObject("mem_email", mem_email); 

            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
		}else if(email_injeung != dice) { //인증번호가 틀렸을 시
			ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("/emailAuthorityInput"); //이메일 인증이 실패시 넘어가는 페이지
            mv2.addObject("mem_email", mem_email); 
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); </script>");
            out_equals.flush();
            
            return mv2;
		}
        return mv;
	}
	
	@GetMapping("/home")
	public void home(Model model) {
		log.info("home.............");
	}
	
	@GetMapping("/login") //login-page 속성의 URI는 반드시 GET 방식으로 접근하는 URI를 지정한다.
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout!");
		}
	}
	
	//이메일 인증 화면 출력
	@GetMapping("/emailAuthority")
	public void emailAuthority() {
		log.info("email_Authority............");
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout GET");
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	/* 아이디 중복 검사 컨트롤러 */
	@GetMapping("/idCheck.do")
	@ResponseBody //Controller쪽에는 해당 정보를 받기 위해선 data에 @ResponseBody가 필수이다.
	public Map<Object, Object> idCheck(HttpServletRequest request) {
		int count = 0;
		log.info("아이디 중복 검사.............");
		String mem_id = request.getParameter("mem_id");
		count = service.memberIdCheck(mem_id);
		
		log.info("아이디 중복값: " + service.memberIdCheck(mem_id));
		log.info("아이디 중복값: " + count);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("cnt", count);
		
		return map;
	}
	
	//회원 가입시 사용되는 컨트롤러
	@PostMapping("/memberJoin")
	public String register(MemberDAO member, RedirectAttributes rttr) {
		
		log.info("register: " + member);
		log.info("service: " + service); //서비스 객체 확인 용도
		
		service.memberRegister(member); 		
		rttr.addFlashAttribute("result", member.getMem_id()); //모달창을 위한 처리 addflashAttribute 한번 사용하면 없어진다.그 값이 없어진다.
		
		return "redirect:/login";
	}
	
	@GetMapping("/test")
	public void test(Model model) {
		log.info("test page............: ");
	}
	
	@GetMapping("/deleteMovieInfo")
	public void deleteMovieInfo() {
		
	}
	
}
