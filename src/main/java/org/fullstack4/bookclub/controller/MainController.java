package org.fullstack4.bookclub.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.common.CommonUtil;
import org.fullstack4.bookclub.common.FileUtil;
import org.fullstack4.bookclub.dto.*;
import org.fullstack4.bookclub.service.LikeServiceIf;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value = "/main")
@RequiredArgsConstructor
public class MainController {
    private final MemberServiceIf memberService;
    private final StudyServiceIf studyService;
    private final ShareServiceIf shareService;
    private final LikeServiceIf likeService;
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
                               HttpServletRequest request,
                               RedirectAttributes redirectAttributes,
                               @RequestParam("file") MultipartFile file){
        log.info(studyDTO);
        FileDTO fileDTO = new FileDTO();
        if(file.getSize()>0){
            String uploadFolder = CommonUtil.getUploadFolder(request,"study");
            fileDTO = FileDTO.builder()
                    .file(file)
                    .uploadFolder(uploadFolder)
                    .build();
            log.info(fileDTO);
            Map<String, String> map = FileUtil.FileUpload(fileDTO);
            if(map.get("result").equals("success")){
                studyDTO.setImg_path(map.get("newName"));
                studyDTO.setImg_org_name(map.get("orgName"));
            }

        }

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
    public String share(@RequestParam(name = "inputValues", required = false) List<String> memberList,
                        @RequestParam(name = "study_idx")int study_idx){
        shareService.delete(study_idx);
        if(memberList!= null) {
            for (int i = 0; i < memberList.size(); i++) {
                String id = memberList.get(i).split("\\(")[1];
                shareService.regist(id.substring(0, id.length() - 1), study_idx);
            }
        }

        return "redirect:/main/studyview?study_idx=" + study_idx;
    }

    @GetMapping("/sharestudy")
    public void myShare(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        @RequestParam(name = "method", defaultValue = "1")String method,
                        HttpServletRequest req,
                        RedirectAttributes redirectAttributes,
                        Model model){
        HttpSession session = req.getSession();
        MemberDTO dto = (MemberDTO) session.getAttribute("login_info");
        pageRequestDTO.setMember_id(dto.getMember_id());
        PageResponseDTO<StudyDTO> responseDTO = null;
        if(method.equals("2")) {
            responseDTO = shareService.ShareStudyListByPage2(pageRequestDTO);
        }
        else {
            responseDTO = shareService.ShareStudyListByPage(pageRequestDTO);

            List<ShareDTO> shareDTOList = shareService.listAll(dto.getMember_id());
            model.addAttribute("shareDTOList", shareDTOList);
        }

        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/studymodify")
    public void modify(@RequestParam(name = "study_idx")int study_idx,
                       Model model){
        StudyDTO studyDTO = studyService.view(study_idx);
        model.addAttribute("studyDTO", studyDTO);

    }
    @PostMapping("/studymodify")
    public String modify(StudyDTO studyDTO,
                       BindingResult bindingResult,
                       RedirectAttributes redirectAttributes){
        int result = studyService.update(studyDTO);
        if(result>0){
            redirectAttributes.addFlashAttribute("modifyOK", "수정 완료");
            return "redirect:/main/studyview?study_idx=" + studyDTO.getStudy_idx();
        }
        else{
            redirectAttributes.addFlashAttribute("modifyNO", "수정 실패");
            return "redirect:/main/studymodify?study_idx=" + studyDTO.getStudy_idx();

        }

    }
    @GetMapping("/likeinsert")
    public String insertLike(@RequestParam(name = "member_id")String member_id,
                             @RequestParam(name = "study_idx")int study_idx){

        LikeDTO likeDTO = LikeDTO.builder()
                .study_idx(study_idx)
                .member_id(member_id).build();
        List<LikeDTO> list = likeService.list(study_idx);
        int like_flag = 0;
        if(list != null) {
            for (LikeDTO like : list) {
                if ((like.getMember_id().equals(likeDTO.getMember_id())) && (like.getStudy_idx() == likeDTO.getStudy_idx())) {
                    like_flag = 1;
                }
            }
            log.info(like_flag);
        }
        if(like_flag==1){
            likeService.delete(likeDTO);
        }
        else {
            likeService.regist(likeDTO);
        }
        return "redirect:/main/studyview?study_idx="+likeDTO.getStudy_idx();
    }
}