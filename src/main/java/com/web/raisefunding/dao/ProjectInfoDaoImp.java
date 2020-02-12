package com.web.raisefunding.dao;

import java.io.Serializable;
import java.sql.SQLException;

import javax.persistence.Query;

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
		String hql = "update ProjectInfoBean i set i.projectTittle = :projectTittle,"+
					"i.innerText = :innerText, i.photoCount =:photoCount,"+
					"i.imgName01 = :imgName01,i.image01 =:image01,"+
					"i.imgName02 = :imgName02,i.image02 =:image02,"+
					"i.imgName03 = :imgName03,i.image03 =:image03,"+
					"i.imgName04 = :imgName04,i.image04 =:image04"+
					"where i.projectId = :projId";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql).setParameter("projectTittle", infoBean.getProjectTittle())
				.setParameter("innerText", infoBean.getInnerText() ).setParameter("photoCount",infoBean.getPhotoCount())
				.setParameter("imgName01",infoBean.getImgName01() ).setParameter("image01",infoBean.getImage01() )
				.setParameter("imgName02",infoBean.getImgName02() ).setParameter("image02",infoBean.getImage02() )
				.setParameter("imgName03",infoBean.getImgName03()).setParameter("image03",infoBean.getImage03() )
				.setParameter("imgName04",infoBean.getImgName04() ).setParameter("image04",infoBean.getImage04() )
				.setParameter("projId",infoBean.getProjBean().getProjectId() );
		query.executeUpdate();		
		n++;
		return n;
	}

	@Override
	public ProjectInfoBean getProjectInfo(Integer projectId) {
		ProjectInfoBean infoBean = new ProjectInfoBean();
		Session session = factory.getCurrentSession();
		String hql = "from ProjectInfoBean where projectId = :projId";
		try {
			 infoBean = (ProjectInfoBean) session.createQuery(hql).setParameter("projId", projectId)
					   .getSingleResult();
		} catch (Exception e) {
		e.printStackTrace(); System.out.println("these is no projectInfo");
		}
		return infoBean;
	}

}
