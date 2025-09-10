package com.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.member.model.service.MemberService;

/**
 * Servlet implementation class ManageDeleteMemberServlet
 */
@WebServlet("/delete-member")
public class ManageDeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageDeleteMemberServlet() {
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
		String memberId = request.getParameter("memberId");
		MemberService mservice = new MemberService();
        int lendCount = mservice.selectLendCount(memberId);

        if(lendCount > 0) {
            // 대출중이면 alert 후 이전 페이지로
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().append("<script>alert('대출 중인 도서가 있어 삭제할 수 없습니다.'); history.back();</script>");
        } else {
            int result = mservice.deleteMember(memberId);
            if(result > 0) {
                response.sendRedirect(request.getContextPath() + "/manage-member"); // 회원 목록 페이지로
            } else {
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().append("<script>alert('삭제에 실패했습니다.'); history.back();</script>");
            }
        }
	}

}
