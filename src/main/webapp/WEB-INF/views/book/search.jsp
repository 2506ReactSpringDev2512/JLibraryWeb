<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/search.css">
<link rel="stylesheet" href="../resources/css/container.css">

<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <!-- 상단 헤더 -->
    <c:if test="${sessionScope.memberId ne 'admin123' || memberId eq null }">
    <div id="subtitleArea">
        <div id="subtitle">도서 검색</div>
        <p>메인</p> <p>></p> <p>도서 검색</p>
    </div>
    </c:if>
    <c:if test="${sessionScope.memberId eq 'admin123' }">
    <div id="subtitleArea">
        <div id="subtitle">도서 관리</div>
        <p>메인</p> <p>></p> <p>도서 관리[관리자]</p>
    </div>
    </c:if>
    <div id="webContainer">
        <!-- 검색 영역 박스 -->
        <div id="searchArea-box">
            <!-- 검색 필터 -->
            <div class="search-options">
			    <label>
			        <input type="radio" name="searchType" value="title_nm" ${searchType == 'title_nm' ? 'checked' : ''}> 도서명
			    </label>
			    <label>
			        <input type="radio" name="searchType" value="authr_nm" ${searchType == 'authr_nm' ? 'checked' : ''}> 저자
			    </label>
			    <label>
			        <input type="radio" name="searchType" value="publisher_nm" ${searchType == 'publisher_nm' ? 'checked' : ''}> 출판사
			    </label>
			</div>

            <!-- 검색 영역 -->
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
        
        
        <!-- 검색 결과 및 리스트 -->
        <div>
            <div id="textList">
                <span>${totalItems }개가 검색되었습니다.</span>
                <div id="nemoText">
                    <span>Page ${page}/${totalPages}</span>
                </div>
            </div>

            <div class="book-list">
                <!-- JSP에서 반복문을 통해 생성할 책 리스트 항목 -->
                <c:forEach var="book" items="${books}">
			        <div class="book-item">
			            <div class="book-cover"><a href="/bookinfo?bookNo=${book.book_no}"><img src="${empty book.image_url ? 'https://placehold.co/120x160/E0E0E0/fff' : book.image_url}" alt="Book Cover"></a></div>
			            <div class="book-info">
			                <h3><a href="/bookinfo?bookNo=${book.book_no}">${book.title_nm}</a></h3>
			                <p>저자 : ${book.authr_nm}</p>
			                <p>출판사 : ${book.publisher_nm}</p>
			            </div>
			            
			            <c:if test="${sessionScope.memberId ne 'admin123' || memberId eq null }">
			            <span>${book.lend_yn }</span>
			            </c:if>
			            <c:if test="${sessionScope.memberId eq 'admin123' }">
			           	<div class="button-group">
                            <button class="action-btn modify-btn">수정</button>
                            <button class="action-btn delete-btn" data-bookno="${book.book_no}">삭제</button>
                        </div>
                        </c:if>
			        </div>
			    </c:forEach>
            </div>
            
            <c:if test="${sessionScope.memberId eq 'admin123' }">
            <div class="add-book-container">
                    <button class="add-book-btn">도서 추가</button>
            </div>
            </c:if>

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


<script>
$(document).ready(function() {
    $(".delete-btn").click(function() {
        if (!confirm("정말 이 책을 삭제하시겠습니까?")) return;

        let btn = $(this);
        let bookNo = btn.data("bookno");

        $.ajax({
            url: "/delete-book",
            type: "POST",
            data: { bookNo: bookNo },
            success: function(response) {
                // 삭제 성공 시 화면에서 해당 책 항목 제거
                btn.closest(".book-item").remove();
                alert("삭제가 완료되었습니다!");
            },
            error: function() {
                alert("삭제 실패! 다시 시도해주세요.");
            }
        });
    });
});
</script>
