package com.web.store.Service;

import com.web.store.Model.MembersBean;

public interface MembersService {
	
	void saveMembers(MembersBean mb);
	MembersBean getMemberById(int memberId);
	MembersBean getMemberByBean(MembersBean mb);
	
}
