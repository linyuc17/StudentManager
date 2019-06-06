package com.band.pojo;
/**
 * @author Lyc
 * 选课信息的持久化类
 */
public class Selection {
    private Integer selection_id;
    private Integer sno;
    private String sName;
    private Integer course_id;
    private String course_name;
    private String selection_time;
    //0:待审核，1:已通过，2:未通过
    private Integer selection_status;
    private Integer rowNum;
    private Integer rn;

    public Selection() {
    }

    public Selection(Integer selection_id, Integer selection_status) {
        this.selection_id = selection_id;
        this.selection_status = selection_status;
    }

    public Integer getSelection_id() {
        return selection_id;
    }
    public void setSelection_id(Integer selection_id) {
        this.selection_id = selection_id;
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

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getSelection_time() {
        return selection_time;
    }

    public void setSelection_time(String selection_time) {
        this.selection_time = selection_time;
    }

    public Integer getSelection_status() {
        return selection_status;
    }

    public void setSelection_status(Integer selection_status) {
        this.selection_status = selection_status;
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
        return "Selection{" +
                "selection_id=" + selection_id +
                ", course_id=" + course_id +
                ", course_name='" + course_name + '\'' +
                ", sno=" + sno +
                ", sName='" + sName + '\'' +
                ", selection_time='" + selection_time + '\'' +
                ", selection_status=" + selection_status +
                '}';
    }
}
