package com.ohgiraffers.section02.enumtype;

public enum Subjects {
    JAVA,
    MARIADB,
    JDBC,
    HTML,
    CSS,
    JAVASCRIPT;

/* 설명. 밑에 메서드가 존재하지 않는다면 세미콜론을 안붙여도 되지만, 나중을 위해 세미콜론을 붙이자 */
    Subjects() {
        System.out.println("기본 생성자 실행됨...");
    }

    @Override
    public String toString() {
        return "@@@@" + this.name() + "@@@@";
    }
}
