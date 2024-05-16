package org.fullstack4.bookclub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Log4j2
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int total_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int first_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_size=30;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int total_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_size=10;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_start=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_end=1;
    private String[] search_type;
    private String search_category;
    private String search_word;
    private String search_data1;
    private String search_data2;
    private LocalDate search_date1;
    private LocalDate search_date2;
    private String category_code;
    private String class_code;
    private String subject_code;
    private String sort;
    private String status;
    private String type;
    private String type2;
    private String member_id;
    private String book_code;
    private String page_flag;
    @Builder.Default
    private String method="1";


    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }
    public int getPage_skip_count() {
        return  (this.page-1)*this.page_size;
    }
}