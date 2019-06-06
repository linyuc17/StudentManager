package com.band.service;

import com.band.pojo.Student;
import com.band.utils.Page;

import java.util.List;

public interface StudentService {
    Student findStudentById(Integer id);
    Integer selectStudentListCount(Student student);
    Page<Student> selectStudentList(Integer page, Integer rows, Integer sno, String sName, String address);
    void addStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(Integer id);
    void deleteStudents(Integer[] ids);
    Student findStudentByName(String sName);
}
