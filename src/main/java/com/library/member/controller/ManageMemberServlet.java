package com.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.member.model.service.MemberService;
import com.library.member.model.vo.Member;

/**
 * Servlet implementation class manageMemberServlet
 */
@WebServlet("/manage-member")
public class ManageMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
	    String searchKeyword = request.getParameter("searchKeyword");

	    int currentPage = 1;
	    int pageSize = 10;

	    if(request.getParameter("page") != null) {
	        currentPage = Integer.parseInt(request.getParameter("page"));
	    }

	    MemberService mService = new MemberService();
	    List<Member> list = mService.getMemberList(searchType, searchKeyword, currentPage, pageSize);
	    int totalCount = mService.getMemberTotalCount(searchType, searchKeyword);
	    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

	    request.setAttribute("memberList", list);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("totalPage", totalPage);
	    request.getRequestDispatcher("/WEB-INF/views/admin/manageMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
