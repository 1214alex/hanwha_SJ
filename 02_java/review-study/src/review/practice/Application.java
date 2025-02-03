package review.practice;

import java.util.Scanner;

public class Application {
    public static void main(String[] args) {

        /* todo. 6. 완전수 판별
        설명: 사용자로부터 정수를 입력받아, 그 숫자가 완전수인지 확인하세요.
        (완전수란, 자신을 제외한 모든 약수의 합이 자기 자신과 같은 숫자입니다. 예: 6, 28, ...)
        예시:
        입력: 28
        출력: 28은 완전수입니다.
        */

        Scanner sc = new Scanner(System.in);
        System.out.print("정수를 입력하세요: ");
        int num = sc.nextInt();
        int sum = 0;

        for (int i = 1; i < num; i++) {
            if(num % i == 0){
                sum += i;
            }
        }

        if(sum == num){
            System.out.println(num + "은 완전수입니다.");
        } else{
            System.out.println(num + "는 완전수가 아닙니다");
        }




    }
}
