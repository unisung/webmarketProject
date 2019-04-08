package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardWriteActionProcess implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, 
			                               HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		
		String pageNum=request.getParameter("pageNum");
		String items=request.getParameter("items");
		String text=request.getParameter("text");
		
		BoardDAO dao = BoardDAO.getInstance();
		Board board = new Board();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		SimpleDateFormat sdf 
		    = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = sdf.format(new Date());
		
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
		
        
		//게시글 작성 후 
		//전체 게시글 리스트로 이동
		return "/BoardList.do?pageNum="+pageNum+"&items="+items+"&text="+text;
	}
}
