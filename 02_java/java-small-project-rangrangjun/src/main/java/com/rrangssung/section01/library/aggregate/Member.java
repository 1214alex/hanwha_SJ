package com.rrangssung.section01.library.aggregate;

public class Member {
    private String memberID;
    private String name;
    private int age;
    private GenderType gender;
    private CheckOutStatus status;

    public Member(){

    };

    public Member(String memberID, String name, int age, GenderType gender, CheckOutStatus status) {
        this.memberID = memberID;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.status = status;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public CheckOutStatus getStatus() {
        return status;
    }

    public void setStatus(CheckOutStatus status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Member{" +
                "memberID='" + memberID + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender=" + gender +
                ", status=" + status +
                '}';
    }
}
