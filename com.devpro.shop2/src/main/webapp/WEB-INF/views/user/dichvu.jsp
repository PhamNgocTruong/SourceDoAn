<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>${projectTitle}</title>
	<link rel="stylesheet" href="${base}/user/style/style.css">
	<jsp:include page="/WEB-INF/views/user/layouts/css.jsp"></jsp:include>

</head>
<style>
.section form{
margin-left: 700px;
margin-top: 50px;
}
.services{
margin-left: 395px;
margin-top: 50px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/layouts/header.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/views/user/layouts/menu.jsp"></jsp:include>
	
	<div class="services">
		<h3 ><b>Chính sách đổi trả tại Silon</b></h3>
		<h5>QUY ĐỊNH ĐỔI SẢN PHẨM CỦA CỬA HÀNG SILON</h5>
		<p>Silon không nhận đổi trả đối với các sản phẩm không giống như hình ảnh trên website</p>
		<p><b>Quy định đổi hàng:</b></p>
		<h5><b>BƯỚC 1: KIỂM TRA ĐIỀU KIỆN ĐỔI HÀNG</b></h5>
		<p>Tất cả sản  phẩm thỏa mãn tất cả điều kiện sau và không thuộc danh sách sản phẩm không được đổi hàng</p>
		<p><b>Diều kiện:</b></p>
		<p>Hàng đổi trong vòng 7 ngày kể từ khi nhận hàng ( tính theo dấu bưu điên )</p>
		<p>Còn trong tình trạng ban đầu, còn tem, nhãn mác</p>
		<p>Chưa qua giặt, ủi hoặc bị bẩn, hư hỏng</p>
		<p>Đổi sản phẩm trong bao bì có dán mã sản phẩm bên ngoài.</p>
		<p>Đổi sản phẩm cùng Hóa đơn </p>
		<p>Đổi sản phẩm do hư hỏng từ phía Silon</p>
		<h5><b>BƯỚC 2: ĐÓNG GÓI SẢN PHẨM, CHỨNG TỪ VÀ GỬI VỀ SILON </b></h5>
		<p>Quý khách vui lòng đóng gói: Sản phẩm muốn đổi + Hóa đơn  (nếu có) và gửi về Silon theo địa chỉ ở trên đơn hàng</p>
		<h5><b>BƯỚC 3: GỬI HOÀN </b></h5>
		<p>Silon kiểm tra đơn hàng nếu là lỗi từ phía Silon thì bên Silon sẽ chịu toàn bộ chi phí và gửi hàng mới đến cho bạn.</p>
		<p>Trường hợp do quý khách muốn đổi hàng: Quý khách vui lòng thanh toán phí ship đổi hàng + phí tồn hàng  5% giá trị hàng. Nếu đổi hàng có giá trị thấp hơn thì tiền thừa của quý khách sẽ được lưu lại Silon để khấu trừ cho những lần mua hàng tiếp theo.</p>
		<p>Quý khách vui lòng xem rõ thông số sản phẩm trước khi mua hàng, tránh trường hợp mua về bị rộng quá hoặc chật quá không mặc được phải đổi lại.</p>
		<p>Cám ơn sự tin tưởng và ủng hộ của Quý khách!</p>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/user/layouts/footer.jsp"></jsp:include>

</body>	
<jsp:include page="/WEB-INF/views/user/layouts/js.jsp"></jsp:include>
<!-- custom javascipt -->
 <script type="text/javascript">
        	function saveContact() {
        		// javascript object.
        		// data la du lieu ma day len action cua controller
				let data = {
					txtEmail: $("#txtEmail").val(), // lay theo id
					txtContent: $("#txtContent").val(), // lay theo id
        		};
        		
        		
				// $ === jQuery
				// json == javascript object
				$.ajax({
					url : "/contact-ajax",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
		
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.txtEmail);
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					}
				});
        	}
        	$(function(){
				$('.ship').onclick(function(){
					alert(${message });
				});
			});
</script>
</html>
