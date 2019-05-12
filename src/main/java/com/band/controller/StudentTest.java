package com.band.controller;

import com.band.dao.StudentDao;
import com.band.pojo.Student;
import com.band.service.StudentService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import sun.rmi.runtime.NewThreadAction;

import javax.annotation.Resource;
import java.util.List;
@Controller
public class StudentTest {
    @Test
    public void Test(){
        /*ApplicationContext applicationContext =
              new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService studentService = applicationContext.getBean(StudentService.class);
        //StudentDao studentDao = applicationContext.getBean(StudentDao.class);
        Student student = studentService.findStudentById(10033);*/
    }
}
