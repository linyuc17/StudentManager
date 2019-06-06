package com.band.controller;

import com.band.pojo.Course;
import com.band.pojo.Selection;
import com.band.pojo.Student;
import com.band.service.CourseService;
import com.band.service.SelectionService;
import com.band.service.StudentService;
import com.band.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService studentService;
    @Resource
    private SelectionService selectionService;
    @Resource
    private CourseService courseService;
    @RequestMapping("/list")
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
        return "student/list";
    }
    @RequestMapping("/add")
    public String addStudent(Model model){
        String url = "save";
        model.addAttribute("url",url);
        return "student/au";
    }
    @RequestMapping("/save")
    public String saveStudent(Student student, HttpServletRequest request){
        if(!student.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/upload/student/");
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = student.getSno() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                student.getFile().transferTo(new File(dirPath + NewFilename));
                String sqlPath = NewFilename;
                student.setPhoto(sqlPath);
                studentService.addStudent(student);
            }catch(Exception e){
                e.printStackTrace();
                return "error";
            }
            return "redirect:list";
        }else{
            return "error";
        }
    }
    @RequestMapping("/edit")
    public String editStudent(Integer id,Model model){
        Student student = studentService.findStudentById(id);
        model.addAttribute("student", student);
        String url = "update";
        model.addAttribute("url",url);
        return "student/au";
    }
    @RequestMapping("/update")
    public String updateStudent(Student student, HttpServletRequest request, HttpSession session){
        String sName = String.valueOf(session.getAttribute("USERNAME"));
        if(!student.getFile().isEmpty()){
            String dirPath = request.getServletContext().getRealPath("/upload/student/");
            File filePath = new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            String NewFilename = student.getSno() + "_"+ UUID.randomUUID() + ".jpg";
            try{
                student.getFile().transferTo(new File(dirPath + NewFilename));
                String sqlPath = NewFilename;
                student.setPhoto(sqlPath);
                studentService.updateStudent(student);
            }catch(Exception e){
                e.printStackTrace();
                return "error";
            }
            if(!sName.equals("aaaacl")){
                return "redirect:personal";
            }else{
                return "redirect:list";
            }

        }else{
            return "error";
        }
    }
    @RequestMapping("/delete")
    public String deleteStudent(Integer id){
        studentService.deleteStudent(id);
        return "redirect:list";
    }
    @RequestMapping("/deletes")
    public String deleteStudents(Integer[] ids){
        if(ids != null){
            studentService.deleteStudents(ids);
        }
        return "student/list";
    }
    /*学生个人信息*/
    @RequestMapping("/personal")
    public String personal(Model model, HttpSession session){
        String sName = String.valueOf(session.getAttribute("USERNAME"));
        Student student = studentService.findStudentByName(sName);
        model.addAttribute("student", student);
        return "student/personal";
    }
    /*学生选课生成选课信息*/
    @RequestMapping("/addCourse")
    public String  addCourse(Integer id, HttpSession session){
        String sName = (String)session.getAttribute("USERNAME");
        Student student  = studentService.findStudentByName(sName);
        Course course = courseService.findCourseById(id);
        if(course.getCourse_allowance() == 0){
            return "redirect:list";
        }
        Selection selection = new Selection();

        Integer selectionId = Integer.valueOf(randomChar(5));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(new Date());

        selection.setSelection_id(selectionId);
        selection.setSno(student.getSno());
        selection.setsName(sName);
        selection.setCourse_id(id);
        selection.setCourse_name(course.getCourse_name());
        selection.setSelection_time(time);
        selection.setSelection_status(0);
        selectionService.addSelection(selection);

        course.setCourse_allowance(course.getCourse_allowance()-1);
        System.out.println(course.getCourse_allowance());
        courseService.updateAllowance(course);
        return "redirect:list";
    }
    /*学生退选课程
      删除selection表相关信息
      course表余量加一
    */
    @RequestMapping("/deleteCourse")
    public void deleteCourse(Integer id){
        Selection selection = selectionService.findSelectionById(id);
        Course course = courseService.findCourseById(selection.getCourse_id());
        course.setCourse_allowance(course.getCourse_allowance()+1);

        selectionService.deleteSelection(id);
        courseService.updateAllowance(course);
    }
    @RequestMapping("/mySelection")
    public String mySelection(Model model,HttpSession session){
        Selection selection = new Selection();
        String sName = String.valueOf(session.getAttribute("USERNAME"));
        selection.setsName(sName);
        List<Selection> selections = selectionService.selectionMySelection(selection);
        model.addAttribute("selections",selections);
        return "student/mySelection";
    }
    /*
    通过session里的学生姓名找到该学生的选课，再从选课里的课程号，找出相应的课程
    */
    @RequestMapping("/myCourse")
    public String myCourse(Model model, HttpSession session){
        Selection selection = new Selection();
        String sName = String.valueOf(session.getAttribute("USERNAME"));
        selection.setsName(sName);
        List<Selection> selections = selectionService.selectionMySelection(selection);
        List<Course> courses = new ArrayList<>();
        for(Selection selection1: selections){
            System.out.println(selection1);
            if(selection1.getSelection_status() == 1){
                Course course = courseService.findCourseById(selection1.getCourse_id());
                courses.add(course);
                System.out.println(course);
            }
        }

        model.addAttribute("courses",courses);
        return "student/myCourse";
    }
    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }
    private String randomChar(int length){
        String info = "1234567890";
        Random rnd = new Random();
        StringBuffer code = new StringBuffer();
        for(int i = 0; i < length; i++){
            int a = rnd.nextInt(info.length());
            char c = info.charAt(a);
            code.append(c);
        }
        System.out.println(code);
        return code.toString();
    }

}
