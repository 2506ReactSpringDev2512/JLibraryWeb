package com.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.library.book.service.BookService;
import com.library.book.vo.Book;
import com.library.lend.model.service.LendInfoService;

/**
 * Servlet implementation class LendServlet
 */
@WebServlet("/lend")
public class LendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("memberId");

        response.setContentType("text/plain;charset=UTF-8");

        if (memberId == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("로그인이 필요합니다.");
            return;
        }

        int bookNo = Integer.parseInt(request.getParameter("bookNo"));

        BookService bookService = new BookService();
        Book book = bookService.getBookByNo(bookNo);

        if (book == null || book.getLend_yn().equals("대여불가")) {
            response.getWriter().write("대출 불가");
            return;
        }

        LendInfoService lendService = new LendInfoService();
        boolean success = lendService.lendBook(memberId, bookNo);

        if (success) {
            response.getWriter().write("대출 성공!");
        } else {
            response.getWriter().write("대출 실패");
        }
    }
	

}
