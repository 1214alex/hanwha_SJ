package com.ohgiraffers.section02.variable;

public class Application2 {
    public static void main(String[] args) {
        /* 수업목표. 변수를 선언하고 값을 할당하여 사용할 수 있다.(feat. 자료형(type)) */

        /* 목차. 1. 정수를 취금하는 자료형*/
        byte bNum;
        short sNum;
        int iNum;
        long lNum;

        /* 목차. 2. 실수를 취금하는 자료형*/
        float fNum;
        double dNum;

        /* 목차. 3. 문자를 취금하는 자료형*/
        char ch;

        /* 목차. 4. 논리값을 취금하는 자료형*/
        boolean isTrue;             //긍정의문문 형태의 변수명 사용 할 것

        /* 목차. 5. 문자열을 취금하는 자료형*/
        String str;

        /* 설명. 각 변수에 값을 대입해 보기*/
        bNum = 1;
        sNum = 2;
        iNum = 4;
        lNum = 2200000000L;         // 대략 21억 5천만이 넘으면 L을 붙여주어야한다. * long형 변수에 담아야 한다.

        fNum = 3.14f;               // 실수는 double 형으로 인지하기 때문에 float형 변수에 담기 위해서는 f를 붙여야 한다.
        dNum = -3.14;

        ch = 'a';
        ch = 97;                    // char는 숫자를 담을 수 있는데 양수만 가능하다.
                                    // (∵ 아스키 코드나 유니코드 체계에는 음수가 없다.)

        isTrue = true;
        isTrue = false;

        str = "hello";

        /* 설명. 변수를 활용한 합계(sum), 평균(avg) 출력해 보기 */
        int kor = 90;
        int math = 80;
        int eng = 75;

        int sum = kor + math + eng;
        System.out.println("합계: " + sum);

        double avg = sum / 3.0;         //연산 시 소수점을 살리고 싶으면 최소 하나는 실수형으로 계산
        System.out.println("평균: " + avg);


    }
}
