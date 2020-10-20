package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CCriteria;
import org.zerock.domain.CPageDTO;
import org.zerock.domain.MovieDAO;
import org.zerock.service.CplayService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cplay/*")
@AllArgsConstructor
public class CplayController {
	
	private CplayService service;
	
	@GetMapping("/mlist")
	public void list(CCriteria cri,Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		
		log.info("list에 넘어가는 값: " + service.getList(cri));
		
        int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMakerController", new CPageDTO(cri, total));
	}
	
	@PostMapping("/mregister")
	public String register(MovieDAO cplay, RedirectAttributes rttr) {
		log.info("register: " + cplay);
		service.register(cplay);
		
		rttr.addFlashAttribute("result",cplay.getMov_title());
		
		return "redirect:/cplay/mlist";
		
	}
	
	@GetMapping({"/mget"})
	public void get(@RequestParam("mov_title") String title, Model model) {
		
		log.info("/mget ");
		model.addAttribute("cplay",service.get(title));
	}

	
	@PostMapping("/modify")
	public String modify(MovieDAO cplay,RedirectAttributes rttr) {
		log.info("modify:" + cplay);
		
		if(service.modify(cplay)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/cplay/mlist";
}
	
	//관리자 모드에서 영화정보 삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("mov_title") String mov_title, RedirectAttributes rttr) {
		log.info("remove....."+ mov_title);
		
		if(service.remove(mov_title)) {
			
			deleteFiles(mov_title);
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/cplay/mlist";
	}
	
	private void deleteFiles(String mov_title) {
		if(mov_title == null) {
			return;
		}
		
		log.info("delete attach files.........................");
		log.info("mov_title: " + mov_title);
		
		try {
			Path file = Paths.get("C:\\Users\\Alex\\Desktop\\java\\main\\src\\main\\webapp\\resources\\img" + mov_title);
			Files.deleteIfExists(file);
			file = Paths.get("C:\\Users\\Alex\\Desktop\\java\\main\\src\\main\\webapp\\resources\\img\\s_" + mov_title);
			Files.deleteIfExists(file);
			
			Path thumbNail = Paths.get("C:\\Users\\Alex\\Desktop\\java\\main\\src\\main\\webapp\\resources\\img\\thumbnail" + mov_title);
			Files.delete(thumbNail);
			thumbNail = Paths.get("C:\\Users\\Alex\\Desktop\\java\\main\\src\\main\\webapp\\resources\\img\\thumbnail\\s_" + mov_title);
			Files.delete(thumbNail);
		} catch (Exception e) {
			log.error("delete file error" + e.getMessage());
		}
	}
}
