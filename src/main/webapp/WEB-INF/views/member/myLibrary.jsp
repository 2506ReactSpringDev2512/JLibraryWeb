<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/myLibrary.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
        <div id="subtitle">나의 도서관</div>
        <p>메인</p> <p>></p> <p>나의 도서관</p>
        <div class="box">
        <a href="${pageContext.request.contextPath}/lendinfo"><button class="but1">대출현황/연장</button></a>
        <a href="${pageContext.request.contextPath}/modify"><button class="but2">개인 정보 수정</button></a>
    </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>