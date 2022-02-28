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
import service.BoardServiceImpl;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardServiceImpl boardService = new BoardServiceImpl();
	
	
	
    public BoardController() {
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
		if(command.equals("/boardList.bo")) {
			
			List<BoardDTO> list = boardService.selectBoardList();
			request.setAttribute("boardList", list);
			contentPage = "board_list";
		}
		//글쓰기 페이지로 이동
		else if(command.equals("/regBoardForm.bo")) {
			contentPage = "board_write";
		}
		//글 등록
		else if(command.equals("/regBoard.bo")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setTitle(title);
			boardDTO.setContent(content);
			boardDTO.setWriter(writer);
			
			boardService.insertBoard(boardDTO);
			
			isRedirect = true;
			path = "boardList.bo";
			
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













