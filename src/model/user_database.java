package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity( name = "user" )

public class user_database {
	
	@Id
	@Column(name = "user_id")
	private int userID;
	
	@Column(name = "type")
	private int type;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "password")
	private String password;

	public int getUserID() {
		return userID;
	}

	public int getType() {
		return type;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	
//	@Id
//	@Column(name = "userID")
//	private int userID;
//	
//	@Column(name = "name")
//	private String name;
//	
//	@Column(name = "password")
//	private String password;
//	
//	@Column(name = "email")
//	private String email;
//	
//	@Column(name = "position")
//	private String position;
//

}
