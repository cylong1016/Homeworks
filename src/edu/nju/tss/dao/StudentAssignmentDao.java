package edu.nju.tss.dao;

import java.util.List;

import edu.nju.tss.model.StudentAssignment;

public interface StudentAssignmentDao {

	public void save(StudentAssignment sa);

	public StudentAssignment find(String studentid, String assignmentid);

	public List<StudentAssignment> findAssignmentBy(String column, String cid);

	public void update(StudentAssignment sa);
}
