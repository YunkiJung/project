package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BoardDTO;
import dto.MemberDTO;
import dto.ReplyDTO;
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
			
			String searchKeyword = request.getParameter("searchKeyword");
			String searchValue = request.getParameter("searchValue");
			
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setSearchKeyword(searchKeyword);
			boardDTO.setSearchValue(searchValue);
			
			List<BoardDTO> list = boardService.selectBoardList(boardDTO);
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
		//게시글 상세보기
		else if(command.equals("/boardDetail.bo")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			BoardDTO result = boardService.selectBoardDetail(boardNum);
			request.setAttribute("boardInfo", result);
			boardService.updateReadCnt(boardNum);
			
			List<ReplyDTO> replyList = boardService.selectReplyList(boardNum);
			
			request.setAttribute("replyList", replyList);
			
			contentPage = "board_detail";
		}
		//댓글 등록
		else if(command.equals("/regReply.bo")) {
			String content = request.getParameter("content");
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			HttpSession session = request.getSession();
			String memId = ((MemberDTO)session.getAttribute("loginInfo")).getMemId();
			
			ReplyDTO replyDTO = new ReplyDTO();
			replyDTO.setContent(content);
			replyDTO.setBoardNum(boardNum);
			replyDTO.setWriter(memId);
			
			boardService.insertReply(replyDTO);
			
			isRedirect = true;
			path = "boardDetail.bo?boardNum=" + boardNum;
			
		}
		else if(command.equals("/deleteReply.bo")) {
			int replyNum = Integer.parseInt(request.getParameter("replyNum"));
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			boardService.deleteReply(replyNum);
			
			isRedirect = true;
			path = "boardDetail.bo?boardNum=" + boardNum;
			
		}
		//게시글 삭제
		else if(command.equals("/deleteBoard.bo")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			//게시글에 달린 댓글 삭제
			
			//게시글 삭제
			boardService.deleteBoard(boardNum);
			
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













