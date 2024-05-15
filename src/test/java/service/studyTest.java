package service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookclub.dto.StudyDTO;
import org.fullstack4.bookclub.service.StudyServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class studyTest {

    @Autowired
    private StudyServiceIf studyService;

    @Test
    public void testRegist(){
        for(int i=0;i<150;i++) {
            StudyDTO studyDTO = StudyDTO.builder()
                    .category("학습")
                    .contents("내용 test")
                    .like(i)
                    .title("제목 test")
                    .tags("tag1|tag2")
                    .member_id("test1")
                    .show_status("Y")
                    .end_date(LocalDate.parse("2024-05-15"))
                    .start_date(LocalDate.parse("2024-04-15")).build();
            studyService.regist(studyDTO);
        }
    }
}
