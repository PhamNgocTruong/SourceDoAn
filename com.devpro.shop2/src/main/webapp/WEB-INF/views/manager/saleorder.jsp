<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>${projectTitle }</title>
	<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
	
	<jsp:include page="/WEB-INF/views/user/layouts/css.jsp"></jsp:include>
	<link rel="stylesheet" href="${base}/user/style/giaodienadmin.css">
</head>
<style>
.ds{
margin-left: 50px;
margin-top: 30px;
}
.tit{
font-size: 24px;
background-color: #1d4d83;
color: white;
}
.button-back{
margin-top: 30px;
}
</style>

<body>
	<div class="main">
		<div class="sidebar d-none d-lg-block">
			<div class="logo">
				<a href="${base }/index">
				<img src="${base}/user/images/logo.png"></a>
			</div>

			<div class="menu_sidebar">
				<ul>
					<li>
						<a href="#"><span><i class="fas fa-tachometer-alt"></i> Dashboard</span></a>
					</li>
					<li>
						<a href="${base }/admin/category"><span><i class="fas fa-tasks"></i> Quản Lý Danh Mục</span></a>
					</li>
					<li>
						<a href="${base }/admin/search-product?page=1"><span><i class="fas fa-chart-line"></i> Quản Lý Sản Phẩm</span></a>
					</li>
					<li>
						<a href="${base }/admin/contact"><span><i class="fab fa-wpforms"></i> Quản Lý Liên Hệ</span></a>
					</li>
					<li>
						<a href="${base }/admin/saleorder"><span><i class="far fa-file"></i> Quản Lý Đơn Hàng</span></a>
					</li>
					<li>
						<a href="${base }/admin/user"><span><i class="far fa-file"></i> Quản Lý Tài Khoản</span></a>
					</li>
					<!-- <li>
						<a href="#"><span><i class="fas fa-table"></i> Table</span></a>
					</li>
					<li>
						<a href="#"><span><i class="fas fa-project-diagram"></i> Menu Levels</span></a>
					</li>
					<li>
						<a href="#"><span><i class="fab fa-themeisle"></i> Theme Docs</span></a>
					</li> -->

				</ul>
			</div>
		</div>
		<div class="content">
			<div class="header">
				<div class="form_search">
					
					<form method="GET" action="">
					<label class="sr-only" for="input_search">Tìm Kiếm...</label>
				      <div class="input-group">
				        <input type="text" class="form-control" id="input_search" placeholder="Tìm Kiếm...">
				        <div class="input-group-prepend">
				          <button class="input-group-text">
				          	<i class="fas fa-search"></i>
				          </button>
				        </div>
				    </div>
					</form>
				</div>
				
				<div class="account_manage">
					<button class="btn_account">
						 <img src="../images/ban-1.png"/>
						 <div class="username">
					          <c:if test ="${isLogined }"> 
								${userLogined.username }
							  </c:if>
		  				</div>
						 <i class="fas fa-angle-down"></i>
						 <div class="sub_menu" id="submenu_account">
						 	<ul>
						 		<li>
						 			<a href="#">Profile <i class="fas fa-user"></i></a>
						 		</li>
						 		<li>
						 			<a href="#">Reset Password <i class="fas fa-key"></i></a>
						 		</li>
						 		<li>
						 			<a href="#">Setting <i class="fas fa-cog"></i></a>
						 			
						 			
						 		</li>
						 		
							 	<c:if test="${isLogined }">
							 		<li>
							 			<a href="${base }/logout">Log out <i class="fas fa-sign-out-alt"></i></a>
							 		</li>
							 	</c:if>
 					 			</ul>
						 	</div>
						 </button>
				</div>
					
			</div>
			<div class="ds" >
				<p class="tit"><b>QUẢN LÝ HÓA ĐƠN</b></p>
				<p>
				
				<table border="1" >
				 <tr>
				 	<th>ID</th>
					<th>Code</th>
					<!-- <th>ProductName</th>
					<th>Total</th> -->
					<!-- <th>Created Date</th>
					<th>Update Date</th>
					<th>Created By</th>
					<th>Update By</th> -->
					<th>Status</th>
					<th>Customer Name</th>
					<th>Customer Address</th>
					<th>Customer Phone</th>
					<th>Customer Email</th>
					<!-- <th>Seo</th> -->
					<th>Action</th>
				</tr> 
					
				<c:forEach var="saleorder" items="${saleorder}" >
					<tr>
						<td>${saleorder.id}</td>
						<td>${saleorder.code}</td>
						<%-- <td>${cartItems.productName}</td>
						<td>${saleorder.total}</td> --%>
						<%-- <td>${saleorder.createdDate}</td>
						<td>${saleorder.updatedDate}</td>
						<td>${saleorder.createdBy}</td>
						<td>${saleorder.updatedBy}</td> --%>
						<td>${saleorder.status}</td>
						<td>${saleorder.customerName}</td>
						<td>${saleorder.customerAddress}</td>
						<td>${saleorder.customerPhone}</td>
						<td>${saleorder.cutomerEmail}</td>			
						<%-- <td>${saleorder.seo }</td> --%>
						<td>
						<a href="${base }/admin/detail-saleorder/${saleorder.id}" style="color:blue;text-decoration: none;margin-right:10px"><span><i class="fas fa-edit"></i>Chi tiết</span></a>
						<a href="${base }/admin/del-saleorder/${saleorder.id}" style="color:green;text-decoration: none"><span><i class="fas fa-shopping-cart"></i>Lên đơn</span></a>
						<%-- <a href="${base }/admin/del-saleorder/${saleorder.id}" style="color:black;text-decoration: none"><span><i class="fas fa-trash-alt"></i>Chi tiết</span></a>
						 --%>
						</td>
			 			
					</tr>
					</c:forEach>
					
					
				</table>
				<br>
				<%-- <div class="button-back">
							<a href="${base }/admin/giaodienadmin" class="btn btn-back" role="button" 
							style="background-color:black;color:white">Back to Dashboard</a></span>
				</div> --%>
				</p>
			
			</div>
			
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/user/layouts/js.jsp"></jsp:include>


<script type="text/javascript" src="${base }/user/script/giaodienadmin.js"></script>
</html>