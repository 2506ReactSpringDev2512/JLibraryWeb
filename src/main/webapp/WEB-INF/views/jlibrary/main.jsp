<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <p id="plus">+</p>
    </div>
    
    <div id="bookList">
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
                        <p class="title">데미안</p>
                        <p class="publisher">자화상</p>
                    </div>
                </a>
            </li>

            <li class="book-card">
                <a href="/book/detail?id=3">
                    <div class="cover">
                        <img src="${pageContext.request.contextPath}/resources/images/booksample.png" alt="책 표지 3" loading="lazy">
                    </div>
                    <div class="meta">
                        <p class="title">노인과 바다</p>
                        <p class="publisher">삼성 출판사</p>
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
                        <p class="title">해리포터와 마법사의 돌 완전판 특별 에디션</p>
                        <p class="publisher">시공 주니어</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>