package edu.nju.tss.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.tss.dao.AssignmentDao;
import edu.nju.tss.dao.CourseAssistantsDao;
import edu.nju.tss.dao.CourseDao;
import edu.nju.tss.dao.CourseStudentDao;
import edu.nju.tss.dao.StudentAssignmentDao;
import edu.nju.tss.dao.UserDao;
import edu.nju.tss.model.Assignment;
import edu.nju.tss.model.Course;
import edu.nju.tss.model.CourseAssistants;
import edu.nju.tss.model.CourseStudent;
import edu.nju.tss.model.StudentAssignment;
import edu.nju.tss.model.User;
import edu.nju.tss.service.CourseManageService;

@Service
public class CourseManageServiceImpl implements CourseManageService {

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private CourseAssistantsDao courseAssistantsDao;
	@Autowired
	private CourseStudentDao courseStudentDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private AssignmentDao assignmentDao;
	@Autowired
	private StudentAssignmentDao studentAssignmentDao;

	@Override
	public String setCourse(Course course) {
		courseDao.save(course);
		return null;
	}

	@Override
	public List<Course> courseList() {
		return courseDao.list();
	}

	@Override
	public void delete(Course course) {
		courseDao.delete(course);
	}

	@Override
	public void update(Course course) {
		courseDao.update(course);
	}

	@Override
	public Course findCourse(String cid) {
		return courseDao.find(cid);
	}

	@Override
	public void addCourseAssistant(String courseid, String assid) {
		CourseAssistants ca = new CourseAssistants();
		ca.setAssistantid(assid);
		ca.setCourseid(courseid);
		courseAssistantsDao.save(ca);
	}

	@Override
	public CourseAssistants findCourseAssistant(String assid, String courseid) {
		return courseAssistantsDao.findCourseAssistant(assid, courseid);
	}

	@Override
	public List<User> findAssistant(String cid) {
		List<CourseAssistants> caList = courseAssistantsDao.findAssistant(cid);
		List<User> assistantList = new ArrayList<User>();
		for(CourseAssistants ca : caList) {
			User user = (User)userDao.find("userid", ca.getAssistantid(), User.class);
			assistantList.add(user);
		}
		return assistantList;
	}

	@Override
	public void deleteAssistant(String assid, String courseid) {
		courseAssistantsDao.delete(assid, courseid);
	}

	@Override
	public void setAssignment(Assignment assignment) {
		assignmentDao.save(assignment);
	}

	@Override
	public List<Assignment> findAssignment(String cid) {
		return assignmentDao.find("courseid", cid);
	}

	@Override
	public CourseStudent findCourseStudent(String stuid, String courseid) {
		return courseStudentDao.findCourseStudent(stuid, courseid);
	}

	@Override
	public void addCourseStudent(String courseid, String stuid) {
		CourseStudent cs = new CourseStudent();
		cs.setStudentid(stuid);
		cs.setCourseid(courseid);
		courseStudentDao.save(cs);
	}
	
	@Override
	public List<User> findStudent(String cid) {
		List<CourseStudent> csList = courseStudentDao.findStudent(cid);
		List<User> studentList = new ArrayList<User>();
		for(CourseStudent cs : csList) {
			User user = (User)userDao.find("userid", cs.getStudentid(), User.class);
			studentList.add(user);
		}
		return studentList;
	}

	@Override
	public void deleteStudent(String uid, String courseid) {
		courseStudentDao.delete(uid, courseid);
	}

	@Override
	public void addStudentAssignment(StudentAssignment sa) {
		studentAssignmentDao.save(sa);
	}

	@Override
	public StudentAssignment findStudentAssignment(String studentid, String assignmentid) {
		return studentAssignmentDao.find(studentid, assignmentid);
	}

	@Override
	public List<StudentAssignment> findAllStudentAssignment(String cid) {
		return studentAssignmentDao.findAssignmentBy("courseid", cid);
	}

	@Override
	public void updateStudentAssignment(StudentAssignment sa) {
		studentAssignmentDao.update(sa);
	}

}
