package com.web.login.Dao;

import com.web.store.Model.MembersBean;

public interface MembersDao {
	
	void addMember(MembersBean mb);

	MembersBean getMemberById(int memberId);

	MembersBean getMemberByBean(MembersBean mb);
	

}
