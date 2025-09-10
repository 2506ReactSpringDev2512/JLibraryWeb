package com.library.lend.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.lend.model.dao.LendInfoDAO;
import com.library.lend.model.vo.LendInfo;

public class LendInfoService implements InterfaceLendInfoService{

	private LendInfoDAO lendDao;
	private JDBCTemplate jdbcTemplate;
	
	public LendInfoService(){
		lendDao = new LendInfoDAO();
		jdbcTemplate = JDBCTemplate.getInstance();
	}
	
	public boolean lendBook(String userId, int bookNo) {
		Connection conn = null;
        boolean isSuccess = false;

        try {
            conn = jdbcTemplate.getConnection();
            isSuccess = lendDao.updateLendStatus(userId, bookNo, conn);
            if (isSuccess) {
            	JDBCTemplate.commit(conn); // 커밋
            } else {
            	JDBCTemplate.rollback(conn); // 롤백
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCTemplate.rollback(conn); // 예외 발생 시 롤백
        } finally {
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
        }

        return isSuccess;
	}

	public List<LendInfo> getLendInfoList(String memberId, int currentPage, int pageSize) {
		List<LendInfo> list = null;
        try (Connection conn = jdbcTemplate.getConnection()) {
            list = lendDao.selectLendInfoList(memberId, currentPage, pageSize, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
	}

	public int getLendInfoTotalCount(String memberId) {
		int total = 0;
        try (Connection conn = jdbcTemplate.getConnection()) {
            total = lendDao.getLendInfoCount(memberId, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
	}

	public boolean extendBook(String memberId, int bookNo) {
		Connection conn = null;
        boolean result = false;

        try {
            conn = jdbcTemplate.getConnection(); // Service에서 Connection
            int updated = lendDao.updateReturnDate(conn, memberId, bookNo);

            if(updated > 0) {
            	JDBCTemplate.commit(conn);
                result = true;
            } else {
            	JDBCTemplate.rollback(conn);
            }
        } catch(Exception e) {
        	JDBCTemplate.rollback(conn);
            e.printStackTrace();
        }
        

        return result;
	}

	public boolean returnBook(int bookNo) {
		try (Connection conn = jdbcTemplate.getConnection()) {
            // 1. 대출 정보 삭제
            boolean deleteResult = lendDao.deleteLend(conn, bookNo);
            // 2. 책 상태 업데이트
            boolean updateResult = lendDao.updateBookLendStatus(conn, bookNo, "대여가능");

            if(deleteResult && updateResult) {
                JDBCTemplate.commit(conn);
                return true;
            } else {
                JDBCTemplate.rollback(conn);
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}


}
