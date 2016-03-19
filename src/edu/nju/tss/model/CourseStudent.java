package edu.nju.tss.model;

import javax.persistence.Entity;

/**
 * 学生选课的表
 * @author cylong
 * @version 2016年3月20日 上午2:59:54
 */
@Entity
public class CourseStudent extends ID {

	/** serialVersionUID */
	private static final long serialVersionUID = 5547671901321479961L;

	private String studentid;
	private String courseid;

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

}
