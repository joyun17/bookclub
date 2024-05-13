package org.fullstack4.bookclub.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.domain.MemberVO;
import org.fullstack4.bookclub.dto.MemberDTO;
import org.fullstack4.bookclub.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;
    @Override
    public int join(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);
        return result;
    }

    @Override
    public MemberDTO login(String member_id, String pwd) {
        MemberVO memberVO = memberMapper.login(member_id);
        MemberDTO memberDTO = null;
        if(memberVO != null && pwd.equals(memberVO.getPassword())) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        }
        return memberDTO;
    }
}
