package com.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.member.model.service.MemberService;

/**
 * Servlet implementation class findPwdServlet
 */
@WebServlet("/findPwd")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/findPwd.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
        String memberName = request.getParameter("memberName");
        String memberPhone = request.getParameter("memberPhone");
        
        MemberService mService = new MemberService();
        String password = mService.findPassword(memberId, memberName, memberPhone);
        System.out.println(password);

        response.setContentType("text/html; charset=UTF-8");
        if (password == null) {
            response.getWriter().print("<script>alert('사용자 정보가 없습니다.'); history.back();</script>");
        } else {
            response.getWriter().print("<script>alert('비밀번호: " + password + "'); history.back();</script>");
        }
	}

}
