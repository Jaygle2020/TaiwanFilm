package com.web.message.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.login.Model.MembersBean;
import com.web.message.dao.MessageDao;
import com.web.message.model.MessageBean;
import com.web.message.model.ReplyBean;
import com.web.message.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	MessageDao dao;

	@Autowired
	public void setDao(MessageDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public List<ReplyBean> getReplysByMessageId( Integer messageId) {
		return dao.getReplysByMessageId(messageId);
	}
	
	@Transactional
	@Override
	public List<MessageBean> getMessageByTitle(String keyword) {
		return dao.getMessageByTitle(keyword);
	}

	@Transactional
	@Override
	public List<MessageBean> getAllMessages() {
		return dao.getAllMessages();
	}
	@Transactional
	@Override
	public List<ReplyBean> getAllReplys() {
		return dao.getAllReplys();
	}
	

	@Transactional
	@Override
	public List<String> getAllCategories() {
		return dao.getAllCategories();
	}

	@Transactional
	@Override
	public List<MessageBean> getMessagesByCategory(String messageCategory) {
		return dao.getMessagesByCategory(messageCategory);
	}

	@Transactional
	@Override
	public MessageBean getMessageById(int messageId) {
		return dao.getMessageById(messageId);
	}
	
	@Transactional
	@Override
	public ReplyBean getReplyByMessageId(int messageId) {
		return dao.getReplyByMessageId(messageId);
	}
	
	@Transactional
	@Override
	public ReplyBean getReplyById(int replyId) {
		return dao.getReplyById(replyId);
	}


	
	@Transactional
	@Override
	public void addMessage(MessageBean message) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String createDate = sdFormat.format(date);
		message.setCreateDate(createDate);
		dao.addMessage(message);
	}

	@Transactional
	@Override
	public void updateMessage(MessageBean message) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String createDate = sdFormat.format(date);
		message.setCreateDate(createDate);
		dao.updateMessage(message);
	}
	@Transactional
	@Override
	public void updateLike(MessageBean message) {
		dao.updateLike(message);
	}
	@Transactional
	@Override
	public void updateReply(ReplyBean reply) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String replyDate = sdFormat.format(date);
		reply.setReplyDate(replyDate);
		dao.updateReply(reply);
	}
	@Transactional
	@Override
	public MembersBean getMemberNameById(int memberId) {
		return dao.getMemberNameById(memberId);
	}

	
	@Transactional
	@Override
	public void deleteReply(Integer replyId ) {
		dao.deleteReply(replyId);
	}
	@Transactional
	@Override
	public void reportReply(ReplyBean reply ) {
		dao.reportReply(reply);
	}
	@Transactional
	@Override
	public void deleteMessage(Integer messageId ) {
		dao.deleteMessage(messageId);
	}
}