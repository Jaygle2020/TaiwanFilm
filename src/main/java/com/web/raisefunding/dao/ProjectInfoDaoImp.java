package com.web.raisefunding.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.raisefunding.model.ProjectInfoBean;
@Repository 
public class ProjectInfoDaoImp implements Serializable, ProjectInfoDao {

	private static final long serialVersionUID = 1L;
	@Autowired
	SessionFactory factory;
	

	@Override
	public int createProjInfo(ProjectInfoBean infoBean) {
		int n =0;
		Session session = factory.getCurrentSession();
		session.save(infoBean);
		n++;
		return n;
	}

	@Override
	public int updateProjInfo(ProjectInfoBean infoBean) {
		int n =0;
		Session session = factory.getCurrentSession();
		session.save(infoBean);
		n++;
		return n;
	}

	@Override
	public ProjectInfoBean getProject(Integer projectId) {
		Session session = factory.getCurrentSession();
		String hql = "from ProjectInfoBean where projectId = :projId";
		ProjectInfoBean infoBean = (ProjectInfoBean) session.createQuery(hql).setParameter("projId", projectId)
								   .getResultList();
		return infoBean;
	}

}
