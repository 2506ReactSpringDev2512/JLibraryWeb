package com.library.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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

	public List<Member> getMemberList(String searchType, String searchKeyword, int currentPage, int pageSize) {
		List<Member> list = null;
	    try (Connection conn = jdbcTemplate.getConnection()) {
	        list = mDao.selectMemberList(searchType, searchKeyword, currentPage, pageSize, conn);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public int getMemberTotalCount(String searchType, String searchKeyword) {
		int total = 0;
	    try (Connection conn = jdbcTemplate.getConnection()) {
	        total = mDao.getMemberCount(searchType, searchKeyword, conn);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return total;
	}

	

}
