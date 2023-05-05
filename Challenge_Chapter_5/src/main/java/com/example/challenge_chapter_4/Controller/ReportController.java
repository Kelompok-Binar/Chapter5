package com.example.challenge_chapter_4.Controller;

import com.example.challenge_chapter_4.Model.ReportEntity;
import com.example.challenge_chapter_4.Response.CommonResponse;
import com.example.challenge_chapter_4.Response.CommonResponseGenerator;
import com.example.challenge_chapter_4.Service.ReportService;
import io.swagger.annotations.Api;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileNotFoundException;

@RestController
@RequestMapping(value ="/Report")
@Api(value = "Report")
public class ReportController {

    @Autowired
    ReportService reportService;

    @Autowired
    CommonResponseGenerator frg;

    @GetMapping("/report/{format}")
    public CommonResponse<String> generateReport(@PathVariable String format) throws JRException, FileNotFoundException {
        return frg.succsesResponse(reportService.printReport(format),"Sukses Export data for admin");

    }
    @GetMapping("/report/{format}/{id_report}")
    public CommonResponse<String> generateReportbyID(@PathVariable String format, @PathVariable Integer id_report) throws JRException, FileNotFoundException {
        return frg.succsesResponse(reportService.printReportbyId(format, id_report),"Sukses Export data for user");
    }

}