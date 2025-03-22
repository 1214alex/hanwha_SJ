package com.rrangssung.section01.library.repository;

import java.io.File;
import java.util.ArrayList;

public class MemberRepository {

    private final ArrayList memberList = new ArrayList();
    private final File file = new File("src/main/java/com/rrangssung/section01/library/db/memberDB.dat");

    public MemberRepository(){

    }
}
