package service;

import java.util.List;

import dto.BoardDTO;

public interface BoardService {
	//게시글 목록 조회
	List<BoardDTO> selectBoardList(BoardDTO boardDTO);
	
	//게시글 등록
	void insertBoard(BoardDTO boardDTO);
	
	//게시글 상세보기
	BoardDTO selectBoardDetail(int boardNum);
	
	//게시글 조회수 증가
	void updateReadCnt(int boardNum);
	
	
}
















