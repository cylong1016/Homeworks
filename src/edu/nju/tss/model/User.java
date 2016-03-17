package edu.nju.tss.model;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * 系统用户
 */
@Entity
public class User extends ID {

	/** serialVersionUID */
	private static final long serialVersionUID = 4599965030145911604L;
	private String userid;
	@Column(columnDefinition = "VARCHAR(255)")
	private String password;
	private String name;
	private String avatar;
	public static final String TEACHER = "Teacher";
	public static final String STUDENT = "Student";
	private String iden = TEACHER;
	public static final String MALE = "Male";
	public static final String FEMALE = "Female";
	private String sex = MALE;
	private String mail;
	private String phone;
	
	public User() {
		// 默认头像
		this.avatar = "../images/default.jpg";
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

	public String getIden() {
		return iden;
	}

	public void setIden(String iden) {
		this.iden = iden;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
