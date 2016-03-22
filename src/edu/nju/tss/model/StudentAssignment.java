package edu.nju.tss.model;

import javax.persistence.Entity;

@Entity
public class StudentAssignment extends ID {

	/** serialVersionUID */
	private static final long serialVersionUID = 9063919104301779347L;

	private String assignmentid;
	private String studentid;
	private String fileName;
	private String courseid;

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getAssignmentid() {
		return assignmentid;
	}

	public void setAssignmentid(String assignmentid) {
		this.assignmentid = assignmentid;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

}
