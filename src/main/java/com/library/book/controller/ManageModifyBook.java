package com.library.book.controller;

import java.io.IOException;

import com.library.book.service.BookService;
import com.library.book.vo.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class manageModifyBook
 */
@WebServlet("/modify-book")
public class ManageModifyBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BookService bookService = new BookService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageModifyBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookNoParam = request.getParameter("book_no");
		if (bookNoParam == null || bookNoParam.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/search?message=invalidBookNo");
			return;
		}
		
		int bookNo = Integer.parseInt(bookNoParam);
		Book book = bookService.selectBookByNo(bookNo);
		
		if(book == null) {
			request.setAttribute("errorMessage", "존재하지 않는 도서입니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
			return;
		}
		
		request.setAttribute("book", book);
		request.getRequestDispatcher("/WEB-INF/views/admin/manageModifyBook.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookNo = Integer.parseInt(request.getParameter("book_no"));
        String titleNm = request.getParameter("title_nm");
        String authrNm = request.getParameter("authr_nm");
        String publisherNm = request.getParameter("publisher_nm");
        String prcValue = request.getParameter("prc_value");
        String isbnThirteenNo = request.getParameter("isbn_thirteen_no");
        String bookIntrcnCn = request.getParameter("book_intrcn_cn");

        Book book = new Book();
        book.setBook_no(bookNo);
        book.setTitle_nm(titleNm);
        book.setAuthr_nm(authrNm);
        book.setPublisher_nm(publisherNm);
        book.setPrc_value(prcValue);
        book.setIsbn_thirteen_no(isbnThirteenNo);
        book.setBook_intrcn_cn(bookIntrcnCn);

        int result = bookService.updateBook(book);
        
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/bookinfo?bookNo=" + bookNo);
        } else {
            request.setAttribute("errorMessage", "도서 수정에 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
        }
	}

}
