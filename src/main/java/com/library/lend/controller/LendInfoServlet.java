package com.library.lend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.library.lend.model.service.LendInfoService;
import com.library.lend.model.vo.LendInfo;

/**
 * Servlet implementation class rendInfoServlet
 */
@WebServlet("/lendinfo")
public class LendInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LendInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = (String) request.getSession().getAttribute("memberId");

        int currentPage = 1;
        int pageSize = 10;

        if(request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        LendInfoService lendService = new LendInfoService();
        // 대출 정보 가져오기
        List<LendInfo> lendList = lendService.getLendInfoList(memberId, currentPage, pageSize);
        
        // 연체 여부 계산
        Date now = new Date();
        for(LendInfo li : lendList) {
            if(li.getReturn_date() != null) {
                boolean overdue = li.getReturn_date().before(new java.sql.Date(now.getTime()));
                li.setOverdue(overdue); // LendInfo에 overdue 필드 필요
            } else {
                li.setOverdue(false);
            }
        }
        
        
        int totalCount = lendService.getLendInfoTotalCount(memberId);
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        request.setAttribute("lendList", lendList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPage", totalPage);

        request.getRequestDispatcher("/WEB-INF/views/lend/lendInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
