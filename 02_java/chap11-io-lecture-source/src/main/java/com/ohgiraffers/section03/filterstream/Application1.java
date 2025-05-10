package com.ohgiraffers.section03.filterstream;

import java.io.*;

public class Application1 {
    public static void main(String[] args) {

        /* 수업목표. BufferedWriter와 BufferedReader에 대해 이해하고 사용할 수 있다.*/
        /* 설명.
         *  내부적으로 버퍼(buffer)를 활용해서 입출력 성능을 향상 시킨다.
         *  추가적인 메소드가 제공된다.
        * */

        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(
                    new FileWriter(
                            "src/main/java/com/ohgiraffers/section03/filterstream/testBuffered.txt"));

            bw.write("눈이\n");
            bw.write("하늘에서\n");
            bw.write("내려오네");

            /* 설명. 내부적으로 버퍼가 다 차지 않으면 출력으로 내보내지지 않는데 flush()을 호출해야 버퍼가 비워진다.
             *  flush()를 사용하는 이유는 close()를 사용하기 전에 내가 원하는 시간에 출력되는 내용을 확인하기 위해 사용을 하는 것이고 flush()만 사용을 하게 되면 스트림은 여전히 열려있기 때문에 close()를 같이 사용해 주어야 한다.
            * */
            bw.flush();

        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if(bw != null) bw.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        BufferedReader br = null;
        try {
            br = new BufferedReader(
                    new FileReader(
                            "src/main/java/com/ohgiraffers/section03/filterstream/testBuffered.txt"
                    )
            );

//            String str = br.readLine();
//            System.out.println("str = " + str);
            String str = "";
            while((str = br.readLine()) != null){
                System.out.println("str = " + str);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                br.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }


    }
}
