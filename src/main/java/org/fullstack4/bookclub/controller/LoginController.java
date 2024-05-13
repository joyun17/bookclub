package org.fullstack4.bookclub.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.common.CommonUtil;
import org.fullstack4.bookclub.dto.MemberDTO;
import org.fullstack4.bookclub.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping(value = "/login")
@RequiredArgsConstructor
public class LoginController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/find")
    public void GETFind(){}
    @GetMapping("/login")
    public void GETLogin(){}

    @PostMapping("/login")
    public String POSTLogin(
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "password", defaultValue = "") String pwd,
            @RequestParam(name = "auto_login", defaultValue = "") String auto_login,
            RedirectAttributes redirectAttributes,
            HttpServletResponse response,
            HttpServletRequest request
    ){
        log.info("==============");
        log.info("member_id : " + member_id + "password : " + pwd);
        log.info("==============");
        member_id = CommonUtil.parseString(member_id);
        pwd = CommonUtil.parseString(pwd);
        if(member_id.equals("") || pwd.equals("")) {
            redirectAttributes.addFlashAttribute("loginErr", "공란 없이 입력해주세요");
            return "redirect:/login/login";
        }

        MemberDTO loginDTO = memberServiceIf.login(member_id, pwd);
        if (loginDTO != null) {
            if (auto_login.equals("on")) {
                Cookie cookie = new Cookie("auto_login", loginDTO.getMember_id());
                cookie.setPath("/");
                cookie.setMaxAge(999999);
                response.addCookie(cookie);
            }
            log.info("loginDTO" + loginDTO);
            HttpSession session = request.getSession();
            session.setAttribute("member_id", loginDTO.getMember_id());
            return "redirect:/main/main";
        }
        return "redirect:/";
    }

}
