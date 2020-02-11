package com.web.login.Service.Impl;

import java.util.List;

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

	@Transactional
	@Override
	public MembersBean getMemberById(int memberId) {
		return dao.getMemberById(memberId);
	}
	@Transactional
	@Override
	public MembersBean getMemberByBean(MembersBean mb) {
		return dao.getMemberByBean(mb);
	}
	
	@Transactional
	@Override
	public MembersBean login(String email, String pwd) {
		return dao.login(email,pwd);
	}
	@Transactional
	@Override
	public boolean updateMembers(MembersBean member) {
		return dao.updateMembers(member);		
	}
	@Transactional	
	@Override
	public boolean emailExists(String email) {
		return dao.emailExists(email);
	}
	@Transactional	
	@Override
	public List<MembersBean> getAllMembers() {
		return dao.getAll();
	}
}