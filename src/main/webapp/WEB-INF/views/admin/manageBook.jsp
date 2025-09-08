<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/container.css">
<link rel="stylesheet" href="../resources/css/manageBook.css">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div id="container">
	<div id="subtitleArea">
            <div id="subtitle">도서 관리</div>
            <p>메인</p> <p>></p> <p>도서 관리[관리자]</p>
        </div>
        <div id="webContainer">
            <div id="searchArea-box">
                <div class="search-options">
                    <label>
                        <input type="radio" rounded" name="searchType" value="bookName" checked>
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
    
                <div id="searchArea">
                    <div id="replaceForm">
                        <input type="text" name="memberId" placeholder="도서검색">
                        <button type="submit">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="m21 21-4.35-4.35"></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
            
            
            <div>
                <div id="textList">
                    <span>00개가 검색되었습니다.</span>
                    <div id="nemoText">
                        <span>page 1/100</span>
                    </div>
                </div>
    
                <div class="book-list">
                    <div class="book-item">
                        <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                        <div class="book-info">
                            <h3><a href="/bookinfo">데미안</a></h3>
                            <p>저자 : 헤르만 헤세</p>
                            <p>출판사 : </p>
                        </div>
                        <div class="button-group">
                            <button class="action-btn modify-btn">수정</button>
                            <button class="action-btn delete-btn">삭제</button>
                        </div>
                    </div>
                    <div class="book-item">
                        <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                        <div class="book-info">
                            <h3><a href="/bookinfo">수학의 정석</a></h3>
                            <p>저자 : </p>
                            <p>출판사 : </p>
                        </div>
                        <div class="button-group">
                            <button class="action-btn modify-btn">수정</button>
                            <button class="action-btn delete-btn">삭제</button>
                        </div>
                    </div>
                </div>
                
                <div class="add-book-container">
                    <button class="add-book-btn">도서 추가</button>
                </div>

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