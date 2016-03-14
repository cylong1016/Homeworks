package edu.nju.homeworks.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 老师
 */
@Entity
@Table(name = "teacher")
public class Teacher extends User {

	/** serialVersionUID */
	private static final long serialVersionUID = 7175090310197820739L;

}
