package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDTO;
import dto.MemberDTO;
import service.BoardServiceImpl;
import service.MemberServiceImpl;

@WebServlet("*.me")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberServiceImpl memberService = new MemberServiceImpl();
	
	
	
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 처리(인코딩)
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println("command = " + command);

		//이동할 페이지
		String path = "view/template.jsp";
		
		String contentPage = "";
		
		boolean isRedirect = false;
		
		//게시글 목록 페이지로 이동
		if(command.equals("/joinForm.me")) {
			
			contentPage = "join_form";
		}
		else if(command.equals("/join.me")) {
			String memId = request.getParameter("memId");
			String memPw = request.getParameter("memPw");
			String memName = request.getParameter("memName");
			int memAge = Integer.parseInt(request.getParameter("memAge"));
			String gender = request.getParameter("gender");
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(memId);
			memberDTO.setMemPw(memPw);
			memberDTO.setMemName(memName);
			memberDTO.setMemAge(memAge);
			memberDTO.setGender(gender);
			
			memberService.insertMember(memberDTO);
			
			
			path = "view/join_result.jsp";
			
		}
		else if(command.equals("/loginForm.me")) {
			contentPage = "login";
		}
		
		
		request.setAttribute("contentPage", contentPage);
		
		//페이지 이동
		if(isRedirect) {
			response.sendRedirect(path);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		
	}
}













