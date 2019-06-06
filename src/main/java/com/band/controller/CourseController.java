package com.band.controller;

import com.band.pojo.Course;
import com.band.service.CourseService;
import com.band.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Resource
    private CourseService courseService;
    @RequestMapping("/list")
    public String selectCourseList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4")Integer rows,
                                    @RequestParam(defaultValue = "0") Integer courseId, String courseName,
                                   String teacherName, Model model, HttpSession session){
        /*String sName = String.valueOf(session.getAttribute("USERNAME"));
        if("aaaacl".equals(sName)){
        }*/
        if(rows != 4){
            session.setAttribute("row", rows);
        }
        Integer nowRow = (Integer)session.getAttribute("row");
        if(nowRow != null)  rows = nowRow;
        System.out.println("courseId="+courseId);
        Page<Course> courses = courseService.selectCourseList(page, rows, courseId, courseName, teacherName);

        Integer start = (page-1) * rows;

        model.addAttribute("page", courses);
        model.addAttribute("rows", rows);
        model.addAttribute("count", courses.getTotal());
        model.addAttribute("start", start);
        if(courseId != 0){model.addAttribute("courseId", courseId);}
        model.addAttribute("courseName", courseName);
        model.addAttribute("teacherName", teacherName);
        return "/course/list";
    }
    @RequestMapping("/add")
    public String addCourse(Model model){
        String url = "save";
        model.addAttribute("url",url);
        return "course/au";
    }
    @RequestMapping("/save")
    public String saveCourse(Course course){

        courseService.addCourse(course);
            return "redirect:list";
    }
    @RequestMapping("/edit")
    public String editCourse(Integer id,Model model){
        Course course = courseService.findCourseById(id);
        model.addAttribute("course", course);
        String url = "update";
        model.addAttribute("url",url);
        return "course/au";
    }
    @RequestMapping("/update")
    public String updateCourse(Course course){

        courseService.updateCourse(course);
        return "redirect:list";
    }
    @RequestMapping("/delete")
    public String deleteCourse(Integer id){

        courseService.deleteCourse(id);
        return "redirect:list";
    }
    @RequestMapping("/deletes")
    public String deleteCourses(Integer[] ids){
        if(ids != null){
            courseService.deleteCourses(ids);
        }
        return "course/list";
    }
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

}
