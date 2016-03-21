package edu.nju.tss.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.AssignmentDao;
import edu.nju.tss.dao.BaseDao;
import edu.nju.tss.model.Assignment;

@Repository
public class AssignmentDaoImpl implements AssignmentDao {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void save(Assignment assignment) {
		baseDao.save(assignment);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Assignment> find(String courseid, String cid) {
		return (List<Assignment>)baseDao.find(courseid, cid, Assignment.class);
	}

}
