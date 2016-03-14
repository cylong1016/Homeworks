package edu.nju.tss.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 学生
 */
@Entity
@Table(name = "student")
public class Student extends User {

	/** serialVersionUID */
	private static final long serialVersionUID = 9131908699711577890L;

}
