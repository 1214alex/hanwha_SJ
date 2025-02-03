package com.ohgiraffers.section08.uses;

public class MemberRepository {

    private final static Member[] staticMembers = new Member[20];
    private static int count;

    public static void store(Member[] members) {
        for (int i = 0; i < members.length; i++) {
            staticMembers[count++] = members[i];
        }
    }

    public static Member[] findAllMembers() {
        return staticMembers;
    }
}
