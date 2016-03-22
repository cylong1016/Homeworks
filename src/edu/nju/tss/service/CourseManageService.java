package edu.nju.tss.service;

import java.util.List;

import edu.nju.tss.model.Assignment;
import edu.nju.tss.model.Course;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.CourseStudent;
import edu.nju.tss.model.StudentAssignment;
import edu.nju.tss.model.User;

public interface CourseManageService {

	public String setCourse(Course course);

	public List<Course> courseList();

	public void delete(Course course);

	public void update(Course course);

	public Course findCourse(String cid);

	public void addCourseAssistant(String courseid, String assid);

	public CourseAssistants findCourseAssistant(String assid, String courseid);

	public List<User> findAssistant(String cid);

	public void deleteAssistant(String assid, String courseid);

	public void setAssignment(Assignment assignment);

	public List<Assignment> findAssignment(String cid);

	public CourseStudent findCourseStudent(String stuid, String courseid);

	public void addCourseStudent(String courseid, String stuid);

	public List<User> findStudent(String cid);

	public void deleteStudent(String uid, String courseid);

	public void addStudentAssignment(StudentAssignment sa);

	public StudentAssignment findStudentAssignment(String studentid, String assignmentid);

	public List<StudentAssignment> findAllStudentAssignment(String cid);

	public void updateStudentAssignment(StudentAssignment sa);

}
