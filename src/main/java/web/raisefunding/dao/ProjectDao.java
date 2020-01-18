package web.raisefunding.dao;

import web.raisefunding.model.ProjectBean;


public interface ProjectDao {
public int createProject(ProjectBean projBean);
public int updateProject(ProjectBean projBean) ;
public ProjectBean getProject(Integer projectId);
}
