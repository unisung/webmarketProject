package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardListProcess implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, 
			                               HttpServletResponse response) throws Throwable {
		//넘어온 request의 문자셋을 utf-8로 설정
		request.setCharacterEncoding("utf-8");
		
		BoardDAO dao = BoardDAO.getInstance();
		List<Board> boardList = new ArrayList<>();
		
		//페이징 처리
		int pageNum=1;//전체 페이지 시작 번호
		int limit = 10;//한페이지당 보여줄 게시글의 개수
		//글 자세히 보기,수정처리 후 다시 해당 페이지로 돌아올때 사용하는 파라미터 pageNum
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		String items = request.getParameter("items");
		String text=request.getParameter("text");
	
		//전체 게시글 건수
		int total_record = dao.getListCount(items,text);
		//전체 게시글 리스트 
		boardList = dao.getBoardList(pageNum,limit,items,text);
		
		//
		int total_page;
		if(total_record%limit==0) {// 예) 게시글 100인경우 10페이지
			total_page=total_record/limit;
			Math.floor(total_page);
		}else {
			total_page=total_record/limit; //예)게시글 106인 경우 10페이지 + 1페이지
			Math.floor(total_page);
			total_page= total_page+1;
		}
		
		//./board/list.jsp 에서 받아서 처리
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardList);
		//검색조건, 검색어 추가 
		request.setAttribute("items",items);
		request.setAttribute("text", text);
		
		//이동할 jsp
		return "./board/list.jsp";
	}
}
