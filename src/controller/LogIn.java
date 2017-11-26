package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user_database;


/**
 * Servlet implementation class LogIn
 */
@WebServlet("/LogInController")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("index.html").forward(request, response);
								//		HttpSession session = request.getSession();
								//		session.setAttribute("photoBase", PhotoDatabase.photoBase);
								//		session.setAttribute("pictureBase", PhotoServices.getAllPublicPictures());
								//		
								//		if(request.getParameter("loadNum") != null)
								//			request.setAttribute("loadNum", request.getParameter("loadNum"));
								//		else{
								//			request.setAttribute("loadNum", "0");
								//		}
								//		Cookie[] cookies = request.getCookies();
								//		if(cookies != null){
								//			for (Cookie cookie : cookies) {
								//				if (cookie.getName().equals("user")) {						//
								//					session.setAttribute("user", cookie.getValue());		//
								//			    }
								//			}
//										}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//-----------------------------set variable--------------------------//	
		
		String username = request.getParameter("id-number");
		
//		System.out.println( request.getParameter("username"));
//		System.out.println( request.getParameter("password"));
		
		String password =(String) request.getParameter("password");
//		String rememberMe = request.getParameter("rememberMe");
		
		
//-----------------------------==checking==--------------------------//	
		
		//---------------admin-----------------------//
		
		//if( password == "admin123")
		//	response.sendRedirect("/sofengg/Admin_Controller");
		
		
		//-------------------normal user--------------//
			
			user_database person = Database.login(username, password);
			if (person != null) {
				
				// save person to session
				// you can also do getSession().setAttribute instead of getting
				// HttpSession object first before setting attribute
				
				request.getSession().setAttribute("person", person);
				
				//get current date
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				request.getSession().setAttribute("current-day", dateFormat.format(date));
				// redirect to secured page
				
				response.sendRedirect("/sofengg/Admin_Controller");
				System.out.println("login dopost");
			} else {
				System.out.println("login dopost");
			response.sendRedirect("/sofengg/LogInController");
			
		}
		
//		
	}

}
