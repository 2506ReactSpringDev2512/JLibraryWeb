package com.library.notice.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.notice.model.service.NoticeService;
import com.library.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색어
        String query = request.getParameter("query");
        if(query != null) query = query.trim();

        // 페이지 번호
        int page = 1;
        int limit = 10; // 한 페이지에 보여줄 글 수
        if(request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        NoticeService noticeService = new NoticeService();
        // DB에서 데이터 가져오기
        int listCount = noticeService.getNoticeCount(query);
        List<Notice> noticeList = noticeService.getNoticeList(query, page, limit);

        // JSP로 전달
        request.setAttribute("listCount", listCount);
        request.setAttribute("noticeList", noticeList);
        request.setAttribute("currentPage", page);
        request.setAttribute("limit", limit);
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
