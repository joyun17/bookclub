package org.fullstack4.bookclub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LikeDTO {
    private int like_idx;
    private String member_id;
    private int study_idx;
}
