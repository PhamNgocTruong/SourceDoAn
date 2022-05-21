package com.devpro.shop2.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop2.entities.Saleorder;

import dto.ModelSearch;

@Service
public class SaleOrderSercive extends BaseServices<Saleorder>{

	@Override
	protected Class<Saleorder> clazz() {
		return Saleorder.class;
	}
	public List<Saleorder> findAllActive() {
		String sql = "select * from tbl_saleorder where status = 1";
		return super.executeNativeSql(sql,-1);
	}
	public List<Saleorder> search(ModelSearch searchModel) {

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
