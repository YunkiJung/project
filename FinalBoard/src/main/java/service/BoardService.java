package service;

import java.util.List;

import dto.BoardDTO;

public interface BoardService {
	//게시글 목록 조회
	List<BoardDTO> selectBoardList();
	
	//게시글 등록
	void insertBoard(BoardDTO boardDTO);
}
















