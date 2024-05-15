package org.fullstack4.bookclub.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShareVO {
    private int share_idx;
    private String member_id;
    private String name;
    private int study_idx;
}
