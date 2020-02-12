package com.web.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.dao.ProductDao;
import com.web.store.model.CompanyBean;
import com.web.store.model.ProductBean;



@Repository
public class ProductDaoImpl implements ProductDao {


	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	// 產品清單頁面
	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getAllProducts() {
		String hql = "From ProductBean where status = '上架中'";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;

	}

	// 產品清單頁面(後台)
	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getAllProductsM() {
		String hql = "From ProductBean";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;

	}

	@Override
	public ProductBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		ProductBean bb = session.get(ProductBean.class, productId);
		return bb;
	}

	@Override
	public void addProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		CompanyBean cb = getCompanyById(product.getCompanyId());
		product.setCompanyBean(cb);
		session.save(product);

	}

	@Override
	public CompanyBean getCompanyById(int companyId) {
		CompanyBean cb = null;
		Session session = factory.getCurrentSession();
		cb = session.get(CompanyBean.class, companyId);
		return cb;
	}

	@Override
	public List<CompanyBean> getCompanyList() {
		String hql = "FROM CompanyBean";
		Session session = factory.getCurrentSession();
		List<CompanyBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT b.category FROM ProductBean b";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<ProductBean> getProductsByCategory(String category) {
		String hql = "FROM ProductBean bb WHERE bb.category = :category";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();
		return list;
	}

	@Override
	public void updateProduct(ProductBean product) {
		if (product.getCoverImage() == null) {
			String hql1 = "UPDATE ProductBean SET title=:newTitle,author=:newAuthor,category=:newCategory,price=:newPrice,stock=:newStock,status=:newStatus WHERE productId=:id";
			Session session1 = factory.getCurrentSession();
			int n = session1.createQuery(hql1).setParameter("newTitle", product.getTitle())
					.setParameter("newAuthor", product.getAuthor()).setParameter("newCategory", product.getCategory())
					.setParameter("newPrice", product.getPrice()).setParameter("newStock", product.getStock())
					.setParameter("newStatus", product.getStatus()).setParameter("id", product.getProductId()).executeUpdate();
		} else {
			String hql2 = "UPDATE ProductBean SET title=:newTitle,author=:newAuthor,category=:newCategory,price=:newPrice,stock=:newStock,coverImage=:newCoverImage,fileName=:newFileName,status=:newStatus WHERE productId=:id";
			Session session2 = factory.getCurrentSession();
			int n = session2.createQuery(hql2).setParameter("newTitle", product.getTitle())
					.setParameter("newAuthor", product.getAuthor()).setParameter("newCategory", product.getCategory())
					.setParameter("newPrice", product.getPrice()).setParameter("newStock", product.getStock())
					.setParameter("newCoverImage", product.getCoverImage()).setParameter("newFileName", product.getFileName())
					.setParameter("newStatus", product.getStatus()).setParameter("id", product.getProductId()).executeUpdate();
		}
	}
	
	
	//模糊查詢
	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getkeyQuery(String keyWord) {
		String hql = "From ProductBean pb where pb.title like'"+keyWord+"%'";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	
	//選單查詢
	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getselectQuery(String category) {
		String hql = "From ProductBean pb where pb.category =:category";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();
		return list;
	}
	
	
}
