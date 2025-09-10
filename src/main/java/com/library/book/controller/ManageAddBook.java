package com.library.book.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.book.service.BookService;
import com.library.book.vo.Book;

/**
 * Servlet implementation class manageAddBook
 */
@WebServlet("/add-book")
public class ManageAddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageAddBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/manageAddBook.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        
        int bookNo = Integer.parseInt(request.getParameter("bookNo"));
        String titleName = request.getParameter("titleName");
        String authrName = request.getParameter("authrName");
        String publisherName = request.getParameter("publisherName");
        String prcValue = request.getParameter("prcValue");
        String bookIntcn = request.getParameter("bookIntcn");
        
        Book book = new Book();
        book.setBook_no(bookNo);
        book.setTitle_nm(titleName);
        book.setAuthr_nm(authrName);
        book.setPublisher_nm(publisherName);
        book.setPrc_value(prcValue);
        book.setBook_intrcn_cn(bookIntcn);
        
        BookService bService = new BookService();

        try {
            bService.addBook(book);
            response.sendRedirect(request.getContextPath() + "/search"); // 목록 페이지로 이동
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "도서 추가 실패");
            request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
        }
	}

}
