<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="../resources/css/lendInfo.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">대출 정보</div>
            <p>메인</p> <p>></p> <p>나의 도서관</p><p>></p><p>대출현황 연장</p>
        </div>
        <div>
            <div class="book-list">
                <!-- JSP에서 반복문을 통해 생성할 책 리스트 항목 -->
                <c:forEach var="book" items="${lendList}">
                <div class="book-item">
                    <div class="book-cover">
                        <a href="/bookinfo?bookNo=${book.book_no}">
                            <img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover">
                        </a>
                    </div>
                    <div class="book-info">
                        <h3 class="bookTitle">
                            <a href="/bookinfo?bookNo=${book.book_no}">${book.title_nm}</a>
                        </h3>
                        <p>저자 : ${book.author}</p>
                        <p>출판사 : ${book.publisher}</p>
                        <p>반납 예정일 : <c:out value="${book.return_date}"/></p>
                       	<div class="button-group">
                        <a href="/extendBook"><button class="action-button">연장하기</button></a>
						<a href="/returnBook"><button class="action-button">반납하기</button></a>
						</div>
                    </div>
                    <!-- 연체 여부 표시 -->
                    <c:choose>
                        <c:when test="${book.return_date < now}">
                            <span class="overdue">연체 도서</span>
                        </c:when>
                        <c:otherwise>
                            <span></span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
            </div>


            <!-- 페이지네이션 -->
            <div class="pagination">
            <c:forEach var="i" begin="1" end="${totalPage}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <button class="active">${i}</button>
                    </c:when>
                    <c:otherwise>
                        <form action="" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="${i}">
                            <button type="submit">${i}</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${currentPage < totalPage}">
                <form action="" method="get" style="display:inline;">
                    <input type="hidden" name="page" value="${currentPage + 1}">
                    <button type="submit">&gt;</button>
                </form>
            </c:if>
        </div>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>