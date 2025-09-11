package com.library.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.member.model.vo.Member;

public class MemberDAO implements InterfaceMemberDAO{

	public Member checkLogin(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member mOne = null;
		String query = "SELECT * FROM MEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPwd());
		rset = pstmt.executeQuery();
		if(rset.next()) {
			mOne = rsetToMember(rset);
		}
		rset.close();
		pstmt.close();
		conn.close();
		System.out.println(mOne);
 		return mOne;
	}
	
	private Member rsetToMember(ResultSet rset) throws SQLException {
		String memberId   = rset.getString("MEMBER_ID");
		String memberPwd  = rset.getString("MEMBER_PW");
		String memberName = rset.getString("MEMBER_NAME");
		String phone	  = rset.getString("MEMBER_PHONE");
		String gender	  = rset.getString("MEMBER_GENDER");
		int age			  = rset.getInt("MEMBER_AGE");
		String adminYn 	  = rset.getString("ADMIN_YN");
		Member member = new Member(memberId, memberPwd, memberName, gender, phone, age, adminYn);
		return member;
	}

	public int insertMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO MEMBER_TBL VALUES(?, ?, ?, ?, ?, ?, DEFAULT)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getMemberId());
		pstmt.setString(2, member.getMemberPwd());
		pstmt.setString(3, member.getMemberName());
		pstmt.setString(5, member.getGender());
		pstmt.setString(4, member.getPhone());
		pstmt.setInt(6, member.getAge());
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}

	public List<Member> selectMemberList(String searchType, String searchKeyword, int currentPage, int pageSize,
			Connection conn) throws SQLException {
		List<Member> list = new ArrayList<>();
	    
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;

	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT * FROM ( ")
	       .append("  SELECT ROWNUM AS rnum, m.*, ")
	       .append("         (SELECT COUNT(*) FROM LENDINFO_TBL l WHERE l.MEMBER_ID = m.MEMBER_ID) AS lend_count, ")
	       .append("         (SELECT COUNT(*) FROM LENDINFO_TBL l WHERE l.MEMBER_ID = m.MEMBER_ID AND l.RETURN_DATE < SYSDATE) AS overdue_count ")
	       .append("  FROM MEMBER_TBL m ");

	    if(searchKeyword != null && !searchKeyword.isEmpty()) {
	        if("id".equals(searchType)) {
	            sql.append("WHERE m.MEMBER_ID LIKE ? ");
	        } else if("name".equals(searchType)) {
	            sql.append("WHERE m.MEMBER_NAME LIKE ? ");
	        }
	    }

	    sql.append("  ORDER BY m.MEMBER_ID ")
	       .append(") ")
	       .append("WHERE rnum BETWEEN ? AND ?");

	    try (PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
	        int idx = 1;
	        if(searchKeyword != null && !searchKeyword.isEmpty()) {
	            pstmt.setString(idx++, "%" + searchKeyword + "%");
	        }
	        pstmt.setInt(idx++, startRow);
	        pstmt.setInt(idx++, endRow);

	        try (ResultSet rs = pstmt.executeQuery()) {
	            while(rs.next()) {
	                Member m = new Member();
	                m.setMemberId(rs.getString("member_id"));
	                m.setMemberName(rs.getString("member_name"));
	                m.setPhone(rs.getString("member_phone"));
	                m.setGender(rs.getString("member_gender"));
	                m.setAge(rs.getInt("member_age"));
	                m.setAdminYn(rs.getString("admin_yn"));
	                m.setLendCount(rs.getInt("lend_count"));
	                m.setOverdueCount(rs.getInt("overdue_count"));
	                list.add(m);
	            }
	        }
	    }

	    return list;
	}

	public int getMemberCount(String searchType, String searchKeyword, Connection conn) throws SQLException {
		StringBuilder sql = new StringBuilder();
	    sql.append("SELECT COUNT(*) AS total FROM MEMBER_TBL m ");

	    if(searchKeyword != null && !searchKeyword.isEmpty()) {
	        if("id".equals(searchType)) {
	            sql.append("WHERE m.MEMBER_ID LIKE ? ");
	        } else if("name".equals(searchType)) {
	            sql.append("WHERE m.MEMBER_NAME LIKE ? ");
	        }
	    }

	    try (PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
	        if(searchKeyword != null && !searchKeyword.isEmpty()) {
	            pstmt.setString(1, "%" + searchKeyword + "%");
	        }
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if(rs.next()) {
	                return rs.getInt("total");
	            }
	        }
	    }
	    return 0;
	}

	
	public int modifyMember(Member member, Connection conn) throws SQLException {
		String query = "UPDATE MEMBER_TBL SET MEMBER_PW = ?, MEMBER_PHONE = ? WHERE MEMBER_ID = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setString(1, member.getMemberPwd());
	        pstmt.setString(2, member.getPhone());
	        pstmt.setString(3, member.getMemberId());
	        return pstmt.executeUpdate();
	    }
	}

	public String selectPassword(Connection conn, String memberId, String memberName, String memberPhone) throws SQLException {
		String pwd = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT MEMBER_PW FROM MEMBER_TBL WHERE MEMBER_ID=? AND MEMBER_NAME=? AND MEMBER_PHONE=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            pstmt.setString(2, memberName);
            pstmt.setString(3, memberPhone);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                pwd = rs.getString("MEMBER_PW");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pstmt.close();
        conn.close();
        return pwd;
	}

	public int selectLendCount(Connection conn, String memberId) throws SQLException {
		String sql = "SELECT COUNT(*) AS CNT FROM LENDINFO_TBL WHERE MEMBER_ID=?";
        int count = 0;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    count = rs.getInt("CNT");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
	}

	public int deleteMember(Connection conn, String memberId) throws SQLException {
		String sql = "DELETE FROM MEMBER_TBL WHERE MEMBER_ID=?";
        int result = 0;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
	}

	public int selectOngoingLendCount(Connection conn, String memberId) throws SQLException {
		String sql = "SELECT COUNT(*) FROM LENDINFO_TBL WHERE MEMBER_ID = ? AND RETURN_DATE >= SYSDATE";
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, memberId);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1); // 대출 중인 도서 수
	        }
	    }
	    return 0;
	}

	public Member selectMemberById(Connection conn, String memberId) {
		 Member member = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = "SELECT MEMBER_ID, MEMBER_NAME, MEMBER_GENDER, MEMBER_AGE, MEMBER_PHONE FROM MEMBER_TBL WHERE MEMBER_ID = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            rset = pstmt.executeQuery();
            if(rset.next()) {
                member = new Member(
                		rset.getString("MEMBER_ID"),
                		rset.getString("MEMBER_NAME"),
                		rset.getString("MEMBER_GENDER"),
                		rset.getInt("MEMBER_AGE"),
                		rset.getString("MEMBER_PHONE")
                );
            }
	        } catch(Exception e) { e.printStackTrace(); }
	        finally {
	            try { if(rset != null) rset.close(); } catch(Exception e) {}
	            try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
	        }
	        return member;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
        PreparedStatement pstmt = null;
        String sql = "UPDATE MEMBER_TBL SET MEMBER_GENDER = ?, MEMBER_AGE = ?, MEMBER_PHONE = ? WHERE MEMBER_ID = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getGender());
            pstmt.setInt(2, member.getAge());
            pstmt.setString(3, member.getPhone());
            pstmt.setString(4, member.getMemberId());
            result = pstmt.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
        finally {
            try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
        }
        return result;
	}

	


}
