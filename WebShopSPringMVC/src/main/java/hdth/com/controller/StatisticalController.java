package hdth.com.controller;


import hdth.com.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class StatisticalController {

    @Autowired
    private StatsService statsService;

    @GetMapping("/statistical-cate")
    public String adminstatisticaCate(Model model){

        model.addAttribute("cateStats",this.statsService.cateStats());

        return "admin/d-statistical-category";
    }

    @GetMapping("/statistical-product")
    public String adminstatisticaProduct(Model model){

        model.addAttribute("productStats",this.statsService.productStats(null,null, null));

        return "admin/d-statistical-product";
    }

}
