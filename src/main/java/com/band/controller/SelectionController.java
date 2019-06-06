package com.band.controller;

import com.band.pojo.Course;
import com.band.pojo.Selection;
import com.band.service.CourseService;
import com.band.service.SelectionService;
import com.band.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/selection")
public class SelectionController {
    @Resource
    private SelectionService selectionService;
    @Resource
    private CourseService courseService;
    @RequestMapping("/list")
    public String selectSelectionList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4")Integer rows,
                                      String sName, String courseName, @RequestParam(defaultValue = "3") Integer selectionStatus,
                                      Model model, HttpSession session){
        if(rows != 4){
            session.setAttribute("row", rows);
        }
        Integer nowRow = (Integer)session.getAttribute("row");
        if(nowRow != null)  rows = nowRow;
        System.out.println("sName="+sName);
        Page<Selection> selections = selectionService.selectSelectionList(page, rows, sName, courseName, selectionStatus);

        Integer start = (page-1) * rows;

        model.addAttribute("page", selections);
        model.addAttribute("rows", rows);
        model.addAttribute("count", selections.getTotal());
        model.addAttribute("start", start);
        if(selectionStatus != 3){model.addAttribute("selectionStatus", selectionStatus);}
        model.addAttribute("sName", sName);
        model.addAttribute("courseName", courseName);
        return "/selection/list";
    }
    @RequestMapping("/add")
    public String addSelection(Model model){
        String url = "save";
        model.addAttribute("url",url);
        return "selection/au";
    }
    @RequestMapping("/save")
    public String saveSelection(Selection selection){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String day = sdf.format(new Date());
        selection.setSelection_time(day);
        selectionService.addSelection(selection);
            return "redirect:list";
    }
    @RequestMapping("/edit")
    public String editSelection(Integer id,Model model){
        Selection selection = selectionService.findSelectionById(id);
        model.addAttribute("selection", selection);
        String url = "update";
        model.addAttribute("url",url);
        return "selection/au";
    }
    @RequestMapping("/update")
    public String updateSelection(Selection selection){

        selectionService.updateSelection(selection);
        return "redirect:list";
    }
    @RequestMapping("/delete")
    public String deleteSelection(Integer id){
        selectionService.deleteSelection(id);
        return "redirect:list";
    }
    @RequestMapping("/deletes")
    public String deleteSelections(Integer[] ids){
        if(ids != null){
            selectionService.deleteSelections(ids);
        }
        return "selection/list";
    }
    @RequestMapping("/updateStatus")
    @ResponseBody
    public void updateStatus(Integer id, Integer status){
        if(status == 2){
            Selection selection = selectionService.findSelectionById(id);
            Course course = courseService.findCourseById(selection.getCourse_id());
            course.setCourse_allowance(course.getCourse_allowance()+1);
            courseService.updateAllowance(course);
        }
        Selection selection = new Selection(id, status);
        selectionService.updateStatus(selection);
    }
}
