package com.web.login.Dao.Impl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.login.Dao.MembersDao;
import com.web.login.Model.MembersBean;

@Repository
public class MembersDaoImpl implements MembersDao {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory= factory;
	}
	@Override
	public void addMember(MembersBean mb) {		
		Session session = factory.getCurrentSession();
		session.save(mb);	
	}
	
	@Override
	public MembersBean getMemberById(int memberId) {
		MembersBean mb = null;
	    Session session = factory.getCurrentSession();
	    String hql="FROM MembersBean mb WHERE mb.memberId = :id";
	    try {
//	    	mb = session.get(MembersBean.class, memberId);
			mb = (MembersBean) session.createQuery(hql)
					.setParameter("id",memberId)
					.getSingleResult();
		} catch (NoResultException e) {
			System.out.println("查無紀錄");// 表示查無紀錄
		}
	    return mb;
	}

	@Override
	public MembersBean getMemberByBean(MembersBean mb) {
		MembersBean member = null;
	    Session session = factory.getCurrentSession();
	    String hql="FROM MembersBean mb WHERE mb.email = :email";
	    try {
			member = (MembersBean) session.createQuery(hql)
					.setParameter("email",mb.getEmail())
					.getSingleResult();
		} catch (NoResultException e) {
			System.out.println("查無紀錄");// 表示查無紀錄
		}
	    return member;
	}
	@Override
	public MembersBean login(String acc, String pwd) {
		String hql="form MembersBean where account = :account and password = :password";
		MembersBean  member = null;
		Session session = factory.getCurrentSession();
		try {
			member = (MembersBean) session.createQuery(hql)
					.setParameter("account", acc)
					.setParameter("password", pwd)
					.getSingleResult();
		}catch (Exception e) {
			member = null;
		}
		return member;
	}
	@Override
	public boolean updateMembers(MembersBean member) {
		String hql = "from MembersBean where email = :email";
		Session session = factory.getCurrentSession();
		MembersBean mem = (MembersBean) session.createQuery(hql)
				.setParameter("email", member.getEmail())
				.getSingleResult();
			mem.setMemberName(member.getMemberName());
			mem.setEmail(member.getEmail());
			mem.setGender(member.getGender());
			mem.setBirthDay(member.getBirthDay());
			mem.setMemberImage(member.getMemberImage());
			mem.setFileName(member.getFileName());
			System.out.println("Dao :"+ member.getmemImage());
		session.update(mem);
		return true;
	}
}
