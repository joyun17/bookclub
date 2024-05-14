package org.fullstack4.bookclub.service;

import org.fullstack4.bookclub.dto.MemberDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    MemberDTO view(String member_id);
    MemberDTO login(String member_id, String pwd);
    int check_id(String member_id);
    void fail_plus(String member_id);
    void update_status(String member_id);
    void update_pwd(String member_id, String pwd);
    void reset_fail(String member_id);
}
