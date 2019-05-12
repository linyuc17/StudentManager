package com.band.service.impl;

import com.band.dao.StudentDao;
import com.band.pojo.Student;
import com.band.service.StudentService;
import com.band.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    public Student findStudentById(Integer id){
        return this.studentDao.findStudentById(id);
    }

    @Override
    public Integer selectStudentListCount(Student student) {
        return null;
    }

    @Override
    public Page<Student> selectStudentList(Integer page, Integer rows,Integer sno, String sName, String address){
        Student student = new Student();
        if(sno != 0){
            System.out.println("sno2:"+sno);
            student.setSno(sno);
        }
        if(StringUtils.isNotBlank(sName)){
            student.setsName(sName);
        }
        if(StringUtils.isNotBlank(address)){
            student.setAddress(address);
        }
        Integer start = (page-1) * rows;//当前页
        student.setRn(start);
        student.setRowNum(start+rows+1);
        System.out.println("显示第"+student.getRn()+"条和第"+student.getRowNum()+"之间的数据");
        List<Student> students = studentDao.selectStudentList(student);
        Integer count = studentDao.selectStudentListCount(student);
        Page<Student> result = new Page<>();
        result.setPage(page);
        result.setRows(students);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public void addStudent(Student student) {
         this.studentDao.addStudent(student);
    }

    @Override
    public void updateStudent(Student student) {
        this.studentDao.updateStudent(student);
    }

    @Override
    public void deleteStudent(Integer id) {
        this.studentDao.deleteStudent(id);
    }

    @Override
    public void deleteStudents(Integer[] ids) {
        this.studentDao.deleteStudents(ids);
    }
}
