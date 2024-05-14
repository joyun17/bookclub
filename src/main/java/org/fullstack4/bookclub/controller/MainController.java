package org.fullstack4.bookclub.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value = "/main")
@RequiredArgsConstructor
public class MainController {
    @GetMapping("/main")
    public void main(){

    }
    @GetMapping("/mystudy")
    public void myStudy(){

    }
}
