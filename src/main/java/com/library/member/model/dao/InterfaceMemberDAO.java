package com.library.member.model.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.library.member.model.vo.Member;

public interface InterfaceMemberDAO {
	public Member checkLogin(Member member, Connection conn) throws SQLException;
}
