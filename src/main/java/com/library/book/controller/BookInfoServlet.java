package com.library.book.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.book.service.BookService;
import com.library.book.vo.Book;

/**
 * Servlet implementation class bookInfoServlet
 */
@WebServlet("/bookinfo")
public class BookInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookNoParam = request.getParameter("bookNo");
        int bookNo = 0;
        if(bookNoParam != null && !bookNoParam.isEmpty()) {
            try {
                bookNo = Integer.parseInt(bookNoParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        BookService bookService = new BookService();
        Book book = bookService.getBookByNo(bookNo);

        request.setAttribute("book", book);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/book/bookInfo.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
