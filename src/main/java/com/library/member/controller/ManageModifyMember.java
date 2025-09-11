package com.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.member.model.service.MemberService;
import com.library.member.model.vo.Member;

/**
 * Servlet implementation class manageModifyMember
 */
@WebServlet("/admin/modify-member")
public class ManageModifyMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageModifyMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");

        if(memberId == null || memberId.isEmpty()) {
            request.setAttribute("errorMsg", "회원 아이디가 전달되지 않았습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
            return;
        }
        MemberService mService = new MemberService();
        Member member = mService.getMemberById(memberId);
        if(member == null) {
            request.setAttribute("errorMsg", "해당 회원을 찾을 수 없습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
            return;
        }

        request.setAttribute("member", member);
        request.getRequestDispatcher("/WEB-INF/views/admin/manageModifyMember.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
        String gender = request.getParameter("memberGender");
        int age = Integer.parseInt(request.getParameter("memberAge"));
        String phone = request.getParameter("memberPhone");

        Member member = new Member();
        member.setMemberId(memberId);
        member.setGender(gender);
        member.setAge(age);
        member.setPhone(phone);

        MemberService mService = new MemberService();
        int result = mService.manageModifyMember(member);

        response.setContentType("text/html; charset=UTF-8");
        if(result > 0) {
            response.getWriter().println("<script>alert('수정 성공'); location.href='/manage-member';</script>");
        } else {
            response.getWriter().println("<script>alert('수정 실패'); history.back();</script>");
        }
	}
}
