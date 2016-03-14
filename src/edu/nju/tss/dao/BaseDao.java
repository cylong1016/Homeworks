package edu.nju.tss.dao;

import java.util.List;

import org.hibernate.Session;

public interface BaseDao {

	public Session getSession();

	public Session getNewSession();

	public void flush();

	public void clear();

	public Object load(Class<?> c, String id);

	public List<?> getAllList(Class<?> c);

	public Long getTotalCount(Class<?> c);

	public void save(Object bean);

	public void update(Object bean);

	public void delete(Object bean);

	public void delete(Class<?> c, String id);

	public void delete(Class<?> c, String[] ids);
}
