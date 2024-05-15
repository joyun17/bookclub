package org.fullstack4.bookclub.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.dto.*;
import org.fullstack4.bookclub.service.MemberServiceIf;
import org.fullstack4.bookclub.service.ShareServiceIf;
import org.fullstack4.bookclub.service.StudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value = "/main")
@RequiredArgsConstructor
public class MainController {
    private final MemberServiceIf memberService;
    private final StudyServiceIf studyService;
    private final ShareServiceIf shareService;
    @GetMapping("/main")
    public void main(){

    }
    @GetMapping("/mystudy")
    public void myStudy(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        HttpServletRequest req,
                        RedirectAttributes redirectAttributes,
                        Model model){
        HttpSession session = req.getSession();
        MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
        pageRequestDTO.setMember_id(dto.getMember_id());
        PageResponseDTO<StudyDTO> responseDTO = studyService.studyListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/studyview")
    public void studyview(@RequestParam(name = "study_idx") int study_idx,
                          Model model){
        StudyDTO studyDTO = studyService.view(study_idx);
        List<MemberDTO> memberDTOList = memberService.memberList();
        List<ShareDTO> shareDTOList = shareService.shareList(study_idx);
        model.addAttribute("shareDTOList", shareDTOList);
        model.addAttribute("memberDTOList", memberDTOList);
        model.addAttribute("studyDTO", studyDTO);
    }
    @GetMapping("/studyregist")
    public void studyRegist(){

    }
    @PostMapping("/studyregist")
    public String studuyRegist(StudyDTO studyDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes){
        log.info(studyDTO);

        if(bindingResult.hasErrors()){
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("studyDTO",studyDTO);

            return "redirect:/main/studyregist";
        }
        int result = studyService.regist(studyDTO);
        if(result >0){
            redirectAttributes.addFlashAttribute("registOK", "1");
            return "redirect:/main/mystudy";
        }
        else{
            redirectAttributes.addFlashAttribute("registNO", "1");
            redirectAttributes.addFlashAttribute("studyDTO", studyDTO);
            return "redirect:/main/studyregist";
        }
    }
    @PostMapping("/share")
    public String share(@RequestParam("inputValues") List<String> memberList,
                        @RequestParam("study_idx")int study_idx){
        List<ShareDTO> shareDTOList = shareService.shareList(study_idx);
        for(int i=0;i<memberList.size();i++){
            int flag = 0;
            String id = memberList.get(i).split("\\(")[1];

            for(int j=0;j<shareDTOList.size();j++)
                if(shareDTOList.get(j).getMember_id().equals(id.substring(0,id.length()-1)))
                    flag = 1;

            if(flag==0)
                shareService.regist(id.substring(0,id.length()-1),study_idx);
        }
        return "redirect:/main/studyview?study_idx=" + study_idx;
    }
    @GetMapping("/sharestudy")
    public void myShare(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        HttpServletRequest req,
                        RedirectAttributes redirectAttributes,
                        Model model){
        HttpSession session = req.getSession();
        MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
        pageRequestDTO.setMember_id(dto.getMember_id());
        PageResponseDTO<StudyDTO> responseDTO = shareService.ShareStudyListByPage(pageRequestDTO);

        List<ShareDTO> shareDTOList = shareService.listAll(dto.getMember_id());
        model.addAttribute("shareDTOList", shareDTOList);

        model.addAttribute("responseDTO", responseDTO);
    }
}