package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity( name = "pc" )

public class pc_database {
	
	@Id
	@Column(name = "pc_no")
	private int pcNo;
	
	@Column(name = "status")
	private int status;

	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "floor")
	private int floor;
	
	public int getPcNo() {
		return pcNo;
	}

	public int getStatus() {
		return status;
	}

	public int getUserId() {
		return userId;
	}
	
	public int getFloor() {
		return floor;
	}



}
