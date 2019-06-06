package com.band.dao;

import com.band.pojo.Course;
import com.band.pojo.Course;

import java.util.List;

public interface CourseDao {
    Course findCourseById(Integer id);
    Integer selectCourseListCount(Course course);
    List<Course> selectCourseList(Course course);
    void addCourse(Course course);
    void updateCourse(Course course);
    void deleteCourse(Integer id);
    void deleteCourses(Integer[] ids);
    void updateAllowance(Course course);
    List<Course> selectMyCourse(Integer[] ids);

}
