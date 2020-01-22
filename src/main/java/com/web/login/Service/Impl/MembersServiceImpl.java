package com.web.login.Service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.login.Dao.MembersDao;
import com.web.login.Model.MembersBean;
import com.web.login.Service.MembersService;

@Service
public class MembersServiceImpl implements MembersService {
	
	@Autowired
	MembersDao dao;
	
	@Transactional
	@Override
	public void saveMembers(MembersBean mb) {	
		 dao.addMember(mb);
	}

	@Override
	public MembersBean getMemberById(int memberId) {
		return dao.getMemberById(memberId);
	}
	@Transactional
	@Override
	public MembersBean getMemberByBean(MembersBean mb) {
		return dao.getMemberByBean(mb);
	}
}
