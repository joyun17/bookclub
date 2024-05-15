package org.fullstack4.bookclub.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.domain.MemberVO;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.*;
import org.fullstack4.bookclub.mapper.MemberMapper;
import org.fullstack4.bookclub.mapper.ShareMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShareServiceImpl implements ShareServiceIf{

    private final MemberMapper memberMapper;
    private final ShareMapper shareMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(String member_id, int study_idx) {
        int result = shareMapper.regist(member_id, study_idx);
        return result;
    }

    @Override
    public List<ShareDTO> shareList(int study_idx) {
        List<ShareDTO> shareDTOList = shareMapper.shareList(study_idx).stream()
                .map(shareVO -> modelMapper.map(shareVO, ShareDTO.class))
                .collect(Collectors.toList());
        return shareDTOList;
    }

    @Override
    public int ShareStudyTotalCount(PageRequestDTO requestDTO) {
        return 0;
    }

    @Override
    public PageResponseDTO<StudyDTO> ShareStudyListByPage(PageRequestDTO pageRequestDTO) {
        List<StudyVO> voList = shareMapper.shareStudyListByPage(pageRequestDTO);
        log.info(voList);
        List<StudyDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,StudyDTO.class))
                .collect(Collectors.toList());
        int total_count = shareMapper.shareStudyTotalCount(pageRequestDTO);

        PageResponseDTO<StudyDTO> responseDTO = PageResponseDTO.<StudyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public List<ShareDTO> listAll(String member_id) {
        List<ShareDTO> shareDTOList = shareMapper.listAll(member_id).stream()
                .map(shareVO -> modelMapper.map(shareVO, ShareDTO.class))
                .collect(Collectors.toList());
        return shareDTOList;
    }
}
