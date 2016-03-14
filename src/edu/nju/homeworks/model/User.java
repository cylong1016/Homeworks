package edu.nju.homeworks.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * 系统用户
 */
public class User implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = 4599965030145911604L;
	@Id
	private Long id;
	private String userid;
	@Column(columnDefinition = "VARCHAR(255)")
	private String name;
	private String password;

	public void setIdByDate() {
		Calendar datetime = Calendar.getInstance();
		this.id = datetime.getTimeInMillis();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
