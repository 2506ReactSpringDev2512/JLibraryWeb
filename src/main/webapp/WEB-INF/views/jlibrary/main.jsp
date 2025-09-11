<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/container.css">
<meta charset="UTF-8">
<title>제이도서관</title>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<div id="body">
    <div class="search-loan-container">
        <div class="loan-info">
            <p>대출 가능 도서: 00권</p>
        </div>
        
        <div id="searchArea">
            <form action="/search" method="get">
                <input type="text" name="keyword" placeholder="도서검색">
                <button type="submit">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2">
                        <circle cx="11" cy="11" r="8"></circle>
                        <path d="m21 21-4.35-4.35"></path>
                    </svg>
                </button>
            </form>
        </div>
    </div>
    
    <div id="bestText">
        <p id="text">이달의 인기도서</p>
        <a href="/search"><p id="plus">+</p></a>
    </div>
    
    <div id="bookList">
    <ul class="book-grid">
        <c:forEach var="book" items="${bookList}">
            <li class="book-card">
                <a href="/bookinfo?bookNo=${book.book_no}">
                    <div class="cover">
                        <img src="${empty book.image_url ? 'https://placehold.co/120x160/E0E0E0/fff' : book.image_url}" alt="Book Cover">
                    </div>
                    <div class="meta">
                        <p class="title">${book.title_nm}</p>
                        <p class="publisher">${book.publisher_nm}</p>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
    </div>
</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</body>
</html>