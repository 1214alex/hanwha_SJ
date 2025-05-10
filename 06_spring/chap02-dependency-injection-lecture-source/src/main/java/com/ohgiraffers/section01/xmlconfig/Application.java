package com.ohgiraffers.section01.xmlconfig;

import com.ohgiraffers.common.MemberDTO;
import com.ohgiraffers.common.PersonalAccount;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Application {
    public static void main(String[] args) {
        ApplicationContext context = new GenericXmlApplicationContext("section01/xmlconfig/spring-context.xml");

        MemberDTO member = context.getBean(MemberDTO.class);
        System.out.println("member = " + member);

//        MemberDTO member2 = new MemberDTO(1,"홍","010", "hong",new PersonalAccount(20,"101")); //NOTE. SPRING을 쓰지 않았을때 기존에 하던 방식
    }
}
