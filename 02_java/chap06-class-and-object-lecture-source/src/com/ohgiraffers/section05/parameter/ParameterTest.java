package com.ohgiraffers.section05.parameter;

import java.util.Arrays;

public class ParameterTest {

    public void testPrimitiveTypeParameter(int num) {
        num = 10;
        System.out.println("매개변수로 전달받아 수정한 값: " + num);
    }

    public void testPrimitiveTypeParameter(int[] iArr) {
        iArr[0] = 100;

    }
    public void testClassTypeParameter(Rectangle rectangle) {
        rectangle.calArea();
        rectangle.calRound();
    }

    public void testVariableLengthArrayParameter(String... str) {
        System.out.println("남은 인자들 출력: " + Arrays.toString(str));
    }
}
