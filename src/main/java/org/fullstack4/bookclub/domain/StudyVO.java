package org.fullstack4.bookclub.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StudyVO {
    private int study_idx;
    private String member_id;
    private String name;
    private String title;
    private String contents;
    private String show_status;
    private int like;
    private String tags;
    private String category;
    private LocalDate start_date;
    private LocalDate end_date;
    private LocalDate reg_date;
    private String img_path;
    private String img_org_name;

}
