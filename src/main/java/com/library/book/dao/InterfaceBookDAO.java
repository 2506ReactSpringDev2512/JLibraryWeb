package com.library.book.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.library.book.vo.Book;

public interface InterfaceBookDAO {
	public List<Book> searchBooks(String searchType, String keyword, int offset, int limit, String sortBy,
			String order, Connection conn) throws SQLException;
	public int getTotalItems(String searchType, String keyword, Connection conn) throws SQLException;
}
