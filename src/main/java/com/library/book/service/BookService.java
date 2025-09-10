package com.library.book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.book.dao.BookDAO;
import com.library.book.vo.Book;
import com.library.common.JDBCTemplate;

public class BookService implements InterfaceBookService {
	private JDBCTemplate jdbcTemplate;
	private BookDAO bDao;
	
	public BookService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		bDao = new BookDAO();
	}

	// 책 검색(페이지네이션)
	public List<Book> searchBooks(String searchType, String keyword, int page, String sortBy, String order) {
		int itemsPerPage = 10;  // 한 페이지당 도서 수
        int offset = (page - 1) * itemsPerPage;
        
        List<Book> books = null;
        Connection conn = null;
        
        try {
        	conn = jdbcTemplate.getConnection();
			books = bDao.searchBooks(searchType, keyword, offset, itemsPerPage, sortBy, order, conn);// 책 검색
		} catch (SQLException e) {
			e.printStackTrace();
		}  
        
		return books;
	}

	public int getTotalPages(String searchType, String keyword) {
		int itemsPerPage = 10;  // 한 페이지당 도서 수
        int totalItems = 0; 
        Connection conn = null;
        
        try {
        	conn = jdbcTemplate.getConnection();  // DB 연결
			totalItems = bDao.getTotalItems(searchType, keyword, conn); // 전체 도서 수 조회
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		return (int) Math.ceil((double) totalItems / itemsPerPage);
	}
	
	public int[] getPageRange(int currentPage, int totalPages) {
	    int range = 5; // 페이지 버튼을 몇 개까지 보여줄지 결정
	    int startPage = Math.max(1, currentPage - range); // 시작 페이지
	    int endPage = Math.min(totalPages, currentPage + range); // 끝 페이지

	    return new int[]{startPage, endPage};
	}

	public int getTotalItems(String searchType, String keyword) {
		int totalItems = 0;
        Connection conn = null;

        try {
            conn = jdbcTemplate.getConnection();  // DB 연결
            totalItems = bDao.getTotalItems(searchType, keyword, conn);  // 전체 도서 수 조회
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalItems;
	}
	
	public Book getBookByNo(int bookNo) {
		Connection conn = null;
	    Book book = null;

	    try {
	        conn = jdbcTemplate.getConnection();
	        book = bDao.getBookById(bookNo, conn);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (conn != null) try { conn.close(); } catch(SQLException e) {}
	    }

	    return book;
	}

	public boolean deleteBook(int bookNo) {
		Connection conn = null;
        boolean result = false;

        try {
            conn = jdbcTemplate.getConnection();
            int rows = bDao.deleteBook(conn, bookNo);

            if(rows > 0) {
                JDBCTemplate.commit(conn);
                result = true;
            } else {
                JDBCTemplate.rollback(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCTemplate.rollback(conn);
        }

        return result;
	}

	public void addBook(Book book) throws SQLException {
		Connection conn = null;
	    try {
	        conn = jdbcTemplate.getConnection();
	        conn.setAutoCommit(false);

	        int result = bDao.insertBook(conn, book);

	        if(result > 0) conn.commit();
	        else conn.rollback();
	    } catch(SQLException e) {
	        if(conn != null) conn.rollback(); // 예외 발생 시 롤백
	        throw e; // 호출한 쪽으로 예외 던지기
	    } finally {
	        if(conn != null) conn.close(); // 리소스 반환
	    }
	}


}
