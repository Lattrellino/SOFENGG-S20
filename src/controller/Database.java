package controller;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

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
	
	public static List<pc_database> getAllPCs() {

		List<pc_database> pcs = null;
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		// update object into db

		try {
			trans.begin();

			TypedQuery<pc_database> query = em.createQuery("select u from pc u", pc_database.class);
			pcs = query.getResultList();
			trans.commit();
		} catch (Exception e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			em.close();
		}

		return pcs;
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
	
	//Gets the PCs in a specific floor
	public static List<pc_database> getPCsOnFloor(int floor) {

		List<pc_database> pcs = null;
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			
			Query query =  em.createQuery("select u from pc u where u.floor = :floor");
			query.setParameter("floor", floor);
			
			pcs = query.getResultList();
			trans.commit();
		} catch (Exception e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			em.close();
		}
		
		return pcs;
	}
	
	//Gets the logs of a certain user that are still upcoming
	public static List<log_database> getLogsOfUser(int userId, String currentDate) {

		List<log_database> logs = null;
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			
			Query query =  em.createQuery("select u from log u where u.userId = :user_id and u.date >= :date");
			query.setParameter("user_id", userId);
			query.setParameter("date", Date.valueOf(currentDate));
			
			logs = query.getResultList();
			trans.commit();
		} catch (Exception e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			em.close();
		}
		
		return logs;
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
	
	
	public static boolean checkIfPcAvailable(String PcNo) {
		
		EntityManager em = emf.createEntityManager();
		System.out.println("this" + PcNo);
		
		try {
			
			//pc availability "0" = not available 
			//				  "1" = available
			//				  "2" = maintenance
			
		Query query =  em.createQuery("select u from pc u where u.pc_no = :pc_no and u.status = 1");
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
	
	//checks if pc is available at this time
	public static boolean checkIfTimeIsAvail(int pc_no, String time, String date) {
		EntityManager em = emf.createEntityManager();
		try {
				//query block
				Query query =  em.createQuery("select u from log u where u.pcNo = :pc_no and u.date = :date and u.Time = :time");
				query.setParameter("pc_no", pc_no);
				query.setParameter("time", Time.valueOf(time));
				query.setParameter("date", Date.valueOf(date));
				
				//conflict block
				log_database temp = (log_database) query.getSingleResult();
				if(temp != null) {
				System.out.println("Conflict");
				return false;
			}
			
		}catch(NoResultException e){
			//no conflict block
			System.out.println("No Conflict");
			return true;		
		}
		
		//big problem
		System.out.println("Welp");
		return false;	
	}
	
	//reserves slot/adds a log
	public static void reserveSlot(String pcNo, String Date, String Time, String UserID) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		System.out.println(pcNo + "|" + Date +"|" + Time + "|" + UserID);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.createNativeQuery("INSERT INTO log (pc_no,date,time,user_id) " + "VALUES ('" + pcNo + "','" + Date + "','" + Time + "','" + UserID +"')").executeUpdate();
		et.commit();
	}
	
	//deletes the log
	public static void removeLog(String pcNo, String Date, String Time, String UserID) 
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.createNativeQuery("DELETE FROM log " +
				"WHERE pc_no" +  " = '" + pcNo + "'" + 
				" AND date = '" + Date + "'" + 
				" AND time = '" + Time + "'" + 
				" AND user_id = '" + UserID + "'"
				).executeUpdate();
		et.commit();
	}
	
	//========================================================Check The peak hours===============================================================//
	
	public static String checkPeakHours(String date) {
		
		EntityManager em = emf.createEntityManager();
		String temp = "00:00:00";
			
		try {
//			select *,count(time)
//			from log
//			where date = "2017-11-24"
//			group by time
//			order by count(time) desc
//			;
			
		Query query =  em.createQuery("select u from log as u where u.date = :date group by u.time order by count(u.time) desc");
		query.setParameter("date", Date.valueOf(date));
		
		
			log_database user = (log_database) query.getSingleResult();
			temp = user.getTime().toString();
			
			if(user != null) {
				System.out.println("Got it");
				return temp;
			}
			
		} catch (NoResultException | NumberFormatException e) {
			System.out.println("No result");

		} finally {
			em.close();
		}
		
		return temp;	
	}
	
//=============================================================Check most reserved PC all time=========================================//
	
	public static int checkMostReserved() {
		
		EntityManager em = emf.createEntityManager();
		int temp = 0;

		try {
//			select *, count(pc_no)
//			from log
//			group by pc_no
//			order by count(pc_no) desc
//			;

		Query query =  em.createQuery("select u from log as u group by u.pc_no order by count(u.pc_no) desc");
		
			log_database user = (log_database) query.getSingleResult();
			temp = user.getPcNo();
			
			if(user != null) {
				System.out.println("Got it");
				return temp;
			}
			
		} catch (NoResultException | NumberFormatException e) {
			System.out.println("No result");
		} finally {
			em.close();
		}
		
		return temp;	
	}
	
	public static void main(String[] args){
		reserveSlot("7", "2017-12-12", "7:00:00", "11311313");
	}
}
