package com.band.pojo;

public class Course {
    private Integer course_id;
    private String course_name;
    private String teacher_name;
    private String course_time;
    private Integer course_credit;
    private String course_nature;
    private Integer course_allowance;
    private Integer rowNum;
    private Integer rn;
    public Course(){
    }
    public Course(Integer course_id, Integer course_allowance){
        this.course_id = course_id;
        this.course_allowance = course_allowance;
    }

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getCourse_time() {
        return course_time;
    }

    public void setCourse_time(String course_time) {
        this.course_time = course_time;
    }

    public Integer getCourse_credit() {
        return course_credit;
    }

    public void setCourse_credit(Integer course_credit) {
        this.course_credit = course_credit;
    }

    public String getCourse_nature() {
        return course_nature;
    }

    public void setCourse_nature(String course_nature) {
        this.course_nature = course_nature;
    }

    public Integer getCourse_allowance() {
        return course_allowance;
    }

    public void setCourse_allowance(Integer course_allowance) {
        this.course_allowance = course_allowance;
    }

    public Integer getRowNum() {
        return rowNum;
    }

    public void setRowNum(Integer rowNum) {
        this.rowNum = rowNum;
    }

    public Integer getRn() {
        return rn;
    }

    public void setRn(Integer rn) {
        this.rn = rn;
    }

    @Override
    public String toString() {
        return "Course{" +
                "course_id=" + course_id +
                ", course_name='" + course_name + '\'' +
                ", teacher_name='" + teacher_name + '\'' +
                ", course_time='" + course_time + '\'' +
                ", course_credit=" + course_credit +
                ", course_nature='" + course_nature + '\'' +
                ", course_allowance='" + course_allowance + '\'' +
                '}';
    }
}
