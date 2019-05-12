package com.band.controller;

import com.band.pojo.Student;
import com.band.service.StudentService;
import com.band.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StudentController {
    @Resource
    private StudentService studentService;
    @RequestMapping("/studentList")
    public String selectStudentList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4")Integer rows,
                                    @RequestParam(defaultValue = "0") Integer sno, String sName, String address, Model model, HttpSession session){
        if(rows != 4){
            session.setAttribute("row", rows);
        }
        Integer nowRow = (Integer)session.getAttribute("row");
        if(nowRow != null)  rows = nowRow;

        Page<Student> students = studentService.selectStudentList(page, rows, sno, sName, address);
        Integer start = (page-1) * rows;

        model.addAttribute("page", students);

        model.addAttribute("rows", rows);
        model.addAttribute("count", students.getTotal());
        model.addAttribute("start", start);
        if(sno != 0){model.addAttribute("sno", sno);}
        model.addAttribute("sName", sName);
        model.addAttribute("address", address);
        return "student";
    }
    @RequestMapping("/addStudent")
    public String addStudent(Model model){
        String url = "saveStudent";
        model.addAttribute("url",url);
        return "au";
    }
    @RequestMapping("/saveStudent")
    public String saveStudent(Student student){
        studentService.addStudent(student);
        return "redirect:studentList";
    }
    @RequestMapping("/editStudent")
    public String editStudent(Integer id,Model model){
        Student student = studentService.findStudentById(id);
        model.addAttribute("student", student);
        String url = "updateStudent";
        model.addAttribute("url",url);
        return "au";
    }
    @RequestMapping("/updateStudent")
    public String updateStudent(Student student){
        studentService.updateStudent(student);
        return "redirect:studentList";
    }
    @RequestMapping("/deleteStudent")
    public String deleteStudent(Integer id){
        studentService.deleteStudent(id);
        return "redirect:studentList";
    }
    @RequestMapping("/deleteStudents")
    public String deleteStudents(Integer[] ids){
        if(ids != null){
            studentService.deleteStudents(ids);
        }
        return "student";
    }

}
