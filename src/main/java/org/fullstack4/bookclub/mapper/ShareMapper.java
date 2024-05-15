package org.fullstack4.bookclub.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookclub.domain.MemberVO;
import org.fullstack4.bookclub.domain.ShareVO;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;

import java.util.List;

public interface ShareMapper {
    int regist(@Param("member_id")String member_id, @Param("study_idx")int study_idx);
    List<ShareVO> shareList(int study_idx);

    int shareStudyTotalCount(PageRequestDTO requestDTO);
    List<StudyVO> shareStudyListByPage(PageRequestDTO requestDTO);
    List<ShareVO> listAll(String member_id);

}
