package com.example.challenge_chapter_4.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping(value ="/tes")
public class tesController {
    @GetMapping(value = "tesAPI")
    public String tes(){
        return "Hello ges";
    }
}
