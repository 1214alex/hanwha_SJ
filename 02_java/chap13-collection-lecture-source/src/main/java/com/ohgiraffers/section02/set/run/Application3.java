package com.ohgiraffers.section02.set.run;

import com.sun.source.tree.Tree;

import java.util.Arrays;
import java.util.Set;
import java.util.TreeSet;

public class Application3 {
    public static void main(String[] args) {

        /* 수업목표. TreeSet에 대해 이해하고 활용할 수 있다. */
        /* 설명. Tree 구조를 활용해 중복 제거 + 정렬을 해준다. */
        Set<String> tSet = new TreeSet<>();
        tSet.add("ramen");
        tSet.add("pork");
        tSet.add("kimchi");
        tSet.add("friedEgg");
        tSet.add("soup");
        System.out.println("tSet = " + tSet);

        /* 설명. 로또 번호 발생기(feat. 보너스 번호 추출 제외)
         *   1부터 45까지 중복되지 않고 오름차순 정렬된 6개의 값 추출하기
        * */
        Set<Integer> lotto = new TreeSet<>();

        while(lotto.size() < 6) {
            lotto.add((int)(Math.random() * 45) + 1);
        }
        System.out.println("lotto = " + lotto);

        /* 설명. 배열을 활용한 TreeSet과 같은 기능을 하는 알고리즘 구현해 보기*/
        int[] arr = new int[6];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = (int)(Math.random() * 45) + 1;
            i = duplicateValidation(i, arr);
        }
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if(arr[i] > arr[j] && i<j){
                    int temp = 0;
                    temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
        System.out.println("배열 로또= " + Arrays.toString(arr));



        /* 설명. 강사님 코드*/
        int[] arr2 = new int[6];
        for (int i = 0; i < arr2.length; i++) {
            arr2[i] = (int)(Math.random() * 45) + 1;

            /* 설명. 이전 생성된 값들과 비교*/
            for (int j = 0; j<i; j++){
                if(arr2[i] == arr2[j]){
                    i--;
                    break;
                }
            }
        }
    }

    private static int duplicateValidation(int i, int[] arr) {
        for (int j = 0; j < i; j++) {
            if(arr[i] == arr[j] ){
                i = i - 1;
            }
        }
        return i;
    }
}
