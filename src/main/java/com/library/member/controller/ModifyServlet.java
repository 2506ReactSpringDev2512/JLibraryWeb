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
        Member loginMember = (Member) request.getSession().getAttribute("loginMember");
        
        if (loginMember != null) {
            request.setAttribute("member", loginMember); // JSP에서 ${member.xxx} 사용 가능
        }

        request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp")
               .forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Member loginMember = (Member) request.getSession().getAttribute("loginMember");

        if (loginMember != null) {
            // 입력값 받아오기
            String newPassword = request.getParameter("newPassword");
            String phone = request.getParameter("phone");

            // 정보 수정
            loginMember.setMemberPwd(newPassword);
            loginMember.setPhone(phone);

            // DB 반영
            int result = new MemberService().modifyMember(loginMember);

            if (result > 0) {
                request.getSession().setAttribute("loginMember", loginMember); // 세션 갱신
                response.sendRedirect("/"); // 메인 페이지 등
            } else {
                request.setAttribute("errorMsg", "회원 정보가 수정되지 않았습니다.");
                request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/login"); // 세션 없으면 로그인 유도
        }
    }


}
