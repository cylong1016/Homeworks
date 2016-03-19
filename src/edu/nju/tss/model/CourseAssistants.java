package edu.nju.tss.model;

import javax.persistence.Entity;

/**
 * 课程助教的表
 * @author cylong
 * @version 2016年3月20日 上午2:59:54
 */
@Entity
public class CourseAssistants extends ID {

	/** serialVersionUID */
	private static final long serialVersionUID = 5547671901321479961L;

	private String assistantid;
	private String courseid;

	public String getAssistantid() {
		return assistantid;
	}

	public void setAssistantid(String assistantid) {
		this.assistantid = assistantid;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

}