package com.library.lend.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.library.common.JDBCTemplate;
import com.library.lend.model.dao.LendInfoDAO;

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

}
