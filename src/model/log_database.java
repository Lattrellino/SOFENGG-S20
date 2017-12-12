package model;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity( name = "log" )

public class log_database {
	
	@Id
	@Column( name = "log_id" )
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int logID;
	
	@Column( name = "pc_no" )
	private int pcNo;
	
	@Column( name = "date" )
	private Date date;
	
	@Column( name = "time" )
	private Time Time;

	@Column( name = "user_id" )
	private int userId;

	public int getLogID() {
		return logID;
	}

	public int getPcNo() {
		return pcNo;
	}

	public Date getDate() {
		return date;
	}

	public Time getTime() {
		return Time;
	}

	public int getUserId() {
		return userId;
	}

	public void setLogID(int logID) {
		this.logID = logID;
	}

	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setTime(Time time) {
		Time = time;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
