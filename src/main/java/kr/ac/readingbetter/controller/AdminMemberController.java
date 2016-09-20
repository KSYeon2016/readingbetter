package kr.ac.readingbetter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.readingbetter.service.MemberService;
import kr.ac.readingbetter.vo.MemberVo;

@Controller
@RequestMapping("/admin/memberlist")
public class AdminMemberController {
	
	@Autowired
	MemberService adminMemberService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String memberList(Model model, MemberVo vo) {
		if(vo.getKwd() == null){
			vo.setKwd("");
		}
		List<MemberVo> list = adminMemberService.getList(vo);
		model.addAttribute("list", list);
		return "admin/memberlist";
	}
	
	@RequestMapping("/delete/{no}")
	public String memberDelete(@PathVariable("no") Long no, @ModelAttribute MemberVo vo){
		adminMemberService.delete(vo);
		return "redirect:/admin/memberlist";
	}
}
