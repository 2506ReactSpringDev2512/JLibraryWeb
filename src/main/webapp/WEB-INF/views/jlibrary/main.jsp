<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="../resources/css/main.css">
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
    <c:out value="${bookList}" />
        <ul class="book-grid">
            <li class="book-card">
                <a href="/book/detail?id=1">
                    <div class="cover">
                        <img src="${pageContext.request.contextPath}/resources/images/booksample.png" alt="책 표지 1" loading="lazy">
                    </div>
                    <div class="meta">
                        <p class="title">책 제목</p>
                        <p class="publisher">출판사</p>
                    </div>
                </a>
            </li>

            <li class="book-card">
                <a href="/book/detail?id=2">
                    <div class="cover">
                        <img src="${pageContext.request.contextPath}/resources/images/booksample.png" alt="책 표지 2" loading="lazy">
                    </div>
                    <div class="meta">
                        <p class="title">책 제목</p>
                        <p class="publisher">출판사</p>
                    </div>
                </a>
            </li>

            <li class="book-card">
                <a href="/book/detail?id=3">
                    <div class="cover">
                        <img src="${pageContext.request.contextPath}/resources/images/booksample.png" alt="책 표지 3" loading="lazy">
                    </div>
                    <div class="meta">
                        <p class="title">책 제목</p>
                        <p class="publisher">출판사</p>
                    </div>
                </a>
            </li>

            <li class="book-card">
                <a href="/book/detail?id=4">
                    <div class="cover">
                        <img src="${pageContext.request.contextPath}/resources/images/booksample.png" alt="책 표지 4" loading="lazy"
                            onerror="${pageContext.request.contextPath}/resources/images/booksample.png'">
                    </div>
                    <div class="meta">
                        <p class="title">책 제목</p>
                        <p class="publisher">출판사</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>