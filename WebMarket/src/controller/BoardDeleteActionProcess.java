package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

public class BoardDeleteActionProcess implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, 
			                               HttpServletResponse response) throws Throwable {
		//삭제 처리
		//원래 페이지 이동을 위해 파라미터 받기
		String sPageNum = request.getParameter("pageNum");
		String sNum = request.getParameter("num");
		String items = request.getParameter("items");
		String text=request.getParameter("text");
		
		//파라미터로 받은 글 번호로 삭제 처리
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(Integer.parseInt(sNum));
		
		return "/BoardList.do?pageNum="+sPageNum+"&items="+items+"&text="+text;
	}

}
