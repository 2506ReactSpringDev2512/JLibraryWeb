package com.library.notice.controller;

import java.io.IOException;

import com.library.notice.model.service.NoticeService;
import com.library.notice.model.vo.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NoticeService noticeService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        this.noticeService = new NoticeService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터로 공지 번호 받기
		String noticeNoParam = request.getParameter("noticeNo");
		if (noticeNoParam == null || noticeNoParam.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/notice?message=invalid");
			return;
		}
		
		int noticeNo = Integer.parseInt(noticeNoParam);
		
		// 2. 해당 번호의 공지사항 조회
		Notice notice = noticeService.selectNoticeByNo(noticeNo);
		
		// 3. 결과 처리
		if (notice == null) {
			request.setAttribute("errorMessage", "해당 공지사항을 찾을 수 없습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
            return;
		}
		
		// 이전글, 다음글 조회
		Notice preNotice = noticeService.selectPreNoticeByNo(noticeNo);
		Notice nextNotice = noticeService.selectNextNoticeByNo(noticeNo);
		

		// 4. request에 notice 객체 저장 후 포워딩
		request.setAttribute("notice", notice);
		request.setAttribute("preNotice", preNotice);
		request.setAttribute("nextNotice", nextNotice);
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
