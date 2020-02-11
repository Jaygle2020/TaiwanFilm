package com.web.login.Service;

import java.util.List;

import com.web.login.Model.MembersBean;

public interface MembersService {
	
	void saveMembers(MembersBean mb);
	MembersBean getMemberById(int memberId);
	MembersBean getMemberByBean(MembersBean mb);
	MembersBean login(String email,String pwd);
	public boolean updateMembers(MembersBean member);
	boolean emailExists(String email);
	List<MembersBean> getAllMembers();
}
