package com.library.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	public int modifyMember(Member member, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE MEMBER_TBL SET MEMBER_PWD=?, PHONE=?";
		pstmt = conn.prepareStatement(query);
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}

	


}
