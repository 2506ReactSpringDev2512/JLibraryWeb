package com.library.notice.model.service;

import java.sql.Connection;
import java.sql.SQLException;
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

	public List<Notice> getAllNotices() {
		List<Notice> nList = null;
		try {
			Connection conn = jdbcTemplate.getConnection();
			nList = nDao.selectAllNotices(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Notice> searchNotices(String query) {
		List<Notice> nList = null;
		Connection conn = jdbcTemplate.getConnection();
		nList = nDao.searchNotices(query, conn);
		
		return null;
	}

	public int insertNotice(Notice notice) {
		int result = 0;
		
		try {
			Connection conn = jdbcTemplate.getConnection();
			result = nDao.insertNotice(notice, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}


}
