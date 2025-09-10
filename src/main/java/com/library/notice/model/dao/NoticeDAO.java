package com.library.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.library.notice.model.vo.Notice;

public class NoticeDAO implements InterfaceNoticeDAO{

	public int selectCount(Connection conn, String query) throws SQLException {
		int count = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = "SELECT COUNT(*) AS cnt FROM NOTICE_TBL";
        if(query != null && !query.trim().isEmpty()) {
            sql += " WHERE notice_subject LIKE ? OR notice_writer LIKE ?";
        }

        pstmt = conn.prepareStatement(sql);

        if(query != null && !query.trim().isEmpty()) {
            pstmt.setString(1, "%" + query + "%");
            pstmt.setString(2, "%" + query + "%");
        }

        rset = pstmt.executeQuery();
        if(rset.next()) {
            count = rset.getInt("cnt");
        }

        rset.close();
        pstmt.close();
        return count;
	}

	public List<Notice> selectList(Connection conn, String query, int startRow, int endRow) throws SQLException {
		List<Notice> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        // 하위 쿼리에 alias n 추가
        String sql = "SELECT * FROM (" +
                     " SELECT ROW_NUMBER() OVER(ORDER BY n.notice_no DESC) AS rnum, n.* FROM NOTICE_TBL n";

        if(query != null && !query.trim().isEmpty()) {
            sql += " WHERE n.notice_subject LIKE ? OR n.notice_writer LIKE ?";
        }
        sql += " ) WHERE rnum BETWEEN ? AND ?";

        pstmt = conn.prepareStatement(sql);

        int idx = 1;
        if(query != null && !query.trim().isEmpty()) {
            pstmt.setString(idx++, "%" + query + "%");
            pstmt.setString(idx++, "%" + query + "%");
        }

        pstmt.setInt(idx++, startRow);
        pstmt.setInt(idx++, endRow);

        rset = pstmt.executeQuery();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        while(rset.next()) {
            Notice n = new Notice();
            n.setNoticeNo(rset.getInt("notice_no"));
            n.setNoticeSubject(rset.getString("notice_subject"));
            n.setNoticeContent(rset.getString("notice_content"));
            n.setNoticeWriter(rset.getString("notice_writer"));

            // ✅ null 체크 추가
            Date date = rset.getDate("notice_date");
            if (date != null) {
                n.setNoticeDate(sdf.format(date));
            } else {
                n.setNoticeDate("날짜 없음"); // 또는 "", null 등
            }
            
            
//            // Date → String 변환
//            n.setNoticeDate(sdf.format(rset.getDate("notice_date")));

            n.setViewCount(rset.getInt("view_count"));
            list.add(n);
        }

        rset.close();
        pstmt.close();

        return list;
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

	public Notice selectNoticeByNo(int noticeNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM NOTICE_TBL WHERE NOTICE_NO = ?";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, noticeNo);
		
		rset = pstmt.executeQuery();
		
		Notice notice = null;
		if(rset.next()) {
			notice = new Notice();
			notice.setNoticeNo(rset.getInt("notice_no"));
			notice.setNoticeSubject(rset.getString("notice_subject"));
			notice.setNoticeWriter(rset.getString("notice_writer"));
			// ✅ 날짜 포맷 지정 (yyyy-MM-dd)
		    java.sql.Date date = rset.getDate("notice_date");
		    if (date != null) {
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        notice.setNoticeDate(sdf.format(date));
		    } else {
		        notice.setNoticeDate("날짜 없음");
		    }
//			notice.setNoticeDate(rset.getString("notice_date"));
			notice.setNoticeContent(rset.getString("notice_content"));
			notice.setViewCount(rset.getInt("view_count"));
		}
		
		rset.close();
		pstmt.close();
		
		return notice;
	}

	public int updateNotice(Notice notice, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE NOTICE_TBL SET NOTICE_SUBJECT = ?, NOTICE_CONTENT = ? WHERE NOTICE_NO = ?";
		
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1, notice.getNoticeSubject());
		pstmt.setString(2, notice.getNoticeContent());
		pstmt.setInt(3, notice.getNoticeNo());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}

}
