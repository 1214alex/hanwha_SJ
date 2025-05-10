package com.practice;

import java.util.ArrayList;

class Solution {
    public int solution(int k, int m, int[] score) {
        int answer = 0;
        for (int i = 0; i < score.length ; i++) {
            for (int j = 0; j < i; j++) {
                if(score[i]<score[j]){
                    int temp = score[i];
                    score[i] = score[j];
                    score[j] = temp;
                }

            }
            for(int l = 0; l < score.length - m; l++){
                score[l] = score[i];
            }

        }

        for (int i = m + 1; i < score.length - m + 1; i++) {
            score[i] = score[m];
        }

        return answer;
    }
}