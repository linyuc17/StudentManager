package com.band.service.impl;

import com.band.dao.CourseDao;
import com.band.pojo.Course;
import com.band.service.CourseService;
import com.band.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;
    public Course findCourseById(Integer id){
        return this.courseDao.findCourseById(id);
    }

    @Override
    public Integer selectCourseListCount(Course course) {
        return null;
    }

    @Override
    public Page<Course> selectCourseList(Integer page, Integer rows,Integer courseId, String courseName, String teacherName){
        Course course = new Course();

        course.setCourse_id(courseId);
        if(StringUtils.isNotBlank(courseName)){
            course.setCourse_name(courseName);
        }
        if(StringUtils.isNotBlank(teacherName)){
            course.setTeacher_name(teacherName);
        }
        Integer start = (page-1) * rows;//当前页
        course.setRn(start);
        course.setRowNum(start+rows+1);
        System.out.println("显示第"+course.getRn()+"条和第"+course.getRowNum()+"之间的数据");
        System.out.println("implcourseId="+courseId);
        List<Course> courses = courseDao.selectCourseList(course);
        Integer count = courseDao.selectCourseListCount(course);
        Page<Course> result = new Page<>();
        result.setPage(page);
        result.setRows(courses);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public void addCourse(Course course) {
         this.courseDao.addCourse(course);
    }

    @Override
    public void updateCourse(Course course) {
        this.courseDao.updateCourse(course);
    }

    @Override
    public void deleteCourse(Integer id) {
        this.courseDao.deleteCourse(id);
    }

    @Override
    public void deleteCourses(Integer[] ids) {
        this.courseDao.deleteCourses(ids);
    }
    public void updateAllowance(Course course){
        this.courseDao.updateAllowance(course);
    }
    public List<Course> selectMyCourse(Integer[] ids){
        return this.courseDao.selectMyCourse(ids);
    }
}
