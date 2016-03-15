package edu.nju.tss.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * 系统用户
 */
@MappedSuperclass
public class User implements Serializable {

	/** serialVersionUID */
	protected static final long serialVersionUID = 4599965030145911604L;
	@Id
	protected String id;
	protected String userid;
	@Column(columnDefinition = "VARCHAR(255)")
	protected String name;
	protected String password;
	
	public User() {
		this.id = UUID.randomUUID().toString();
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

	@Column(name = "id", columnDefinition = "CHAR(32)")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (obj.getClass() != this.getClass())
			return false;

		User another = (User)obj;
		return this.id.equals(another.id);
	}

	@Override
	public int hashCode() {
		return this.id.hashCode();
	}

}
