package com.web.login.Dao.Impl;

import java.util.List;

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
		System.out.println("取出信箱 : "+member.getEmail());
		MembersBean mem = (MembersBean) session.createQuery(hql)
				.setParameter("email", member.getEmail())
				.getSingleResult();
//		System.out.println("member.getMemberName()印出"+ member.getMemberName() );
//		System.out.println("member.getEmail()印出"+ member.getEmail());
//		System.out.println("member.getGender()印出"+member.getGender());
//		System.out.println("member.getBirthDay()印出"+member.getBirthDay());
//		System.out.println("member.getMemberImage()印出"+member.getMemberImage());
//		System.out.println("member.getFileName()印出"+ member.getFileName());
//		System.out.println("member.getPassword()印出"+ member.getPassword());
			mem.setMemberName(member.getMemberName());
			mem.setEmail(member.getEmail());
			mem.setGender(member.getGender());
			mem.setBirthDay(member.getBirthDay());
			mem.setMemberImage(member.getMemberImage());
			mem.setFileName(member.getFileName());
			if(member.getPassword() !="") {
				mem.setPassword(member.getPassword());
			}
			System.out.println("Dao取出照片 :"+ member.getmemImage());
		session.update(mem);
		return true;
	}
	@Override
	public boolean emailExists(String email) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String queryString = "from MembersBean where email = :email";
		List<?> list = session.createQuery(queryString).setParameter("email", email).list();
		if (!list.isEmpty()) {
			exist = true;
		}
		return exist;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<MembersBean> getAll() {
		String hql = "FROM MembersBean  where memberMode ='1'";
		Session session = factory.getCurrentSession();
		List<MembersBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MembersBean> getNotMember() {
		String hql = "FROM MembersBean  where memberMode ='1'";
		Session session = factory.getCurrentSession();
		List<MembersBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	@Override
	public MembersBean get(Integer id) {
		return factory.getCurrentSession().get(MembersBean.class, id);
	}
	
}
