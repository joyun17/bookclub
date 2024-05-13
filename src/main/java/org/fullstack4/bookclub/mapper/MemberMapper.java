package org.fullstack4.bookclub.mapper;

import org.fullstack4.bookclub.domain.MemberVO;

public interface MemberMapper {
    int join(MemberVO MemberVO);

    MemberVO login(String member_id);
}
