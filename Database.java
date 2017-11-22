package controller;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.*;

public class Database {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("db");
	
	public static user_database getUser(int id) {
		user_database userDB = null;
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		
		trans.begin();
		userDB = em.find(user_database.class, id);
		trans.commit();
		

		em.close();
		
		return userDB;
		
	}
	
	public static pc_database getPcr(int id) {
		pc_database pcDB = null;
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		
		trans.begin();
		pcDB = em.find(pc_database.class, id);
		trans.commit();
		

		em.close();
		
		return pcDB;
		
	}
	
	public static log_database getLog(int id) {
		log_database logDB = null;
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		
		trans.begin();
		logDB = em.find(log_database.class, id);
		trans.commit();
		

		em.close();
		
		return logDB;
		
	}
	
	
	
//----------------------------------------------------------------Log In  Funtion-----------------------------------------------------//	
	
	public static user_database login(String username, String password) {
//		log_database logDB = null;
		
		System.out.println("first");
		EntityManager em = emf.createEntityManager();
		System.out.println("second");
		
		try {
			
		Query query =  em.createQuery("select u from user u where u.userID = :username and u.password = :password");
		query.setParameter("username", Integer.parseInt(username));
		query.setParameter("password", password);
		
		
			user_database user = (user_database) query.getSingleResult();
			if(user != null) {
				System.out.println("Got it");
				return user;
			}
			else
				System.out.println("NO");
			return null;
			
		} catch (NoResultException | NumberFormatException e) {
			System.out.println("No result");
			return null;
		} finally {
			em.close();
		}
	}
	
	
	
	
//----------------------------------------------------------Admin's Controller function----------------------------------------------------//
	
	
	//=============================================Check PC======================================================//
	
	public static boolean checkIfPcAvailable(String PcNo) {
		
		EntityManager em = emf.createEntityManager();
		
		
		try {
			
			//pc availability "0" = available
			//				  "1" = not available 
			//				  "2" = maintenance
			
		Query query =  em.createQuery("select u from pc u where u.pc_no = :pc_no and u.availability = 0");
		query.setParameter("pc_no", Integer.parseInt(PcNo));
		
		
			pc_database user = (pc_database) query.getSingleResult();
			if(user != null) {
				System.out.println("Got it");
				return true;
			}
			else
				System.out.println("NO");
			return false;
			
		} catch (NoResultException | NumberFormatException e) {
			System.out.println("No result");
			return false;
		} finally {
			em.close();
		}
		
		
	}
	
	//======================================================check time is available================================================//
	
	//--------------------------------------( StartTime, EndTime, DateTime)
	public static boolean checkIfTimeIsAvail( String Time, String DateTime ) {
		
		
		
		EntityManager em = emf.createEntityManager();

//OLD method if YOU WANT TO GO BACK
//		
//		try {
//			
//			//
//			//Please check the date in mysql if correct
//			//
//			//==============Check if there is conflict in between time==========//
//		Query query =  em.createQuery("select u from log u where u.date_time = :DateTime and u.start_time >= :StartTime and u.end_time <= :StartTime2 and .start_time >= :EndTime and u.end_time <= :EndTime2");
//		query.setParameter("DateTime", DateTime);
//		
//		query.setParameter("StartTime", StartTime);
//		query.setParameter("StartTime2", StartTime);
//		
//		query.setParameter("EndTime", EndTime);
//		query.setParameter("EndTime2", EndTime);
//		
//		//
//		//
//		//Check just to be sure that the result isn't null
//		//
//		//
//			log_database temp = (log_database) query.getSingleResult();
//			if(temp != null) {
//				
//				System.out.println("In between time");
//				return false;
//			}else {
//				//
//				//
//				//The Program should not have been here
//				//
//				//
//				
//				System.out.println("There is error");
//				
//				return true;
//			}
//			
//			
//			
//		} catch (NoResultException e) {
//			//
//			//
//			//The time is not in between the reserve time
//			//
//			//
//		}
//		
//		//
//		//
//		//Check if the time is valid
//		//
//		//if the reserved time is in betweeen the start time and end time (inavlid)
//		//
//		//
//		try {
//				Query query =  em.createQuery("select u from log u where u.date_time = :DateTime and u.start_time <= :StartTime and u.end_time >= :EndTime ");
//				query.setParameter("DateTime", DateTime);
//				
//				query.setParameter("StartTime", StartTime);
//				query.setParameter("EndTime", EndTime);
//				
//				
//				log_database temp = (log_database) query.getSingleResult();
//				if(temp != null) {
//					
//					System.out.println("the reserved time is In between the desired time");
//					return false;
//				}else {
//					//
//					//
//					//The Program should not have been here
//					//
//					//
//					
//					System.out.println("There is error");
//					
//					return false;
//				}
//				
//				
//				
//		}catch(NoResultException e) {
//			//
//			//
//			//There are no conflict 
//			//To be sure please check the database
//			//
//			//
//			System.out.println("The desired time is available");
//			
//			return true;
//			
//		}
//		
//		
	
		
		
		
		try {
			
			Query query =  em.createQuery("select u from log u where u.date_time = :DateTime and u.time == :Time");
			query.setParameter("Time", Time);

			//
			//If there is result this means the time user choose is already reserved
			//
			
			
			//
			//check to be sure
			//
			
			log_database temp = (log_database) query.getSingleResult();
			if(temp != null) {
			System.out.println("Conflict");
			
			return false;
			
			}
			
			
		}catch(NoResultException e){
			
			System.out.println("No Conflict");
			
			return true;
			
		}
		
		//
		//there will be some problem if the program actually reach this 
		//
		
		return false;
		
		
		
	}

	public static void reserveSlot(String pcNo, String Date, String Time, String UserID) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.createNativeQuery("UPDATE log set pc_no = " + pcNo + ", date = " + Date + " time = " + Time + ", user_id = " + UserID + " ;").executeUpdate();
		et.commit();
	}
	
	
	
	
	
	
	

}

