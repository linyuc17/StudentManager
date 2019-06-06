package com.band.service;

import com.band.pojo.Course;
import com.band.utils.Page;

import java.util.List;

public interface CourseService {
    Course findCourseById(Integer id);
    Integer selectCourseListCount(Course course);
    Page<Course> selectCourseList(Integer page, Integer rows, Integer courseId, String courseName, String teacherName);
    void addCourse(Course course);
    void updateCourse(Course course);
    void deleteCourse(Integer id);
    void deleteCourses(Integer[] ids);
    void updateAllowance(Course course);
    List<Course> selectMyCourse(Integer[] ids);
}
