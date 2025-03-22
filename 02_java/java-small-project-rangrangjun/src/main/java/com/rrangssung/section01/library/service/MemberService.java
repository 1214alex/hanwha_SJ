package com.rrangssung.section01.library.service;

import com.rrangssung.section01.library.repository.BookRepository;
import com.rrangssung.section01.library.repository.MemberRepository;

public class MemberService {

    private final MemberRepository mr = new MemberRepository();
    private final BookRepository br = new BookRepository();
}
