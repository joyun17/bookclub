package org.fullstack4.bookclub.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.domain.MemberVO;
import org.fullstack4.bookclub.dto.MemberDTO;
import org.fullstack4.bookclub.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
    public MemberDTO view(String member_id) {
        MemberVO memberVO = memberMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
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

    @Override
    public int check_id(String member_id) {
        return memberMapper.check_id(member_id);
    }

    @Override
    public void fail_plus(String member_id) {
        memberMapper.fail_plus(member_id);
    }

    @Override
    public void update_status(String member_id) {
        memberMapper.update_status(member_id);
    }

    @Override
    public void update_pwd(String member_id, String pwd) {
        memberMapper.update_pwd(member_id, pwd);
    }

    @Override
    public void reset_fail(String member_id) {
        memberMapper.reset_fail(member_id);
    }

    @Override
    public List<MemberDTO> memberList() {
        List<MemberDTO> memberDTOList = memberMapper.memberList().stream()
                .map(memberVO -> modelMapper.map(memberVO,MemberDTO.class))
                .collect(Collectors.toList());
        return memberDTOList;
    }

    @Override
    public List<MemberDTO> searchMemberList(String search_word) {
        List<MemberDTO> memberDTOList = memberMapper.searchMemberList(search_word).stream()
                .map(memberVO -> modelMapper.map(memberVO,MemberDTO.class))
                .collect(Collectors.toList());
        return memberDTOList;
    }

    @Override
    public int pwdChange(String member_id) {
        return memberMapper.pwdChange(member_id);
    }
}
