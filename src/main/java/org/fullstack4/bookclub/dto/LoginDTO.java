package org.fullstack4.bookclub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginDTO {
    private String member_id;
    private String password;
    private String name;
    private String password2;
    private String phone;
    private String email;
    private LocalDateTime reg_date;
    private LocalDateTime recent_date;
    private String status;
    private int fail_count;
}
