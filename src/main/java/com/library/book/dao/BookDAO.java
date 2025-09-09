package com.library.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.book.vo.Book;
import com.library.common.JDBCTemplate;

public class BookDAO implements InterfaceBookDAO{
	private JDBCTemplate jdbcTemplate;
	
	public BookDAO() {
        jdbcTemplate = JDBCTemplate.getInstance();
    }

	public List<Book> searchBooks(String searchType, String keyword, int offset, int limit, String sortBy,
			String order, Connection conn) throws SQLException {
		List<Book> books = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    // searchType이 null인 경우 기본값을 'title_nm'으로 설정
	    if (searchType == null || searchType.trim().isEmpty()) {
	        searchType = "title_nm"; // 기본값 설정
	    }
	    
	    // Oracle에서 OFFSET과 FETCH를 사용한 페이지네이션 쿼리
	    String query = "SELECT * FROM BOOK_TBL WHERE " + searchType + " LIKE ? ORDER BY " + sortBy + " " + order
	             + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    pstmt = conn.prepareStatement(query);
	    pstmt.setString(1, "%" + keyword + "%");
	    pstmt.setInt(2, offset);  // 시작 인덱스
	    pstmt.setInt(3, limit);   // 한 번에 가져올 데이터 개수 (limit)

	    rset = pstmt.executeQuery();
	    while (rset.next()) {
	        Book book = new Book();
	        book.setBook_no(rset.getInt("book_no"));
	        book.setTitle_nm(rset.getString("title_nm"));
	        book.setAuthr_nm(rset.getString("authr_nm"));
	        book.setPublisher_nm(rset.getString("publisher_nm"));
	        book.setImage_url(rset.getString("image_url"));
	        book.setLend_yn(rset.getString("lend_yn"));
	        books.add(book);
	    }
        rset.close();
		pstmt.close();
		return books;
	}

	public int getTotalItems(String searchType, String keyword, Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    int totalItems = 0;

	    // searchType이 null인 경우 기본값을 'title_nm'으로 설정
	    if (searchType == null || searchType.trim().isEmpty()) {
	        searchType = "title_nm"; // 기본값 설정
	    }

	    String query = "SELECT COUNT(*) FROM BOOK_TBL WHERE " + searchType + " LIKE ?";
	    try {
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, "%" + keyword + "%");
	        rset = pstmt.executeQuery();
	        if (rset.next()) {
	            totalItems = rset.getInt(1); // COUNT(*) 값
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        totalItems = 0;
	    }
		rset.close();
		pstmt.close();
		conn.close();
		return totalItems;
	}
	
	
}
