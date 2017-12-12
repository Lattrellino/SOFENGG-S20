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
		request.getRequestDispatcher("index.html").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//-----------------------------set variable--------------------------//	
		
		String username = request.getParameter("id-number");
		String password =(String) request.getParameter("password");		
		
		//-----------------------------==checking==--------------------------//	
			
		user_database person = Database.login(username, password);
		if (person != null) {
			request.getSession().setAttribute("person", person);
			
			//get current date
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			request.getSession().setAttribute("current-day", dateFormat.format(date));
			System.out.println(dateFormat.format(date));
			
			//set selected date as current date
			request.getSession().setAttribute("selected-day", dateFormat.format(date));
			
			//set floor to display
			request.getSession().setAttribute("selected-floor", 7);
			
			// redirect to secured page
			System.out.println("login dopost");
			response.sendRedirect("/sofengg/Admin_Controller");
		} 
		
		else {
			System.out.println("login dopost");
			response.sendRedirect("/sofengg/LogInController");
		}
			
	}

}
