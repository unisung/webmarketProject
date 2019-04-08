package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String,CommandProcess> commandMap 
    = new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("config");
		System.out.println(props);
		Properties pr=new Properties();
		//파일시스템경로상의 commandURI.properties 정보를 읽어서 pr에 저장
		FileInputStream f=null;
		try {
		      String filePath = config.getServletContext().getRealPath(props);
		      System.out.println(filePath);
		      f=new FileInputStream(filePath);
		      //시스템상의 파일정보로 파일입력스트림을 이용해서 pr에 저장
		      pr.load(f);
		      //Properties객체에 저장된 정보를 꺼내서  commandMap에 저장
		      Iterator<Object> keyItor = pr.keySet().iterator();
		      while(keyItor.hasNext()) {
		    	  String command = (String) keyItor.next();
		    	  System.out.println("command:"+command);
		    	  String className = pr.getProperty(command);
		    	  System.out.println("매핑클래스명:"+className);
		    	  //pr에서 추출한 className으로 클래스 객체를 생성하여 map에 저장
		    	  //forName(클래스명) -> 문자열로 주어진 클래스명을 static의 클래스 영역에 로딩.
		    	  Class commandClass = Class.forName(className);
		    	  //newInstnace() ->메모리에 로딩된 클래스를 instance(객체)화 시키는 메소드
		    	  // 예) new InsertProcess();
		    	  CommandProcess instance 
		    	                      = (CommandProcess) commandClass.newInstance();
		    	  //map에 저장
		    	  commandMap.put(command, instance);
		       }
		     }catch(Exception e) {
		    	  e.printStackTrace();
		     } 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	//URI요청 분석, 해당 클래스 추출 작업
   private void requestPro(HttpServletRequest request, 
	                                      HttpServletResponse response) throws ServletException, IOException {
		 String view=null;
		 CommandProcess com=null;
		 try {
			     String command = request.getRequestURI();
			     System.out.println("command:"+command);
			     if(command.indexOf(request.getContextPath())==0) {
			    	 command=command.substring(request.getContextPath().length());
			     }
			     System.out.println("command:"+command);
			      com = commandMap.get(command);
			      view = com.requestPro(request, response);
				  RequestDispatcher rd = request.getRequestDispatcher(view);
				  rd.forward(request, response);
		 }catch( Throwable e) {
			 e.printStackTrace();
		 }
		}

}
