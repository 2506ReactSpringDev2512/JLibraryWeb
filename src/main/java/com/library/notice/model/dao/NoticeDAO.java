package com.library.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

            // Date → String 변환
            n.setNoticeDate(sdf.format(rset.getDate("notice_date")));

            n.setViewCount(rset.getInt("view_count"));
            list.add(n);
        }

        rset.close();
        pstmt.close();

        return list;
	}

}
