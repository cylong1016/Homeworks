package edu.nju.tss.dao;

import java.util.List;

import edu.nju.tss.model.Assignment;

public interface AssignmentDao {

	public void save(Assignment assignment);

	public List<Assignment> find(String courseid, String cid);

}
