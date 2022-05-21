<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!-- directive JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>ChitietSP</title>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="${base}/user/style/chitietsp.css">
</head>
<style>
.menu .icon-menu input{
width: 200px;
}
.size{
margin: 0px;
padding: 0px;
}
.detail_size{
margin-bottom: 15px;
}
.detail_size span{
display: inline-block;
padding:5px 10px;
border: 1px solid #dddddd;
margin: 12px 10px 12px 0;
font-size: 12px;
cursor: pointer; 
}
.detail_size span:hover{
background-color: black;
color: white;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/layouts/header.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/user/layouts/menu.jsp"></jsp:include>
	
     
	<div class="top bg-primary" style="height: 10vh;"></div>

	<div class="container" >
		<div class="row bg-light">
			
			<div class="col-md-5">
				<img alt="" src="${base }/upload/${product.avatar }" style="width: 300px; height: 400px;">
			</div>
			<div class="col-md-7">
				<h2 class="Title" style="font-weight: bold;">${product.title }</h2>
				<h3 class="Title" style="color: red">${product.price_sale } VND</h3>
				<p class="shortDescription">${product.short_description }</p>
				<div class="size">
					<p style="font-weight: bold">Size:</p>
					<div class="detail_size">
						<span id="btn1" onclick="choose()">S </span>
						<span id="btn2" onclick="choose()">M </span>
						<span id="btn3" onclick="choose()">L </span>
						<span id="btn4" onclick="choose()">XL </span>
					</div>
				</div>
				<div class="col-md-12 detail border-top-1" style="padding-left:0">
				<h4>${product.details }</h4>
				</div>
				<a href="#" style="border-radius: 10px;background-color: red;" class="btn btn-primary" onclick="addToCart(${product.id }, 1)">Thêm vào giỏ hàng</a>
			</div>
			
			
		</div>
		
		
	
	</div>
	
	
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>


<jsp:include page="/WEB-INF/views/user/layouts/footer.jsp"></jsp:include>


	
</body>
</script>
<jsp:include page="/WEB-INF/views/user/layouts/js.jsp"></jsp:include>

<script type="text/javascript" src="${base }/user/script/chitietsp.js"></script>
<script type="text/javascript">
	addToCart = function(productId, quanlity){
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
				productId : productId, // lay theo id
				quanlity : quanlity
			};

			// $ === jQuery
			// json == javascript object
			$.ajax({
				url : "/cart/add",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					total = jsonResult.totalItems;
					$("#totalCartItemId").html(total);
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
			
		}	
	choose = function(){
		var button1 = document.getElementById("btn1");
		var button2 = document.getElementById("btn2");
		var button3 = document.getElementById("btn3");
		var button4 = document.getElementById("btn4");
		button1.onclick = function () {
			button1.style.background = "black";
			button1.style.color = "white";
		};
		button2.onclick = function () {
			button2.style.background = "black";
			button2.style.color = "white";
		};
		button3.onclick = function () {
			button3.style.background = "black";
			button3.style.color = "white";
		};
		button4.onclick = function () {
			button4.style.background = "black";
			button4.style.color = "white";
		};
	}
	</script>

</html>