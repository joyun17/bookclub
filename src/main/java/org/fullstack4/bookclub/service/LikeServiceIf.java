package org.fullstack4.bookclub.service;




import org.fullstack4.bookclub.domain.LikeVO;
import org.fullstack4.bookclub.dto.*;

import java.util.List;

public interface LikeServiceIf {
    int regist(LikeDTO likeDTO);
    List<LikeDTO> list(int study_idx);
    int delete(LikeDTO likeDTO);

}
