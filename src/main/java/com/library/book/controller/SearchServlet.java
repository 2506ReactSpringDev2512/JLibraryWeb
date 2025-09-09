package com.library.book.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.book.service.BookService;
import com.library.book.vo.Book;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
        String keyword = request.getParameter("keyword");

        int page = 1;
        String pageParam = request.getParameter("page");

        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        if (searchType == null || searchType.trim().isEmpty()) {
        	searchType = "title_nm";  // 기본값 설정
        }
        
        String sortBy = request.getParameter("sortBy") != null ? request.getParameter("sortBy") : "title_nm";
        String order = request.getParameter("order") != null ? request.getParameter("order") : "asc";

        BookService bookService = new BookService();
        List<Book> books = bookService.searchBooks(searchType, keyword, page, sortBy, order);
        int totalPages = bookService.getTotalPages(searchType, keyword);
        int totalItems = bookService.getTotalItems(searchType, keyword);  // totalItems 값 확인
        
        System.out.println("Total Items: " + totalItems);

        // 페이지 범위 계산
        int[] pageRange = bookService.getPageRange(page, totalPages);
        int startPage = pageRange[0];
        int endPage = pageRange[1];
        
        System.out.println("Total Pages: " + totalPages);
        System.out.println("Current Page: " + page);
        System.out.println("Books size: " + books.size());

        
        request.setAttribute("books", books);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalItems", totalItems);
        request.setAttribute("page", page);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("searchType", searchType);
        request.setAttribute("keyword", keyword);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("order", order);
        
        System.out.println("Search Type: " + searchType);  // 추가된 로그
        System.out.println("Keyword: " + keyword);  // 추가된 로그

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/book/search.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
