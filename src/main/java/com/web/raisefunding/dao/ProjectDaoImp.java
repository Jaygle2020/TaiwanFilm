package com.web.raisefunding.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.raisefunding.model.ProjectBean;
@Repository
public class ProjectDaoImp implements ProjectDao {
	SessionFactory factory;
	@Autowired
	public void setSession(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public int createProject(ProjectBean projBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(projBean);
		n++;
		return n;
	}

	@Override
	public int updateProject(ProjectBean projBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(projBean);
		n++;
		return n;
	}

	@Override
	public ProjectBean getProject(Integer projectId) {
		Session session = factory.getCurrentSession();
		ProjectBean projBean = session.get(ProjectBean.class,projectId);
		return projBean ;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getAllProject() {
		Session session = factory.getCurrentSession();
		String hql = "from ProjectBean p,CrowdFundingBean c where p.projectId = c.projectBean.projectId";
		List<Object> list= session.createQuery(hql).getResultList();
		return list;
	}

}
