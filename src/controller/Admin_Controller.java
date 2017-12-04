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
@WebServlet("/Admin_Controller")
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
		// TODO Auto-generated method stub
		System.out.println("This is working");
		List<pc_database> pcs = Database.getAllPCs();
		request.getSession().setAttribute("pcs", pcs);
		
		boolean[][] available = new boolean[pcs.size()][16];
		for(int i = 0; i < pcs.size(); i++){
			for(int j = 0; j < 16; j++){
				System.out.println(pcs.get(i).getPcNo() + " / " + (7 + j) + ":00 / " + request.getSession().getAttribute("current-day"));
				available[i][j] = Database.checkIfTimeIsAvail(pcs.get(i).getPcNo(), (7 + j) + ":00:00", (String) request.getSession().getAttribute("current-day"));
				System.out.println(available[i][j]);
			}
		}
		request.getSession().setAttribute("avail", available);
		
		user_database person = (user_database) request.getSession().getAttribute("person");
		
		request.getRequestDispatcher("reserve-home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//================================get parameter=============================//
		//example String username = request.getParameter("username");
		
		String UserID 		= (String)request.getParameter("user_id");
		String PcNO 		= (String)request.getParameter("pc_no");
		String Time         = (String)request.getParameter("time");
		String Date	 	    = (String)request.getParameter("date");
		System.out.println("User" + UserID + "|PcNo" + PcNO +"|Time" +Time + "|Date" + Date);
		//===============check if the pc is available that time===================//

		//-----------------check pc if available---------------//
		
		//if( !Database.checkIfPcAvailable(PcNO) ) {
			//response.sendRedirect("/sofengg/Admin_Controller");
			
			//Note : add a popup panel show that the pc isn't available
			
		//}
		Database.reserveSlot(PcNO, Date, Time, UserID);
		//---------------check time if available-------------//
		
		//if( !Database.checkIfTimeIsAvail( StartTime, EndTime, DateTime)){
			response.sendRedirect("/sofengg/Admin_Controller");
			
			//Note : add a popup panel show that the time isn't available
			
			
		//}
		
		//------------Reserve the time --------------------//
		
		
		
		
				
	}

}
