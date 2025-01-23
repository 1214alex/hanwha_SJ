package com.ohgiraffers.section01.conditional;

import java.util.Scanner;

public class D_switch {

    public static void testSimpleSwitchStatement() {
        Scanner sc = new Scanner(System.in);

        System.out.print("등급을 입력하세요(G, S, B):");
        char grade = sc.next().charAt(0);
//        System.out.println("grade = " + grade);

        int point = 0;

        boolean flag = true;

        switch (grade) {
            case 'G': point += 10;
            case 'S': point += 10;
            case 'B': point += 10;
                      break;
            default:
                flag = false;
                System.out.println("입력 좀 제대로 하세요");
        }

        if (flag == true){
            System.out.println("당신의 등급은 " + grade + "이고, 현재 포인트는" + point + "입니다.");
        } else{
            System.out.println("등급도 모르는 거 같으니 이참에 회원가입 ㄱㄱ");
        }


    }
}
