package com.band.controller;

import com.band.pojo.Student;
import com.band.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Resource
    private StudentService studentService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/userLogin")
    public String userLogin(Model model, String username, String password, Integer userType, HttpSession session){
        System.out.println(userType);
        if(userType == 1){
            String adminName = "aaaacl";
            String adminPassword = "1234";
            if (adminName.equals(username) && adminPassword.equals(password)){
                session.setAttribute("USERNAME", adminName);
                session.setAttribute("userType", 1);
                return "index";
            }else{
                model.addAttribute("msg","管理员用户名或密码错误...");
                return "login";
            }
        }else{
            Student student = studentService.findStudentByName(username);
            if(student != null && password.equals(student.getPassword())){
                session.setAttribute("USERNAME", student.getsName());
                return "/student/index";
            }else{
                model.addAttribute("msg","学生用户名或密码错误...");
                return "login";
            }
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:login";
    }
}
