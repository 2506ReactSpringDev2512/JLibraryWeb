package com.library.lend.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LendInfoDAO implements InterfaceLendInfoDAO{

	public boolean updateLendStatus(String userId, int bookNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;

        // 1. 대출 상태를 'Y'로 업데이트
        String updateQuery = "UPDATE BOOK_TBL SET LEND_YN = '대여불가' WHERE book_no = ?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setInt(1, bookNo);
        result = pstmt.executeUpdate();

        // 2. 대출 기록을 lend_history 테이블에 추가
        if (result > 0) {
            String insertQuery = "INSERT INTO LENDINFO_TBL VALUES (?, ?, DEFAULT, DEFAULT)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, userId);
            pstmt.setInt(2, bookNo);
            pstmt.executeUpdate();
        }

        return result > 0;
	}

}
