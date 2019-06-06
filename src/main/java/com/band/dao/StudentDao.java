package com.band.dao;

import com.band.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDao {
    Student findStudentById(Integer sno);
    Integer selectStudentListCount(Student student);
    List<Student> selectStudentList(Student student);
    void addStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(Integer id);
    void deleteStudents(Integer[] ids);
    Student findStudentByName(String sName);
}
