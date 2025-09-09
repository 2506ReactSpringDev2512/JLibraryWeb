package com.library.notice.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.notice.model.dao.NoticeDAO;
import com.library.notice.model.vo.Notice;

public class NoticeService implements InterfaceNoticeService{
	private JDBCTemplate jdbcTemplate;
	private NoticeDAO nDao;
	
	public NoticeService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		nDao = new NoticeDAO();
	}

	public int getNoticeCount(String query) {
		Connection conn = null;
	    int count = 0;

	    try {
	        conn = jdbcTemplate.getConnection();
	        count = nDao.selectCount(conn, query);
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if(conn != null) conn.close(); } catch(Exception e) {}
	    }

	    return count;
	}

	public List<Notice> getNoticeList(String query, int page, int limit) {
        Connection conn = null;
        List<Notice> list = null;

        try {
            conn = jdbcTemplate.getConnection();
            int startRow = (page - 1) * limit + 1;
            int endRow = startRow + limit - 1;
            list = nDao.selectList(conn, query, startRow, endRow);
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }

        return list;
	}

}
