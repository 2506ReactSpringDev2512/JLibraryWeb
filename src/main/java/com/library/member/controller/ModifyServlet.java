package com.library.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.member.model.service.MemberService;

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
		String memberPw = request.getParameter("memberPw");
		MemberService mSerivce = new MemberService();
		Member member = mSerivce.selectOneByPw(memberPw);
		if( != memberPw) { //< if문을 작성할 때 기존 로그인 되어있는 계정의 비번과 일치하는 비번을 작성할 시 동작
			request.setAttribute("member", member);
		}else {
			request.setAttribute("errorMsg", "비밀번호가 다릅니다. 다시 확인해주세요.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
		}
		request.getRequestDispatcher("/")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberPw = request.getParameter("");
		String memberPhone = request.getParameter("");
	}

}
