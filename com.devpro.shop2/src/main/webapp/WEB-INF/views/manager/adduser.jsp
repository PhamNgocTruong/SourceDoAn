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
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>${projectTitle}</title>
	<link rel="stylesheet" href="${base}/user/style/style.css">
	<jsp:include page="/WEB-INF/views/user/layouts/css.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layouts/header.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/views/user/layouts/menu.jsp"></jsp:include>
	

	
	<div class="add_user">
	
		<h1>Thêm mới người dùng</h1>
		<sf:form method="post" action="${base }/admin/adduser" modelAttribute="users" >
		<sf:hidden path="id"/> 
		
		<div class="form-group">
			<label for="name">UserName(required)</label>
			<sf:input path="username" autocomplete="off" type="text" class="form-control" id="username" placeholder="UserName" required="required"></sf:input>
		</div>
		
		<div class="form-group">
			<label for="description">Password(required)</label>
			<sf:input path="password" autocomplete="off" type="password" class="form-control" id="password" placeholder="Password" required="required"></sf:input>
		</div>
		
		<div class="form-group">
			<label for="seo">Email(required)</label>
			<sf:input path="email" autocomplete="off" type="email" class="form-control" id="email" placeholder="Email" ></sf:input>
		</div>
				
		</br>
		<a href="${base }/admin/user" class="btn btn-back" role="button" style="background-color:black;color:white">Back to list</a>
		<button type="submit" class="btn btn-success add" onclick="alert('Thêm user thành công!')">Thêm mới </button>
		</sf:form>
	</div>
<!-- footer -->
<jsp:include page="/WEB-INF/views/user/layouts/footer.jsp"></jsp:include>
		<script type="text/javascript">
			$(function(){
				$('.add').onclick(function(){
					alert(${message });
				});
			});
		</script>	
</body>
<jsp:include page="/WEB-INF/views/user/layouts/js.jsp"></jsp:include>
</html>