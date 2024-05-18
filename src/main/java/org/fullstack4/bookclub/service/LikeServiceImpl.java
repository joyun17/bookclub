package org.fullstack4.bookclub.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.domain.LikeVO;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.*;
import org.fullstack4.bookclub.mapper.LikeMapper;
import org.fullstack4.bookclub.mapper.MemberMapper;
import org.fullstack4.bookclub.mapper.ShareMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class LikeServiceImpl implements LikeServiceIf{

    private final MemberMapper memberMapper;
    private final ShareMapper shareMapper;
    private final ModelMapper modelMapper;
    private final LikeMapper likeMapper;

    @Override
    public int regist(LikeDTO likeDTO) {
        LikeVO likeVO = modelMapper.map(likeDTO, LikeVO.class);
        int result = likeMapper.regist(likeVO);
        return result;
    }
    @Override
    public List<LikeDTO> list(int study_idx) {
        List<LikeDTO> likeDTOList = likeMapper.list(study_idx).stream()
                .map(likeVO -> modelMapper.map(likeVO,LikeDTO.class))
                .collect(Collectors.toList());
        return likeDTOList;
    }
    @Override
    public int delete(LikeDTO likeDTO) {
        LikeVO likeVO = modelMapper.map(likeDTO, LikeVO.class);
        int result = likeMapper.delete(likeVO);
        return result;
    }
}
