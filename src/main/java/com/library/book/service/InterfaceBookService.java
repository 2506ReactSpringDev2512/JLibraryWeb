package com.library.book.service;

import java.util.List;

import com.library.book.vo.Book;

public interface InterfaceBookService {
	public List<Book> searchBooks(String searchType, String keyword, int page, String sortBy, String order);
	public int getTotalPages(String searchType, String keyword);
	public int[] getPageRange(int currentPage, int totalPages);
}
