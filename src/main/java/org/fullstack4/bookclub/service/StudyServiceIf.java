package org.fullstack4.bookclub.service;


import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;
import org.fullstack4.bookclub.dto.PageResponseDTO;
import org.fullstack4.bookclub.dto.StudyDTO;

import java.util.List;

public interface StudyServiceIf {
    int regist(StudyDTO studyDTO);
    int studyTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO);
    StudyDTO view(int study_idx);
    int update(StudyDTO studyDTO);
    int likeUp(int study_idx);
    int likeDown(int study_idx);
    int delete(int study_idx);
    List<StudyDTO> listAll(String member_id);
    List<StudyDTO> listDay(@Param("member_id")String member_id, @Param("reg_date")String reg_date);
}
