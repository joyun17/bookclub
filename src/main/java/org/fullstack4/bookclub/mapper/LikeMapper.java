package org.fullstack4.bookclub.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookclub.domain.LikeVO;
import org.fullstack4.bookclub.domain.ShareVO;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;

import java.util.List;

public interface LikeMapper {
    int regist(LikeVO likeVO);
    List<LikeVO> list(int study_idx);
    int delete(LikeVO likeVO);
}
