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

	private String userid;
	@Column(columnDefinition = "VARCHAR(255)")
	private String name;
	private String password;
	private String avatar;
	
	public Admin() {
		this.avatar = "../images/admin.jpg";
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

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

}
