package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * Servlet implementation class Admin_Controller
 */
@WebServlet(urlPatterns={"/Admin_Controller", "/reserve", "/remove","/view"})
public class Admin_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		switch(path){
			case "/reserve":
				reserve(request, response);
				break;
			case "/remove":
				remove(request, response);
				break;
			case "/view":
				view(request, response);
				break;
		}	
		
		int floor = (int) request.getSession().getAttribute("selected-floor");
		String currdate = (String) request.getSession().getAttribute("current-day");
		String date = (String) request.getSession().getAttribute("selected-day");
		user_database person = (user_database) request.getSession().getAttribute("person");
		
		//PC List for viewing the schedule
		List<pc_database> pcs = Database.getPCsOnFloor(floor);
		request.getSession().setAttribute("pcs", pcs);
		
		//Log list for viewing the current bookings
		List<log_database> logs = Database.getLogsOfUser(person.getUserID(), currdate);
		request.getSession().setAttribute("logs", logs);
		
		//Finds which time slot is available
		boolean[][] available = new boolean[pcs.size()][16];
		for(int i = 0; i < pcs.size(); i++){
			for(int j = 0; j < 16; j++)
				available[i][j] = Database.checkIfTimeIsAvail(pcs.get(i).getPcNo(), (7 + j) + ":00:00", date);
		}
		request.getSession().setAttribute("avail", available);
		for(log_database log : logs)
			System.out.println(log.getLogID());
		
		request.getRequestDispatcher("reserve-home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request,response);
	}
	
	protected void reserve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get person and selected day from session
		user_database person = (user_database) request.getSession().getAttribute("person");
		String selectedDay = (String) request.getSession().getAttribute("selected-day");
		
		//get pcno and time from form
		String reservePcNo = request.getParameter("reserve-pcno");
		String reserveTime = request.getParameter("reserve-time");
		
		Database.reserveSlot(reservePcNo, selectedDay, reserveTime, person.getUserID() + "");
		
		request.getRequestDispatcher("Admin_Controller").forward(request, response);
	}
	
	protected void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get person and selected day from session
		user_database person = (user_database) request.getSession().getAttribute("person");
		
		//get pcno and time from form
		String deletePcNo = request.getParameter("remove-pcno");
		String deleteDate = request.getParameter("remove-date");
		String deleteTime = request.getParameter("remove-time");
		
		Database.removeLog(deletePcNo, deleteDate, deleteTime, person.getUserID() + "");
		
		request.getRequestDispatcher("Admin_Controller").forward(request, response);
	}
	
	protected void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get floor and date
		int viewFloor = Integer.parseInt(request.getParameter("view-floor"));
		String viewDate = request.getParameter("view-date");
		//set them to session
			request.getSession().setAttribute("selected-floor", viewFloor);
		if(viewDate != null)
			request.getSession().setAttribute("selected-day", viewDate);
		
		request.getRequestDispatcher("Admin_Controller").forward(request, response);
	}
}
