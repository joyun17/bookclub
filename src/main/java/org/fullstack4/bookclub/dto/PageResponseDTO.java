package org.fullstack4.bookclub.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.common.CommonUtil;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Data
public class PageResponseDTO<E> {
    private int total_count;
    private int page;
    private int page_size;
    private int page_skip_count;
    private int total_page;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;
    private boolean prev_page_flag;
    private boolean next_page_flag;
    private String search_word;
    private LocalDate search_date1;
    private LocalDate search_date2;
    private String linked_params;
    private String sort;
    private String status;
    private String type;
    private String member_id;
    List<E> dtoList;
    PageResponseDTO() {}

    @Builder(builderMethodName = "withAll")  //생성자에 들어오는 값이 몇개가 되건 다 줘
    public PageResponseDTO(PageRequestDTO requestDTO, List<E> dtoList, int total_count) {
        log.info("-------------------");
        log.info("PageResponseDTO Start");
        this.total_count = total_count; // 전체 게시글 수
        this.page = requestDTO.getPage(); // 현재 페이지 번호
        this.page_size = requestDTO.getPage_size(); // 한 페이지에 표시될 게시글 수
        this.page_skip_count = (this.page-1) * this.page_size; //DB 조회해올 로우 시작 인덱스
        this.total_page = (this.total_count > 0) ? (int) Math.ceil(this.total_count / (double) this.page_size) : 1; // 총 페이지수
        this.page_block_size = requestDTO.getPage_block_size(); // 페이지네이션에서 페이징 최대 한번에 몇 개씩 할지
        this.page_block_start = ((int) Math.floor((((double)page - 1)*((double) 1/page_block_size)))*page_block_size)+1; // 현재 페이징의 시작 번호
        this.page_block_end = (page_block_start + (page_block_size-1)) <  total_page ? (page_block_start + (page_block_size-1)) : total_page;
        this.prev_page_flag = (this.page_block_start > 1); // 이전페이지 있는지 여부(페이지네이션에서 10개씩 이전 가는거)
        this.next_page_flag = (this.total_page > this.page_block_end); // 다음페이지 있는지 여부(페이지네이션에서 10개씩 다음 가는거)
        this.search_word = CommonUtil.parseString(requestDTO.getSearch_word());
        this.type = requestDTO.getType();
        this.search_date1 = requestDTO.getSearch_date1();
        this.search_date2 = requestDTO.getSearch_date2();
        this.member_id = requestDTO.getMember_id();
        this.status = requestDTO.getStatus();
        this.sort = requestDTO.getSort();
        StringBuilder sb = new StringBuilder("?page_size=" + this.page_size);
        if(search_word != null) sb.append("&search_word=" + search_word);
        if(status != null && !status.trim().isEmpty()) sb.append("&status=" + status);
        if(type != null) sb.append("&type=" + type);
        if(search_date1 != null) sb.append("&search_date1=" + search_date1);
        if(search_date2 != null) sb.append("&search_date2=" + search_date2);
        if(member_id != null) sb.append("&member_id=" + member_id);
        if(sort != null) sb.append("&sort=" + sort);


        this.linked_params =  sb.toString();  // 쿼리스트링
        this.dtoList = dtoList;
        log.info("PageResponseDTO End");
        log.info("-------------------");
    }

    public int getTotal_page() {
        return (this.total_count > 0) ? (int) Math.ceil(this.total_count / (double) this.page_size) : 1;
    }
    public int getPage_skip_count() {
        return (this.page-1)*this.page_size;
    }
    public void setPage_block_start() {
        this.page_block_start = ((int)Math.floor(this.page/(double)this.page_block_size)*this.page_block_size)+1;
    }
    public void setPage_block_end() {
        this.page_block_end = ((int)Math.floor(this.page/(double)this.page_block_size)*this.page_block_size)+this.page_block_size;
    }
}
