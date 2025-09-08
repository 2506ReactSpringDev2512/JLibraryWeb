<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/container.css">
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<h1>에러페이지</h1>
	<h2>에러가 발생하였습니다! 확인해주시기 바랍니다.</h2>
	<h3>${errorMsg }</h3>
	<a href = "/">메인페이지로 이동</a>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>