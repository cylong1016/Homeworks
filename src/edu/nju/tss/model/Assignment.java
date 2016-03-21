package edu.nju.tss.model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Assignment extends ID implements Comparable<Assignment> {

	/** serialVersionUID */
	private static final long serialVersionUID = 6853331754454787934L;

	private String courseid;
	private String deadline;
	private String correctDeadline;
	private String format;
	private String score;
	private String filePath;
	private String fileName;
	@Column(columnDefinition = "TEXT")
	private String description;

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getCorrectDeadline() {
		return correctDeadline;
	}

	public void setCorrectDeadline(String correctDeadline) {
		this.correctDeadline = correctDeadline;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int compareTo(Assignment a) {
		return -this.getDeadline().compareTo(a.getDeadline());
	}
}
