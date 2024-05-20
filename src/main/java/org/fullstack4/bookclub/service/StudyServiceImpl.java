package org.fullstack4.bookclub.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.domain.MemberVO;
import org.fullstack4.bookclub.domain.StudyVO;
import org.fullstack4.bookclub.dto.MemberDTO;
import org.fullstack4.bookclub.dto.PageRequestDTO;
import org.fullstack4.bookclub.dto.PageResponseDTO;
import org.fullstack4.bookclub.dto.StudyDTO;
import org.fullstack4.bookclub.mapper.MemberMapper;
import org.fullstack4.bookclub.mapper.StudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class StudyServiceImpl implements StudyServiceIf{
    private final ModelMapper modelMapper;
    private final StudyMapper studyMapper;

    @Override
    public int regist(StudyDTO studyDTO) {
        StudyVO studyVO = modelMapper.map(studyDTO, StudyVO.class);
        int result = studyMapper.regist(studyVO);
        return result;
    }

    @Override
    public int studyTotalCount(PageRequestDTO requestDTO) {
        return studyMapper.studyTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<StudyDTO> studyListByPage(PageRequestDTO pageRequestDTO) {
        List<StudyVO> voList = studyMapper.studyListByPage(pageRequestDTO);
        List<StudyDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,StudyDTO.class))
                .collect(Collectors.toList());
        int total_count = studyMapper.studyTotalCount(pageRequestDTO);

        PageResponseDTO<StudyDTO> responseDTO = PageResponseDTO.<StudyDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public StudyDTO view(int study_idx) {
        StudyVO studyVO = studyMapper.view(study_idx);
        StudyDTO studyDTO = modelMapper.map(studyVO, StudyDTO.class);
        return studyDTO;
    }

    @Override
    public int update(StudyDTO studyDTO) {
        StudyVO studyVO = modelMapper.map(studyDTO, StudyVO.class);
        return studyMapper.update(studyVO);
    }

    @Override
    public int likeUp(int study_idx) {
        return studyMapper.likeUp(study_idx);
    }

    @Override
    public int likeDown(int study_idx) {
        return studyMapper.likeDown(study_idx);
    }

    @Override
    public int delete(int study_idx) {
        return studyMapper.delete(study_idx);
    }

    @Override
    public List<StudyDTO> listAll(String member_id) {
        List<StudyVO> voList = studyMapper.listAll(member_id);
        List<StudyDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,StudyDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public List<StudyDTO> listDay(String member_id, String reg_date) {
        List<StudyVO> voList = studyMapper.listDay(member_id, reg_date);
        List<StudyDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,StudyDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }
}
