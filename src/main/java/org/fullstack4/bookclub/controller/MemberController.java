package org.fullstack4.bookclub.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.dto.MemberDTO;
import org.fullstack4.bookclub.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value = "/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberService;
    @GetMapping("/join")
    public void GETJoin(){

    }
    @PostMapping("/join")
    public String POSTJoin(@Valid MemberDTO memberDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes
                         ){
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("err", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/join";
        }
        memberDTO.setPhone(memberDTO.getPhone0()+memberDTO.getPhone1()+memberDTO.getPhone2());
        int result = memberService.join(memberDTO);

        if(result >0){
            log.info("회원가입 성공");
            redirectAttributes.addAttribute("joinOK","1");
            return "redirect:/login/login";
        }
        else{
            log.info("회원가입 실패");
            redirectAttributes.addAttribute("joinNO","1");
            return "redirect:/member/join";
        }

    }
    @GetMapping("/mypage")
    public void GETMyPage(@RequestParam(name = "member_id") String member_id,
                          Model model){
        MemberDTO memberDTO = memberService.view(member_id);
        model.addAttribute("memberDTO", memberDTO);
    }

}
