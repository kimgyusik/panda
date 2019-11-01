package com.kh.panda.seller.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.ProductAttachment;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.vo.Seller;
import com.kh.panda.streaming.model.vo.Streaming;
import com.sun.media.jfxmedia.logging.Logger;

@Repository("sDao")
public class SellerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insertSeller(Seller s) {
		
		return sqlSession.insert("sellerMapper.insertSeller", s);
		
	}


	public Seller loginSeller(Seller s) {
		
		return sqlSession.selectOne("sellerMapper.loginSeller", s);
	}


	public int sIdCheck(String sId) {
		return sqlSession.selectOne("sellerMapper.sIdCheck", sId);
	}


	
	 public String findsId(String sEmail) { return
	 sqlSession.selectOne("sellerMapper.findsId", sEmail); }
	 


	public int updateSeller(Seller s) {
		return sqlSession.update("sellerMapper.updateSeller", s);
	}


	public int getListCount(int sNo) {
		int listCount = 0;
		listCount = sqlSession.selectOne("sellerMapper.getListCount", sNo);
		return listCount;
	}


	public ArrayList<ProductOption> selectList(PageInfo pi, int sNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", sNo, rowBounds);
	}
	
	public int deleteSeller(Seller s) {
		return sqlSession.update("sellerMapper.deleteSeller", s);
	}


	public ArrayList<Category> selectcList() {
		return (ArrayList)sqlSession.selectList("productMapper.selectcList");
	}





	public int emailConfirm(String sId) {
		
		return sqlSession.update("sellerMapper.emailConfirm", sId);
	}


	public int insertProduct(Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
	}


	public int insertPaList(ProductAttachment pa) {
		return sqlSession.insert("productMapper.insertPa", pa);
	}


	public int insertPoList(ProductOption po) {
		return sqlSession.insert("productMapper.insertPo", po);
	}


	public Seller updateConfirm(Seller s) {
		return sqlSession.selectOne("sellerMapper.updateConfirm", s);
	}


	public Product selectProduct(int pId) {
		return sqlSession.selectOne("productMapper.selectProduct", pId);
	}


	public ArrayList<ProductAttachment> selectPa(Product p) {
		return (ArrayList)sqlSession.selectList("productMapper.selectPa", p);
	}


	public ArrayList<ProductOption> selectPo(Product p) {
		return (ArrayList)sqlSession.selectList("productMapper.selectPo", p);
	}
	public int newPassword(Seller s) {
		return sqlSession.update("sellerMapper.newPwd", s);
	}


	public int oListCount(int sNo) {
		int oListCount = 0;
		oListCount = sqlSession.selectOne("sellerMapper.oListCount", sNo);
		return oListCount;
	}


	public ArrayList<Payment> selectoList(PageInfo pi, int sNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("paymentMapper.selectoList", sNo, rowBounds);
	}
	
	public int updateProduct(Product p) {
		return sqlSession.update("productMapper.updateProduct", p);
	}


	public int updatePaList(ProductAttachment pa) {
		return sqlSession.update("productMapper.updatePa", pa);
	}


	public int deleteOption(int pId) {
		return sqlSession.update("productMapper.deleteOp", pId);
	}


	public int insertPoList2(ProductOption po) {
		return sqlSession.insert("productMapper.insertPo2", po);
	}


	public int deletePa(int pId) {
		return sqlSession.update("productMapper.deletePa", pId);
	}
	
	public int insertPaList2(ProductAttachment pa) {
		return sqlSession.insert("productMapper.insertPa2", pa);
	}


	public int delUpdate(Payment pm) {
		return sqlSession.update("paymentMapper.delUpdate", pm);
	}
	public int updatestPrice(ProductOption po) {
		return sqlSession.update("productMapper.updatestPrice", po);
	}


	public int insertStreaming(Streaming st) {
		return sqlSession.insert("sellerMapper.insertStreaming", st);
	}


	public Streaming selectStreaming(int sNo) {
		return sqlSession.selectOne("sellerMapper.selectStreaming", sNo);
	}


	public int updatestNo(Product p) {
		return sqlSession.update("productMapper.updatestNo", p);
	}


	public Streaming selectStreamingToStNo(int stNo) {
		return sqlSession.selectOne("sellerMapper.selectStreamingStNO", stNo);
	}


	






	
	
	
	

}
