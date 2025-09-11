<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="../resources/css/manageModifyBook.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
        <div id="subtitle">도서 수정</div>
        <p>메인</p> <p>></p> <p>도서 관리</p> <p>></p> <p>도서 수정[관리자]</p>
   
   	
   	<form action="${pageContext.request.contextPath}/modify-book" method="post">
	    <div id="tbody">
	    
	    	<input type="hidden" name="book_no" value="${book.book_no}">
	    
	        <div class="form-row">
	            <label>책이름</label>
	            <input type="text" name="title_nm" value="${book.title_nm}">
	        </div>
	   
	   
	        <div class="form-row">
	            <label>저자</label>
	            <input type="text" name="authr_nm" value="${book.authr_nm}">
	        </div>
	   
	   
	        <div class="form-row">
	            <label>출판사 명</label>
	            <input type="text" name="publisher_nm" value="${book.publisher_nm}">
	        </div>
	   
	   
	        <div class="form-row">
	            <label>책 가격</label>
	            <input type="number" name="prc_value" value="${book.prc_value}">
	        </div>
	   
	   
	        <div class="form-row">
	            <label>일련번호</label>
	            <input type="number" name="isbn_thirteen_no" value="${book.isbn_thirteen_no}">
	        </div>
	   
	   
	        <div class="form-row infocontent">
	            <label>소개 내용</label>
	            <textarea name="book_intrcn_cn">${book.book_intrcn_cn}</textarea>
	        </div>
	        
	       	<div class="form-row button">
	        	<input type="submit" value="수정하기">
	        </div>
	       
	        <div class="left">
	            <div class="book-cover"><!-- 이미지 변경버튼시 링크 이동 중단<a href="/bookinfo"> --><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"><!-- </a> --></div>
	            <div class="img-button"><input type="button" value="이미지 변경" onclick="alert('이미지 변경은 아직 구현되지 않았습니다.');"></div>
	        </div>
    	</div>
 	</form>

</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>