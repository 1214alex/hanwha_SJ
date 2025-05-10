package com.ohgiraffers.section02.uses.subsection03.terminal;

public class Member {
    private String memberId;
    private String memberName;

    public Member() {
    }

    public Member(String memberName, String memberId) {
        this.memberName = memberName;
        this.memberId = memberId;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
}
