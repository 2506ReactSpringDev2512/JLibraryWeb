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
 * Servlet implementation class ManageAddNoticeServlet
 */
@WebServlet("/notice/add")
public class ManageAddNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private NoticeService noticeService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageAddNoticeServlet() {
        super();
        this.noticeService = new NoticeService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeAdd.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// 공지사항 등록 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼에서 전달받은 데이터 처리
		String noticeSubject = request.getParameter("noticeSubject");
		String noticeContent = request.getParameter("noticeContent");
		String noticeWriter = request.getParameter("noticeWriter");
		String noticeDate = request.getParameter("noticeDate");
		
		if(noticeSubject == null || noticeSubject.trim().isEmpty()) {
			request.setAttribute("errorMessage", "제목을 입력해주세요");
			request.getRequestDispatcher("/WEB-INF/views/notice/noticeAdd.jsp")
            .forward(request, response);
			return;
		}
		
		if(noticeContent == null || noticeContent.trim().isEmpty()) {
			request.setAttribute("errorMessage", "내용을 입력해주세요");
			request.getRequestDispatcher("/WEB-INF/views/notice/noticeAdd.jsp")
            .forward(request, response);
			return;
		}
		
		if(noticeDate == null || noticeDate.trim().isEmpty()) {
			// 날짜가 없으면 현재 날짜로 세팅
			noticeDate = java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		}
		
		
		noticeWriter = "관리자";
		
		// Notice 객체 생성
		Notice notice = new Notice();
		notice.setNoticeSubject(noticeSubject.trim());
		notice.setNoticeContent(noticeContent.trim());
		notice.setNoticeWriter(noticeWriter.trim());
		 
		// 공지사항 등록
		int result = noticeService.insertNotice(notice);
		
		
		if(result > 0) {
			// 성공 시 공지사항 목록으로 리다이렉트
			response.sendRedirect(request.getContextPath() + "/notice?message=success");
		} else {
			// 실패 시 오류 메시지와 함께 작성 페이지로 다시 이동
			request.setAttribute("errorMessage", "공지사항 등록에 실패했습니다.");
			request.setAttribute("noticeSubject", noticeSubject);
			request.setAttribute("noticeContent", noticeContent);
			request.setAttribute("noticeWriter", noticeWriter);
			request.getRequestDispatcher("/WEB-INF/views/notice/noticeAdd.jsp")
			.forward(request, response);
			
		}
		
	}

}
