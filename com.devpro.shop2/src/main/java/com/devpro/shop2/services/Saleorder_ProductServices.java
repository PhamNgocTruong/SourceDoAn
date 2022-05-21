package com.devpro.shop2.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop2.entities.Products;
import com.devpro.shop2.entities.SaleorderProducts;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import dto.Constants;
import dto.ModelSearch;
@Service
public class Saleorder_ProductServices extends BaseServices<SaleorderProducts> implements Constants{

	@Override
	protected Class<SaleorderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleorderProducts.class;
	}
	
//	  public List<SaleorderProducts> findbyProductId(int saleorderId) { 
//		  String sql ="SELECT tbl_saleorder_products.saleorder_id,"
//		  		+ "title,price,avatar FROM tbl_products "
//		  		+ "right join tbl_saleorder_products on tbl_products.id = tbl_saleorder_products.product_id";
//	  return super.executeNativeSql(sql, -1); 
//	  }
	public List<SaleorderProducts> findAllActive() {
		String sql = "select * from tbl_saleorder_products where status = 1";
		return super.executeNativeSql(sql,-1);
	}
	public List<SaleorderProducts> findbyIdSaleorder(int SaleOrderId) {
		String sql = "select * from tbl_saleorder_products where saleorder_id ="+ SaleOrderId ;
		return super.executeNativeSql(sql,-1);
	}
	
	public List<SaleorderProducts> findListById(int id){
		String sql = "SELECT * FROM tbl_saleorder_products t WHERE t.saleorder_id=" + id;
		return (List<SaleorderProducts>) executeNativeSql(sql, -1);
	}
	public List<SaleorderProducts> search(ModelSearch searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and (p.customer_name like '%" + searchModel.getKeyword() + "%'" + " or p.customer_address like '%"
					+ searchModel.getKeyword() + "%'" + " or p.cutomer_email like '%"
					+ searchModel.getKeyword() + "%')";
		}
		
		// chi lay san pham chua xoa
		//sql += " and p.status=1 ";

		return executeNativeSql(sql, searchModel.getPage());
	}
}
