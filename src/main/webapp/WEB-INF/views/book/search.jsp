<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <input type="text" name="memberId" placeholder="도서검색">
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
                <c:forEach var="book" items="${books}">
			        <div class="book-item">
			            <div class="book-cover"><a href="/bookinfo"><img src="${empty book.image_url ? 'https://placehold.co/120x160/E0E0E0/fff' : book.image_url}" alt="Book Cover"></a></div>
			            <div class="book-info">
			                <h3><a href="/bookinfo">${book.title_nm}</a></h3>
			                <p>저자 : ${book.authr_nm}</p>
			                <p>출판사 : ${book.publisher_nm}</p>
			            </div>
			            <span>${book.lend_yn }</span>
			        </div>
			    </c:forEach>
            </div>

            <!-- 페이지네이션 -->
            <div class="pagination">
			    <!-- Previous 버튼 -->
			    <c:if test="${page > 1}">
			        <a href="/search?searchType=${searchType}&keyword=${keyword}&page=${page-1}&sortBy=${sortBy}&order=${order}">
			            <button>이전</button>
			        </a>
			    </c:if>
			
			    <!-- 페이지 버튼들 -->
			    <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			        <a href="/search?searchType=${searchType}&keyword=${keyword}&page=${i}&sortBy=${sortBy}&order=${order}">
			            <button class="${page == i ? 'active' : ''}">${i}</button>
			        </a>
			    </c:forEach>
			
			    <!-- Next 버튼 -->
			    <c:if test="${page < totalPages}">
			        <a href="/search?searchType=${searchType}&keyword=${keyword}&page=${page+1}&sortBy=${sortBy}&order=${order}">
			            <button>다음</button>
			        </a>
			    </c:if>
			</div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
