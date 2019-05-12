package com.band.dao;

import com.band.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDao {
    public Student findStudentById(Integer sno);
    public Integer selectStudentListCount(Student student);
    public List<Student> selectStudentList(Student student);
    public void addStudent(Student student);
    public void updateStudent(Student student);
    public void deleteStudent(Integer id);
    public void deleteStudents(Integer[] ids);
}
