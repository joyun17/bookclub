package org.fullstack4.bookclub.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;

import java.util.List;

public interface StudyMapper {
    int regist(StudyVO studyVO);
    int studyTotalCount(PageRequestDTO requestDTO);
    List<StudyVO> studyListByPage(PageRequestDTO requestDTO);
    StudyVO view(int study_idx);
    int update(StudyVO studyVO);
    int likeUp(int study_idx);
    int likeDown(int study_idx);
    List<StudyVO> listAll(String member_id);
    List<StudyVO> listDay(@Param("member_id")String member_id, @Param("reg_date")String reg_date);
}
