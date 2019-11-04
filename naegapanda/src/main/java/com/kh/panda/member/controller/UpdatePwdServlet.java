package com.kh.panda.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.panda.member.model.service.MemberService;
import com.kh.panda.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdServlet
 */
//@WebServlet("/updatePwd.me")
@WebServlet(name="UpdatePwdServlet", urlPatterns="/updatePwd.me")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 현재 비밀번호, 새로운 비밀번호
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		
		Member updateMem = new MemberService().updatePwd(id, pwd, newPwd);
		
		
		// 성공이던 실패던 동일한 페이지가 보여지게끔``
		RequestDispatcher view = request.getRequestDispatcher("views/member/pwdUpdateForm.jsp");
		
		if(updateMem != null) { // 성공적으로 수정되었을 경우
			request.getSession().setAttribute("loginUser", updateMem);
			
			request.setAttribute("msg", "성공적으로 비밀번호를 변경하였습니다.");
			
		}else { // 수정에 실패했을 경우 
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			
		}
		
		view.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
