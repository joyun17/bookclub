package org.fullstack4.bookclub.service;


import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;
import org.fullstack4.bookclub.dto.PageResponseDTO;
import org.fullstack4.bookclub.dto.StudyDTO;

public interface StudyServiceIf {
    int regist(StudyDTO studyDTO);
    int studyTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO);
    StudyDTO view(int study_idx);
    int update(StudyDTO studyDTO);
}
