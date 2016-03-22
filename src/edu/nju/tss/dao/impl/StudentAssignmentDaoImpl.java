package edu.nju.tss.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.BaseDao;
import edu.nju.tss.dao.StudentAssignmentDao;
import edu.nju.tss.model.StudentAssignment;

@Repository
public class StudentAssignmentDaoImpl implements StudentAssignmentDao {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void save(StudentAssignment sa) {
		baseDao.save(sa);
	}

	@Override
	public StudentAssignment find(String studentid, String assignmentid) {
		Session session = baseDao.getSession();
		String hql = "from StudentAssignment sa where studentid=? and assignmentid=?";
		Query query = session.createQuery(hql);
		query.setString(0, studentid);
		query.setString(1, assignmentid);
		@SuppressWarnings("unchecked")
		List<StudentAssignment> saList = query.list();
		if(saList.size() != 0) {
			return saList.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<StudentAssignment> findAssignmentBy(String column, String cid) {
		return (List<StudentAssignment>)baseDao.find(column, cid, StudentAssignment.class);
	}

	@Override
	public void update(StudentAssignment sa) {
		baseDao.update(sa);
	}

}
