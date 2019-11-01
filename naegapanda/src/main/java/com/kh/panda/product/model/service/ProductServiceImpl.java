package com.kh.panda.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.common.PageInfo;
import com.kh.panda.product.model.dao.ProductDao;
import com.kh.panda.product.model.vo.CategoryNumber;
import com.kh.panda.product.model.vo.Product;

@Service("pService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao pDao; 

	@Override
	public int increasepCount(int pId) {
		return pDao.increasepCount(pId);
	}

	@Override
	public int deleteOption(int oNo) {
		return pDao.deleteOption(oNo);
	}

	@Override
	public ArrayList<Product> search(String keyword, PageInfo pi, int category) {
		return pDao.search(keyword, pi, category);
	}

	@Override
	public int getListCount(int category) {
		return pDao.getListCount(category);
	}

	@Override
	public ArrayList<Product> selectpList(PageInfo pi, int category) {
		return pDao.selectpList(pi, category);
	}

	@Override
	public int getListCount(String keyword, int category) {
		return pDao.getListCount(keyword,category);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public ArrayList<Product> HotTopList(int category) {
		return pDao.HotTopList(category);
	}
	@Override
	public ArrayList<Product> Hot1List() {
		CategoryNumber cn = new CategoryNumber(1, 9);
		return pDao.HotList(cn);
	}
	@Override
	public ArrayList<Product> Hot2List() {
		CategoryNumber cn = new CategoryNumber(10, 19);
		return pDao.HotList(cn);
	}
	@Override
	public ArrayList<Product> Hot3List() {
		CategoryNumber cn = new CategoryNumber(20, 28);
		return pDao.HotList(cn);
	}
	@Override
	public ArrayList<Product> Hot4List() {
		CategoryNumber cn = new CategoryNumber(29, 39);
		return pDao.HotList(cn);
	}
	@Override
	public ArrayList<Product> Hot5List() {
		CategoryNumber cn = new CategoryNumber(40, 49);
		return pDao.HotList(cn);
	}
	@Override
	public ArrayList<Product> Hot6List() {
		CategoryNumber cn = new CategoryNumber(50, 58);
		return pDao.HotList(cn);
	}
	
	
	@Override
	public ArrayList<Product> Newest() {
		return pDao.Newest();
	}
	@Override
	public ArrayList<Product> NewTopList(int category) {
		return pDao.NewTopList(category);
	}

	@Override
	public ArrayList<Product> New1List() {
		CategoryNumber cn = new CategoryNumber(1, 9);
		return pDao.NewList(cn);
	}
	public ArrayList<Product> New2List() {
		CategoryNumber cn = new CategoryNumber(10, 19);
		return pDao.NewList(cn);
	}
	public ArrayList<Product> New3List() {
		CategoryNumber cn = new CategoryNumber(20, 28);
		return pDao.NewList(cn);
	}
	public ArrayList<Product> New4List() {
		CategoryNumber cn = new CategoryNumber(29, 39);
		return pDao.NewList(cn);
	}
	public ArrayList<Product> New5List() {
		CategoryNumber cn = new CategoryNumber(40, 49);
		return pDao.NewList(cn);
	}
	public ArrayList<Product> New6List() {
		CategoryNumber cn = new CategoryNumber(50, 58);
		return pDao.NewList(cn);
	}
	
	
	public ArrayList<Product> LiveList(){
		return pDao.LiveList();
	}
	
	@Override
	public ArrayList<Product> random() {
		return pDao.random();
	}

	@Override
	public int oCount(int pId) {
		return pDao.oCount(pId);
	}

	@Override
	public int deleteProduct(int pId) {
		return pDao.deleteProduct(pId);
	}


}
