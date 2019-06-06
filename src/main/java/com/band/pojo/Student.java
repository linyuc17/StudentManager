package com.band.pojo;

import org.springframework.web.multipart.MultipartFile;

public class Student {
    private int sno;
    private String sName;
    private String password;
    private Integer gender;
    private String phone;
    private String address;
    private String photo;
    private Integer rowNum;
    private Integer rn;
    private MultipartFile file;
    public Student(){
    }
    public Student(int sno, String sName, String password, Integer gender, String phone, String address) {
        this.sno = sno;
        this.sName = sName;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }

    public Student(int sno, String sName, String address) {
        this.sno = sno;
        this.sName = sName;
        this.address = address;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno=" + sno +
                ", sName='" + sName + '\'' +
                ", password='" + password + '\'' +
                ", gender=" + gender +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
}
