<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/search.css">
<link rel="stylesheet" href="../resources/css/container.css">

<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <!-- 상단 헤더 -->
    <div id="subtitleArea">
        <div id="subtitle">도서 검색</div>
        <p>메인</p> <p>></p> <p>도서 검색</p>
    </div>
    <div id="webContainer">
        <!-- 검색 영역 박스 -->
        <div id="searchArea-box">
            <!-- 검색 필터 -->
            <div class="search-options">
                <label>
                    <input type="radio" name="searchType" value="bookName" checked>
                    <span class="ml-2">도서명</span>
                </label>
                <label>
                    <input type="radio" name="searchType" value="author">
                    <span class="ml-2">저자</span>
                </label>
                <label>
                    <input type="radio" name="searchType" value="publisher">
                    <span class="ml-2">출판사</span>
                </label>
            </div>

            <!-- 검색 영역 -->
            <div id="searchArea">
                <form action="/search" method="post">
                    <input type="text" name="bookId" placeholder="도서검색">
                    <button type="submit">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                    </button>
                </form>
            </div>
        </div>
        
        
        <!-- 검색 결과 및 리스트 -->
        <div>
            <div id="textList">
                <span>00개가 검색되었습니다.</span>
                <div id="nemoText">
                    <span>Page 1/100</span>
                </div>
            </div>

            <div class="book-list">
                <!-- JSP에서 반복문을 통해 생성할 책 리스트 항목 -->
                <div class="book-item">
                    <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                    <div class="book-info">
                        <h3><a href="/bookinfo">책 제목</a></h3>
                        <p>저자 : 헤르만 헤세</p>
                        <p>출판사 : 지하실</p>
                    </div>
                    <span>대출 가능</span>
                </div>
                <div class="book-item">
                    <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                    <div class="book-info">
                        <h3><a href="/bookinfo">데미안</a></h3>
                        <p>저자 : 헤르만 헤세</p>
                        <p>출판사 : 지하실</p>
                    </div>
                    <span>대출 가능</span>
                </div>
                <div class="book-item">
                    <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                    <div class="book-info">
                        <h3><a href="/bookinfo">노인과 바다</a></h3>
                        <p>저자 : 어니스트 헤밍웨이</p>
                        <p>출판사 : 삼성 출판사</p>
                    </div>
                    <span>대출 불가</span>
                </div>
            </div>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <button class="active">1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>6</button>
                <button>7</button>
                <button>8</button>
                <button>9</button>
                <button>10</button>
                <button>&gt;</button>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
