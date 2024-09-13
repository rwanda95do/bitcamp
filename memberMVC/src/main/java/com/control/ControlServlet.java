package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = {"*.do"},
		initParams = {
				@WebInitParam(name = "propertyConfig", value = "command.properties")
		}
	)
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();

	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig");
		System.out.println("propertyConfig : " + propertyConfig);
		
		// @WebServlet로 서블릿을 등록했을때, command.properties의 경로를 알아오게 시킨다   // -> 클라우드나 다른 컴퓨터의 위치에서 사용해야해서 이렇게 해야한다. 
		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		String realPath = realFolder + "/" + propertyConfig;
		System.out.println("realPath : " + realPath);
		
		// command.properties의 파일의 나용을 읽어서 map에 보관
		FileInputStream fin = null;
        Properties properties = new Properties();

        try {
        	//fin = new FileInputStream(propertyConfig);   // web.xml사용했을때
        	 fin = new FileInputStream(realPath);			// @WebServlet
             properties.load(fin);
             System.out.println("properties = "+properties);

          } catch (IOException e) {
             e.printStackTrace();
          }finally{
             try {
                fin.close();
             } catch (IOException e) {
                e.printStackTrace();
             }
          }
          System.out.println();

          Iterator<Object> it = properties.keySet().iterator();
          while(it.hasNext()) {
             String key = (String)it.next();
             System.out.println("key = "+key);

             String className = properties.getProperty(key); // className은 그냥 " "안에 담긴 문자열
             System.out.println("className = "+className);

             try {
                Class<?> classType = Class.forName(className);  // className의 자료형을 모르니까 Class<?> 클래스타입(자료형)으로 일단 보내
                Object ob = classType.getConstructor().newInstance();  // className을 생성해!!

                System.out.println("ob = "+ob);

                map.put(key, ob);

             } catch (ClassNotFoundException e) {
                e.printStackTrace();
             } catch (InstantiationException e) {
                e.printStackTrace();
             } catch (IllegalAccessException e) {
                e.printStackTrace();
             } catch (IllegalArgumentException e) {
                e.printStackTrace();
             } catch (InvocationTargetException e) {
                e.printStackTrace();
             } catch (NoSuchMethodException e) {
                e.printStackTrace();
             } catch (SecurityException e) {
                e.printStackTrace();
             }

             System.out.println();
          }//while
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		
		if(request.getMethod().equals("POST")) {request.setCharacterEncoding("UTF-8");} // post로 들어오면 한글처리해주어라
		
		// http://localhost:8080/memberMVC/member/wirteForm.do 로 요청이 들어오면
		// /member/memberwirteForm.do 로 만들어야한다.
		String category = request.getServletPath();	// 프로젝트명 뒤를 가져온다
		System.out.println("category : " + category);
		
		// Map을 이용하여 Key에 해당하는 값을 가져온다.
		CommandProcess com = (CommandProcess) map.get(category);	//
		
		String view = null;		// view는 jspㅍㅏ일인가?
		try {
			view = com.requestPro(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		if(view.equals("none")) {return;}
		
		// forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
		
	}
}
