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
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/layouts/header.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/views/user/layouts/menu.jsp"></jsp:include>
	
	<div class="section">
		<c:if test="${not empty thongbao }">
	            	<div class="alert alert-primary" role="alert">
					 	${thongbao }
					</div>
        </c:if>
		
		
		<sf:form action="${base }/contact" method="post" modelAttribute="contact">
			<h3>Đội ngũ chăm sóc khách hàng xin chào</h3>
			  <div class="form-group">
			    <label for="firstName">First Name</label>
			    <sf:input path="first_name" type="text" class="form-control" id="first_name" name="first_name" placeholder="FirstName" required="required" />
			    
			  </div>
			  <div class="form-group">
			    <label for="lastName">LastName</label>
			    <sf:input path="last_name" type="text" class="form-control" id="last_name" name="last_name" placeholder="LastName" required="required"/>
			  </div>
			  <div class="form-group">
			    <label for="lastName">Email</label>
			    <sf:input path="email" type="email" class="form-control" id="email" name="email" placeholder="Email" required="required"/>
			  </div>
			  <div class="form-group">
			    <label for="lastName">Message</label>
			    <sf:input path="message" type="text" class="form-control" id="message" name="message" placeholder="Message" required="required"/>
			  </div>
			  <div class="form-group">
				<label for="category">RequestType(required)</label>
				<sf:select path="request_type" class="form-control" id="request_type">
					<sf:option value= "Đổi trả"/>
					<sf:option value= "Phản hồi"/>
				</sf:select>	
			 </div>
			  <%-- <div class="form-check">
			    <sf:checkbox path="ckbCheckbox" class="form-check-input" id="exampleCheck1"/>
			    <label class="form-check-label" for="exampleCheck1">Check me out</label>
			  </div> --%>
			  <!-- <div class="form-group">
				<label for="inputFile">Picture(Multiple)</label>
				<input id="inputFile" name="inputFile" type="file" class="form-control-file" multiple="multiple">
			  </div> -->
			  <button type="submit" class="btn btn-primary ship" onclick="alert('Cảm ơn bạn đã gửi liên hệ!')">Gửi</button> 
			  <!-- <button type="button" class="btn btn-primary" onclick="saveContact()">Gửi Liên Hệ</button> -->
		</sf:form>
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
