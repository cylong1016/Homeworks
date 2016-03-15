package edu.nju.tss.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 系统管理员
 */
@Entity
@Table(name = "admin")
public class Admin extends ID {

	/** serialVersionUID */
	private static final long serialVersionUID = -5896444895247258238L;

	protected String userid;
	@Column(columnDefinition = "VARCHAR(255)")
	protected String name;
	protected String password;

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
