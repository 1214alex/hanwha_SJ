package com.ohgiraffers.section01.aop;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@ComponentScan("com.ohgiraffers.section01.aop")
@EnableAspectJAutoProxy(proxyTargetClass = true)    //NOTE 얘 없으면 안됨, 없으면 Aspect같은 어노테이션이 인식이 안돼서 안됨
public class ContextConfiguration {
}
