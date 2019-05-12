package com.band.service;

import com.band.pojo.Student;
import com.band.utils.Page;

import java.util.List;

public interface StudentService {
    public Student findStudentById(Integer id);
    public Integer selectStudentListCount(Student student);
    public Page<Student> selectStudentList(Integer page, Integer rows, Integer sno, String sName, String address);
    public void addStudent(Student student);
    public void updateStudent(Student student);
    public void deleteStudent(Integer id);
    public void deleteStudents(Integer[] ids);
}
