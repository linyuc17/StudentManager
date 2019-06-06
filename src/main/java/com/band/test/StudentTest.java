package com.band.test;

import com.band.dao.SelectionDao;
import com.band.dao.StudentDao;
import com.band.pojo.Selection;
import com.band.pojo.Student;
import com.band.service.SelectionService;
import com.band.service.StudentService;
import com.band.utils.Page;
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
        ApplicationContext applicationContext =
              new ClassPathXmlApplicationContext("applicationContext.xml");
        //StudentService studentService = applicationContext.getBean(StudentService.class);
        SelectionDao selectionDao = applicationContext.getBean(SelectionDao.class);
        //Student student = studentService.findStudentById(10001);
        //Selection course = courseService.findSelectionById(200100);
        //System.out.println(course);
        //selectionDao.updateStatus(2, 60020);
        Selection selection = selectionDao.findSelectionById(60020);
        System.out.println(selection);
    }
}
