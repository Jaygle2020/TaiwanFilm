package com.web.message.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.web.login.Model.MembersBean;

@Entity
@Table(name = "Messages")
public class MessageBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageId;
	private String messageContent;
	private String createDate;
	private Integer messageLike;
	private Integer messageDelete;
	private String messageTitle;

	@Column(columnDefinition = "TEXT")
//	private String innerText;
//	private Integer photoCount;
//	private String img01;
//	private byte[] image01;
//	private String img02;
//	private byte[] image02;
//	private String img03;
//	private byte[] image03;
//	private String img04;
//	private byte[] image04;
	public Integer getMessageDelete() {
		return messageDelete;
	}

	public void setMessageDelete(Integer messageDelete) {
		this.messageDelete = messageDelete;
	}

	public Integer getMessageLike() {
		return messageLike;
	}

	public void setMessageLike(Integer messageLike) {
		this.messageLike = messageLike;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	private String messageCategory;

	@Transient
	private String priceStr = null;
	@Transient
	private Double discount;

	@Transient
	private String discountStr;

	@Transient
	private MultipartFile productImage;

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "memberId", referencedColumnName = "memberId")
	private MembersBean memberBean;

	public MembersBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MembersBean memberBean) {
		this.memberBean = memberBean;
	}

	public MessageBean(Integer messageId, String messageTitle, String messageContent, double discount,
			String messageCategory, Integer memberId, String createDate, Integer messageLike, Integer messageDelete) {
		this.messageId = messageId;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
		this.discount = discount;
		this.messageCategory = messageCategory;
		this.messageLike = messageLike;

		this.createDate = createDate;
		this.messageDelete = messageDelete;
	}

	public MessageBean(Integer messageId, String messageTitle, String messageContent, Double discount,
			String messageCategory, Integer memberId, String createDate, Integer messageLike) {
		this.messageId = messageId;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
		this.discount = discount;
		this.messageCategory = messageCategory;
		this.messageLike = messageLike;
		this.createDate = createDate;
	}

	public MessageBean() {
	}

	public String getPriceStr() {
		return priceStr;
	}

	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) { // 0.8, 0.75
		if (discount == null) {
			this.discount = 1.0;
			discountStr = "";
			return;
		}
		this.discount = discount;

		if (discount == 1) {
			discountStr = "";
		} else {
			int dnt = (int) (discount * 100);
			if (dnt % 10 == 0) {
				discountStr = (dnt / 10) + "折";
			} else {
				discountStr = " " + dnt + "折";
			}

		}
	}

	public String getDiscountStr() {
		return discountStr;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageCategory() {
		return messageCategory;
	}

	public void setMessageCategory(String messageCategory) {
		this.messageCategory = messageCategory;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

//	public String getInnerText() {
//		return innerText;
//	}

//	public void setInnerText(String innerText) {
//		this.innerText = innerText;
//	}
//
//	public String getImg01() {
//		return img01;
//	}
//
//	public void setImg01(String img01) {
//		this.img01 = img01;
//	}
//
//	public String getImg02() {
//		return img02;
//	}
//
//	public void setImg02(String img02) {
//		this.img02 = img02;
//	}
//
//	public String getImg03() {
//		return img03;
//	}
//
//	public void setImg03(String img03) {
//		this.img03 = img03;
//	}
//
//	public String getImg04() {
//		return img04;
//	}
//
//	public void setImg04(String img04) {
//		this.img04 = img04;
//	}
//
//
//	public byte[] getImage01() {
//		return image01;
//	}
//
//	public void setImage01(byte[] image01) {
//		this.image01 = image01;
//	}
//
//	public byte[] getImage02() {
//		return image02;
//	}
//
//	public void setImage02(byte[] image02) {
//		this.image02 = image02;
//	}
//
//	public byte[] getImage03() {
//		return image03;
//	}
//
//	public void setImage03(byte[] image03) {
//		this.image03 = image03;
//	}
//
//	public byte[] getImage04() {
//		return image04;
//	}
//
//	public void setImage04(byte[] image04) {
//		this.image04 = image04;
//	}
//
//	public Integer getPhotoCount() {
//		return photoCount;
//	}
//
//	public void setPhotoCount(Integer photoCount) {
//		this.photoCount = photoCount;
//	}


}
