package conn.entity;

import java.util.Objects;

public class user {
	private int id;

	private String email;
	private String password;

	public user() {
		super();
		// TODO Auto-generated constructor stub
	}

	public user(int id, String email, String password) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "user [id=" + id + ", email=" + email + ", password=" + password + "]";
	}

}