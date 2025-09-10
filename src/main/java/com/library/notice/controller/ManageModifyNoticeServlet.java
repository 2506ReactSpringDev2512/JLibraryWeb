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
 * Servlet implementation class ManageModifyNoticeServlet
 */
@WebServlet("/notice/modify")
public class ManageModifyNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NoticeService noticeService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageModifyNoticeServlet() {
        super();
        this.noticeService = new NoticeService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라미터로 공지번호 받기
	    String noticeNoParam = request.getParameter("noticeNo");
	    if (noticeNoParam == null || noticeNoParam.trim().isEmpty()) {
	        response.sendRedirect(request.getContextPath() + "/notice?message=invalid");
	        return;
	    }

	    int noticeNo = Integer.parseInt(noticeNoParam);

	    // 2. 공지 상세 조회
	    Notice notice = noticeService.selectNoticeByNo(noticeNo);

	    // 3. 조회된 공지를 request에 담아서 수정 페이지로 포워딩
	    if (notice != null) {
	        request.setAttribute("notice", notice);
	        request.getRequestDispatcher("/WEB-INF/views/notice/noticeModify.jsp")
	               .forward(request, response);
	    } else {
	        request.setAttribute("errorMessage", "수정할 공지사항을 찾을 수 없습니다.");
	        request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
	               .forward(request, response);
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	    String subject = request.getParameter("noticeSubject");
	    String content = request.getParameter("noticeContent");
	    // 작성자는 readonly니까 그대로 두거나 세션에서 가져와도 됨

	    Notice notice = new Notice();
	    notice.setNoticeNo(noticeNo);
	    notice.setNoticeSubject(subject);
	    notice.setNoticeContent(content);

	    int result = noticeService.updateNotice(notice);

	    if (result > 0) {
	        response.sendRedirect(request.getContextPath() + "/notice/detail?noticeNo=" + noticeNo);
	    } else {
	        request.setAttribute("errorMessage", "공지 수정 실패");
	        request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
	    }
	}

}
