package edu.nju.tss.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.tss.dao.BaseDao;

@Repository
public class BaseDaoImpl implements BaseDao {

	/**
	 * Autowired 自动装配 相当于get() set()
	 */
	@Autowired
	protected SessionFactory sessionFactory;

	/**
	 * gerCurrentSession 会自动关闭session，使用的是当前的session事务
	 * @see edu.nju.tss.dao.BaseDao#getSession()
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * openSession 需要手动关闭session 意思是打开一个新的session
	 * @see edu.nju.tss.dao.BaseDao#getNewSession()
	 */
	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}

	/**
	 * 根据 id 查询信息
	 * @param id
	 * @return
	 * @see edu.nju.tss.dao.BaseDao#load(java.lang.Class, java.lang.String)
	 */
	public Object load(Class<?> c, String id) {
		Session session = getSession();
		return session.get(c, id);
	}

	/**
	 * 获取所有信息
	 * @param c
	 * @return
	 * @see edu.nju.tss.dao.BaseDao#getAllList(java.lang.Class)
	 */
	public List<?> getAllList(Class<?> c) {
		String hql = "from " + c.getName();
		Session session = getSession();
		return session.createQuery(hql).list();

	}

	/**
	 * 获取总数量
	 * @param c
	 * @return
	 * @see edu.nju.tss.dao.BaseDao#getTotalCount(java.lang.Class)
	 */
	public Long getTotalCount(Class<?> c) {
		Session session = getNewSession();
		String hql = "select count(*) from " + c.getName();
		Long count = (Long)session.createQuery(hql).uniqueResult();
		session.close();
		return count != null ? count.longValue() : 0;
	}

	/**
	 * 保存
	 * @param bean
	 * @see edu.nju.tss.dao.BaseDao#save(java.lang.Object)
	 */
	public void save(Object bean) {
		try {
			Session session = getNewSession();
			session.save(bean);
			session.flush();
			session.clear();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新
	 * @param bean
	 * @see edu.nju.tss.dao.BaseDao#update(java.lang.Object)
	 */
	public void update(Object bean) {
		Session session = getNewSession();
		session.update(bean);
		session.flush();
		session.clear();
		session.close();
	}

	/**
	 * 删除
	 * @param bean
	 * @see edu.nju.tss.dao.BaseDao#delete(java.lang.Object)
	 */
	public void delete(Object bean) {

		Session session = getNewSession();
		session.delete(bean);
		session.flush();
		session.clear();
		session.close();
	}

	/**
	 * 根据ID删除
	 * @param c 类
	 * @param id ID
	 * @see edu.nju.tss.dao.BaseDao#delete(java.lang.Class, java.lang.String)
	 */
	public void delete(Class<?> c, String id) {
		Session session = getNewSession();
		Object obj = session.get(c, id);
		session.delete(obj);
		flush();
		clear();
	}

	/**
	 * 批量删除
	 * @param c 类
	 * @param ids ID 集合
	 * @see edu.nju.tss.dao.BaseDao#delete(java.lang.Class, java.lang.String[])
	 */
	public void delete(Class<?> c, String[] ids) {
		for(String id : ids) {
			Object obj = getSession().get(c, id);
			if (obj != null) {
				getSession().delete(obj);
			}
		}
	}
}
