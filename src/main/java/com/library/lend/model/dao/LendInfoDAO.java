package com.library.lend.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.lend.model.vo.LendInfo;

public class LendInfoDAO implements InterfaceLendInfoDAO{

	public boolean updateLendStatus(String userId, int bookNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;

        // 1. 대출 상태를 'Y'로 업데이트
        String updateQuery = "UPDATE BOOK_TBL SET LEND_YN = '대여불가' WHERE BOOK_NO = ?";
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

	public List<LendInfo> selectLendInfoList(String memberId, int currentPage, int pageSize, Connection conn) throws SQLException {
		List<LendInfo> list = new ArrayList<>();
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;

        String sql = "SELECT * FROM (" +
                "  SELECT ROWNUM AS rnum, a.* FROM (" +
                "    SELECT l.*, " +
                "           b.TITLE_NM AS title_nm, " +
                "           b.AUTHR_NM AS author, " +
                "           b.PUBLISHER_NM AS publisher " +
                "    FROM LENDINFO_TBL l " +
                "    JOIN BOOK_TBL b ON l.BOOK_NO = b.BOOK_NO " +
                "    WHERE l.MEMBER_ID = ? " +
                "    ORDER BY l.LEND_DATE DESC" +
                "  ) a" +
                ") WHERE rnum BETWEEN ? AND ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                	LendInfo info = new LendInfo();
                    info.setMemberId(rs.getString("MEMBER_ID"));
                    info.setBook_no(rs.getInt("BOOK_NO"));
                    info.setLend_date(rs.getDate("LEND_DATE"));
                    info.setReturn_date(rs.getDate("RETURN_DATE"));
                    info.setTitle_nm(rs.getString("title_nm"));
                    info.setAuthor(rs.getString("author"));
                    info.setPublisher(rs.getString("publisher"));
                    list.add(info);
                }
            }
        }

        return list;
	}

	public int getLendInfoCount(String memberId, Connection conn) throws SQLException {
		String sql = "SELECT COUNT(*) AS total FROM LENDINFO_TBL WHERE MEMBER_ID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        }
        return 0;
	}


	public int updateReturnDate(Connection conn, String memberId, int bookNo) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;

        String sql = "UPDATE LENDINFO_TBL " +
                     "SET RETURN_DATE = SYSDATE + 7 " +
                     "WHERE MEMBER_ID = ? AND BOOK_NO = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            pstmt.setInt(2, bookNo);
            result = pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } 
        pstmt.close();
        conn.close();

        return result;
	}

	public boolean deleteLend(Connection conn, int bookNo) {
		String sql = "DELETE FROM LENDINFO_TBL WHERE BOOK_NO = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, bookNo);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
	}

	public boolean updateBookLendStatus(Connection conn, int bookNo, String status) {
		String sql = "UPDATE BOOK_TBL SET LEND_YN = ? WHERE BOOK_NO = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, bookNo);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
	}

}
