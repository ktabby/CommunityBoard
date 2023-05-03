package com.board.serv;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.dto.BoardInsertDto;
import com.board.dto.BoardUpdateDto;
import com.board.vo.BoardInfoVo;



public interface BoardInfoServ {

	//게시글목록
	public List<BoardInfoVo> getReadBoardInfo(HashMap<String, Object> reqMap);
	
	//페이징(총갯수)
	public int pagingCount(HashMap<String, Object> map);
	
	//게시글등록
	public String insertBoardInfo(BoardInsertDto req);
	
	//게시글 총 갯수
	 public int getBoardListCnt(HashMap<String, Object> reqMap) ;

	//게시글상세보기
	public com.board.vo.BoardInfoVo getBoardDetail(int bno); 
	
	//게시글업데이트
	public int updateBoardInfo(BoardUpdateDto req);
	
	//게시글 삭제
	public int deleteBoardInfo(int bno);
}
