package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardUpdateActionProcess implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, 
			                               HttpServletResponse response) throws Throwable {
		//post전송시 한글 깨짐 처리
		request.setCharacterEncoding("utf-8");

		//원래 페이지 이동을 위해 파라미터 받기
		String sPageNum = request.getParameter("pageNum");
		String sNum = request.getParameter("num");
		String items = request.getParameter("items");
		String text=request.getParameter("text");
		//수정한 내용을 파라미터로 받기
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		//Board 빈 생성하여 파라미터로 넘어온 값 세팅
		Board board = new Board();
		board.setNum(Integer.parseInt(sNum));
		board.setName(name);
		board.setSubject(subject);
		board.setContent(content);
		//게시글 수정 처리
		BoardDAO dao = BoardDAO.getInstance();
		dao.updateBoard(board);
		//이동할 페이지
		return "/BoardList.do?pageNum="+sPageNum
				                        +"&num="+sNum+"&items="+items+"&text="+text;
	}
}
