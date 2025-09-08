<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/container.css">
<link rel="stylesheet" href="../resources/css/manageAddBook.css">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div id="container">
	
	<div id="subtitleArea">
        <div id="subtitle">도서 추가</div>
        <p>메인</p> <p>></p> <p>도서 관리</p> <p>></p> <p>도서 추가[관리자]</p>
    </div>
   
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
   
        <input type="submit" value="추가하기">


    </div>


</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>