package edu.nju.homeworks.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 系统管理员
 */
@Entity
@Table(name = "admin")
public class Admin extends User {

	/** serialVersionUID */
	private static final long serialVersionUID = -5896444895247258238L;
}
