package com.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.lend.model.service.LendInfoService;

/**
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
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
		 int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		 LendInfoService lendService = new LendInfoService();
	     boolean result = lendService.returnBook(bookNo);
	
	     if(result) {
	         response.setStatus(HttpServletResponse.SC_OK);
	     } else {
	         response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	     }
	}

}
