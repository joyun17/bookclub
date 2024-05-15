package org.fullstack4.bookclub.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookclub.domain.MemberVO;

import java.util.List;

public interface MemberMapper {
    int join(MemberVO MemberVO);
    MemberVO view(String member_id);
    MemberVO login(String member_id);
    void fail_plus(String member_id);
    int check_id(String member_id);
    void update_status(String member_id);
    void update_pwd(@Param("member_id")String member_id, @Param("pwd")String pwd);
    void reset_fail(String member_id);
    List<MemberVO> memberList();
}
