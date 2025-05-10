package com.ohgiraffers.section03.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.ohgiraffers.common.JDBCTemplate.*;

public class Application {
    public static void main(String[] args) {
        Connection con = getConnection();
        PreparedStatement pstmt = null;
        int result = 0;

        /* 설명. 1. soft delete*/
//        String query = "UPDATE menu SET ORDERABLE_STATUS = 'N' WHERE menu_code =";

        /* 설명. 2. hard delete*/
        String query = "DELETE FROM menu WHERE menu_code = ?";


        try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1,3);

            result = pstmt.executeUpdate();
            if (result>0) {
                System.out.println("delete 성공");
                commit(con);

            } else {
                System.out.println("delete 실패");
                rollback(con);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close(pstmt);
            close(con);
        }


    }
}
