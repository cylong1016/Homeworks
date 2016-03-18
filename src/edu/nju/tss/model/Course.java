package edu.nju.tss.model;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * 课程基本信息
 * @author cylong
 * @version 2016年3月18日 下午5:08:58
 */
@Entity
public class Course extends ID implements Comparable<Course> {

	/** serialVersionUID */
	private static final long serialVersionUID = -1999962906170344347L;

	private String cname;
	/** 任课教师ID */
	private String instructor;
	/** 教师姓名 */
	private String iname;
	private String semester;
	@Column(columnDefinition = "TEXT")
	private String description;

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int compareTo(Course c) {
		return -this.getSemester().compareTo(c.getSemester());
	}

}
