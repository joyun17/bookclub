package org.fullstack4.bookclub.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.common.CommonUtil;
import org.fullstack4.bookclub.common.CookieUtil;
import org.fullstack4.bookclub.dto.LoginDTO;
import org.fullstack4.bookclub.dto.MemberDTO;
import org.fullstack4.bookclub.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value = "/login")
@RequiredArgsConstructor
public class LoginController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/find")
    public void GETFind(){

    }

    @PostMapping("/find")
    public String POSTFind(@RequestParam(name = "member_id") String member_id,
                           RedirectAttributes redirectAttributes){

        if(member_id== null || member_id.trim().equals("")){
            log.info("id null");
            redirectAttributes.addAttribute("noId", 1);
            return "redirect:/login/find";
        } else if (memberServiceIf.check_id(member_id)<1) {
            log.info("id no");
            redirectAttributes.addAttribute("noId", 2);
            return "redirect:/login/find";
        }
        else{
            log.info("id else");
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newPwd = uuids[0];
            memberServiceIf.update_pwd(member_id, newPwd);
            memberServiceIf.pwdChange(member_id);

            redirectAttributes.addAttribute("newPwd", newPwd);

            return "redirect:/login/login";
        }


    }

    @GetMapping("/logout")
    public String GETLogout(HttpServletRequest req,
                            HttpServletResponse res){
        HttpSession session  = req.getSession();
        session.removeAttribute("login_info");
        CookieUtil.setDeleteCookie(res,"auto_login");

        return "redirect:/login/login";
    }
    @GetMapping("/login")
    public String GETLogin(HttpServletRequest req,
                           Model model){

        if(!CookieUtil.getCookieValue(req,"saveId").equals("")){
            req.setAttribute("user_id",CookieUtil.getCookieValue(req,"saveId") );
        }
        if(!CookieUtil.getCookieValue(req,"auto_login").equals("")){
            MemberDTO dto = memberServiceIf.view(CookieUtil.getCookieValue(req,"auto_login"));
            HttpSession session = req.getSession();
            session.setAttribute("loginInfo", dto);
            return "redirect:/main/main";
        }
        return "/login/login";
    }

    @PostMapping("/login")
    public String POSTLogin(
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "password", defaultValue = "") String pwd,
            @RequestParam(name = "auto", defaultValue = "") String auto,
            @RequestParam(name = "save", defaultValue = "") String save,
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
        if (loginDTO != null && loginDTO.getStatus().equals("Y")) {
            memberServiceIf.reset_fail(member_id);
            if (auto.equals("auto")) {
                CookieUtil.setCookies(response,"/",555555,"auto_login", loginDTO.getMember_id());
            }
            if (save.equals("save")) {
                CookieUtil.setCookies(response,"/",555555,"saveId", loginDTO.getMember_id());
            }
            else{
                CookieUtil.setDeleteCookie(response,"saveId");
            }
            log.info("loginDTO" + loginDTO);
            MemberDTO memberDTO = memberServiceIf.view(member_id);
            HttpSession session = request.getSession();
            session.setAttribute("login_info", memberDTO);
            log.info(memberDTO);
            if(memberDTO.getPassword_r().equals("N"))
                return "redirect:/main/main";
            else
                return "redirect:/member/changepwd";
        } else if (loginDTO != null && loginDTO.getStatus().equals("N")) {
            redirectAttributes.addAttribute("loginX", "1");
            return "redirect:/login/login";
        } else{
            if(memberServiceIf.check_id(member_id)>0){
                MemberDTO dto = memberServiceIf.view(member_id);
                int fail_count = dto.getFail_count();
                memberServiceIf.fail_plus(member_id);
                if(fail_count+1>4){
                    memberServiceIf.update_status(member_id);
                }
            }
            redirectAttributes.addAttribute("loginNO", "1");

            return "redirect:/login/login";
        }

    }

}
