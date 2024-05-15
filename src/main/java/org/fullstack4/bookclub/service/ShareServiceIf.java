package org.fullstack4.bookclub.service;




import org.fullstack4.bookclub.domain.ShareVO;
import org.fullstack4.bookclub.dto.PageRequestDTO;
import org.fullstack4.bookclub.dto.PageResponseDTO;
import org.fullstack4.bookclub.dto.ShareDTO;
import org.fullstack4.bookclub.dto.StudyDTO;

import java.util.List;

public interface ShareServiceIf {
    int regist(String member_id, int study_idx);
    List<ShareDTO> shareList(int study_idx);
    int ShareStudyTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<StudyDTO> ShareStudyListByPage(PageRequestDTO pageRequestDTO);
    List<ShareDTO> listAll(String member_id);

}
