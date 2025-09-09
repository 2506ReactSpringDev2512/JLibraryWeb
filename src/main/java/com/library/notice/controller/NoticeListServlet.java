package com.library.notice.controller;

import java.io.IOException;
import java.util.List;

import com.library.notice.model.service.NoticeService;
import com.library.notice.model.vo.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private NoticeService noticeService = new NoticeService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query = request.getParameter("query");
		if(query != null) {
			query = query.trim();
			if(query.isEmpty()) {
				query = null;
			}
		}
		
		List<Notice> noticeList;
		
		// 검색 여부에 따른 데이터 조회
		if (query != null && !query.isEmpty()) {
			// 검색 모드
			noticeList = noticeService.searchNotices(query);
		} else {
			// 전체 목록 모드
			noticeList = noticeService.getAllNotices();
		}
		
		// JSP로 전달할 데이터 설정
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("query", query);
		
		request.getRequestDispatcher("/WEB-INF/views/notice/notice.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
