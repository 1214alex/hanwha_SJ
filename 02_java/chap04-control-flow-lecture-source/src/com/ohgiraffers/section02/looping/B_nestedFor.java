package com.ohgiraffers.section02.looping;

import java.util.Scanner;

public class B_nestedFor {
    public void printGugudanFromTwoToNine() {


            /* 설명.
             *  2단
             *   2 * 1 = 2
             *   2 * 2 = 4
             *  ...
             *  9단
             *   9 * 1 = 9
             *   9 * 2 = 18
             *   ...
             *   9 * 9 = 81
            * */
//        for (int i = 2; i < 10 ; i++) {
//            System.out.println(i + "단");
//            for (int j = 1; j < 10; ++j) {
//                System.out.println(i + " * " + j + " = " + (i*j));
//            }
//            System.out.println("");
//
//        }
        for (int i = 2; i < 10 ; i++) {
            System.out.println(i + "단");
            printGugudanof(i);
            System.out.println("");

        }
    }

    /* 설명. dan을 넘겨주면 해당 단수의 구구단을 출력하는 메소드 */
    private static void printGugudanof(int i) {
        for (int j = 1; j < 10; ++j) {
            System.out.println(i + " * " + j + " = " + (i *j));
        }
    }
    /* 설명.
     * 아래와 같은 별모양이 나오도록 작성해 보자.
     * 정수를 입력하시오: 5
     *        *
     *       **
     *      ***
     *     ****
     *    *****
     * */
    public void printStars() {
        Scanner sc = new Scanner(System.in);
        System.out.print("정수를 입력하시오: ");
        int input = sc.nextInt();
        for (int i = 0; i < input; i++){

            /* 설명. 공백 찍기 */
            printSpace(input, i);

            /* 설명. 별 찍기*/
            printStars(i);
            System.out.println();

        }

    }

    private void printStars(int row) {
        for (int j = 0; j<(row +1); j++){
            System.out.print("*");
        }
    }

    private void printSpace(int input, int row) {
        for (int j = 0; j < input - (row +1) ; j++) {
            System.out.print(" ");
        }
    }


}
