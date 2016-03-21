package edu.nju.tss.dao;

import java.util.List;

import edu.nju.tss.model.CourseStudent;

public interface CourseStudentDao {

	public void save(CourseStudent cs);

	public CourseStudent findCourseStudent(String stuid, String courseid);

	public List<CourseStudent> findStudent(String cid);

	public void delete(String stuid, String courseid);
}
