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
 * Servlet implementation class modifyServlet
 */
@WebServlet("/modify")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member loginMember = (Member) request.getSession().getAttribute("loginUser");
        if (loginMember != null) {
            request.setAttribute("member", loginMember); // JSP에서 ${member.xxx} 사용 가능
            request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login"); // 로그인 안 되어 있으면 로그인 페이지
        }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");

        Member loginMember = (Member) request.getSession().getAttribute("loginUser");
        if (loginMember == null) {
            response.sendRedirect("/login");
            return;
        }

        // 입력값 받아오기 (프론트에서 비밀번호 일치 검사)
        String newPassword = request.getParameter("newPassword");
        String phone = request.getParameter("phone");

        // Member 객체 업데이트
        loginMember.setMemberPwd(newPassword);
        loginMember.setPhone(phone);

        try {
            int result = new MemberService().modifyMember(loginMember);
            if (result > 0) {
                // 세션 갱신
                request.getSession().setAttribute("loginMember", loginMember);

                // 수정 성공 후 alert + 메인 페이지 이동
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().println("<script>alert('회원 정보가 수정되었습니다.'); location.href='/';</script>");
            } else {
                // 수정 실패 시 alert
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().println("<script>alert('회원 정보 수정에 실패했습니다.'); history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('서버 오류가 발생했습니다.'); history.back();</script>");
        }
    }


}
