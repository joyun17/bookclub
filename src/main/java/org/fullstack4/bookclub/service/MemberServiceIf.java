package org.fullstack4.bookclub.service;

import org.fullstack4.bookclub.dto.MemberDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    MemberDTO login(String member_id, String pwd);
}
