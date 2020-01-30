package com.web.login.Dao;

import com.web.login.Model.MembersBean;

public interface MembersDao {
	//新增會員
	void addMember(MembersBean mb);
	//抓取單一會員
	MembersBean getMemberById(int memberId);
	//取Bean
	MembersBean getMemberByBean(MembersBean mb);
	//會員登入
	public MembersBean login(String acc, String pwd);

}
