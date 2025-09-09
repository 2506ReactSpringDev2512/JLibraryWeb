package com.library.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.notice.model.vo.Notice;

public class NoticeDAO implements InterfaceNoticeDAO{

	// 전체 공지사항 목록 조회
	public List<Notice> selectAllNotices(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM NOTICE_TBL";
		
		pstmt = conn.prepareStatement(query);
		rset = pstmt.executeQuery();
		
		List<Notice> nList = new ArrayList<>();
		
		while(rset.next()) {
			Notice notice = new Notice();
			notice.setNoticeNo(rset.getInt("NOTICE_NO"));
			notice.setNoticeSubject(rset.getString("NOTICE_SUBJECT"));
			notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
			notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
			notice.setNoticeDate(rset.getString("NOTICE_DATE"));
			notice.setViewCount(rset.getInt("VIEW_COUNT"));
			
			nList.add(notice);
		}

		return nList;
	}
	
	public List<Notice> searchNotices(String query, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Notice> nList = new ArrayList<>();
		
//		String query = "SELECT * FROM NOTICE_TBL";
	
		return null;
	}
	
	public int insertNotice(Notice notice, Connection conn) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO NOTICE_TBL (NOTICE_NO, NOTICE_SUBJECT, NOTICE_WRITER, NOTICE_DATE, NOTICE_CONTENT)" + "VALUES (NOTICE_SEQ.NEXTVAL, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, notice.getNoticeSubject());
		pstmt.setString(2, notice.getNoticeWriter());
		pstmt.setString(3, notice.getNoticeDate());
		pstmt.setString(4, notice.getNoticeContent());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}




}
