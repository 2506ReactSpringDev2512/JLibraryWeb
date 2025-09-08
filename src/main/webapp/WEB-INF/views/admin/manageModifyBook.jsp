<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/manageModifyBook.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
        <div id="subtitle">도서 수정</div>
        <p>메인</p> <p>></p> <p>도서 관리</p> <p>></p> <p>도서 수정[관리자]</p>
   
   
    <div id="tbody">
        <div class="form-row">
            <label>책이름</label>
            <input type="text">
        </div>
   
   
        <div class="form-row">
            <label>저자</label>
            <input type="text">
        </div>
   
   
        <div class="form-row">
            <label>출판사 명</label>
            <input type="text">
        </div>
   
   
        <div class="form-row">
            <label>책 가격</label>
            <input type="number">
        </div>
   
   
        <div class="form-row">
            <label>일련번호</label>
            <input type="number">
        </div>
   
   
        <div class="form-row infocontent">
            <label>소개 내용</label>
            <textarea name="show"></textarea>
        </div>
        
       	<div class="form-row button">
        	<input type="submit" value="수정하기">
        </div>
       
        <div class="left">
            <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
            <div class="img-button"><input type="submit" value="이미지 변경"></div>
        </div>


    </div>
  

</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>