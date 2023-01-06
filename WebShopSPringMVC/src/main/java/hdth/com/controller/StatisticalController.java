package hdth.com.controller;


import hdth.com.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class StatisticalController {

    @Autowired
    private StatsService statsService;

    @GetMapping("/statistical-cate")
    public String adminstatisticaCate(Model model) {

        model.addAttribute("cateStats", this.statsService.cateStats());

        return "admin/d-statistical-category";
    }

    @GetMapping("/statistical-product")
    public String adminstatisticaProduct(Model model, @RequestParam(required = false) Map<String, String> params) {

        String kw = params.getOrDefault("kw", null);

        //chuyen string thanh ngay thang
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");


        Date fromDate = null, toDate = null;


        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
                System.out.println(fromDate);
            }
            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
                System.out.println(toDate);
            }

        } catch (ParseException ex) {
            ex.printStackTrace();
        }


        model.addAttribute("productStats", this.statsService.productStats(kw, fromDate, toDate));

        return "admin/d-statistical-product";
    }


    @GetMapping("/statistical-product-month")
    public String adminstatisticaProductMonth(Model model, @RequestParam(required = false) Map<String, String> params) {

        String kw = params.getOrDefault("kw", null);

        //chuyen string thanh ngay thang
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");


        Date fromDate = null, toDate = null;


        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
                System.out.println(fromDate);
            }
            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
                System.out.println(toDate);
            }

        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        model.addAttribute("productMonthStats", this.statsService.productMonthStats(kw, fromDate, toDate));

        return "admin/d-statistical-product-month";
    }

}
