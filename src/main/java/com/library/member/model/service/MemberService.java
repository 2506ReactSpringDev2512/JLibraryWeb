package com.library.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.library.common.JDBCTemplate;
import com.library.member.model.dao.MemberDAO;
import com.library.member.model.vo.Member;

public class MemberService implements InterfaceMemberService{
	
	private JDBCTemplate jdbcTemplate;
	private MemberDAO mDao;
	
	public MemberService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		mDao = new MemberDAO();
	}

	@Override
	public Member checkLogin(Member member) {
		Member mOne = null;
		try {
			Connection conn = jdbcTemplate.getConnection();
			mOne = mDao.checkLogin(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mOne;
	}

	public int insertMember(Member member) {
		int result = 0;
		Connection conn = jdbcTemplate.getConnection();
		try {
			result = mDao.insertMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int modifyMember(Member member) {
		int result = 0;
		try {
			Connection conn = jdbcTemplate.getConnection();
			result = mDao.modifyMember(member, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int modifyMember(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}



}
