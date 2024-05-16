package org.fullstack4.bookclub.mapper;

import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;

import java.util.List;

public interface StudyMapper {
    int regist(StudyVO studyVO);

    int studyTotalCount(PageRequestDTO requestDTO);
    List<StudyVO> studyListByPage(PageRequestDTO requestDTO);
    StudyVO view(int study_idx);
    int update(StudyVO studyVO);
}
