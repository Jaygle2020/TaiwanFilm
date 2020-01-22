package com.web.login.Service;

import com.web.login.Model.MembersBean;

public interface MembersService {
	
	void saveMembers(MembersBean mb);
	MembersBean getMemberById(int memberId);
	MembersBean getMemberByBean(MembersBean mb);
	
}
