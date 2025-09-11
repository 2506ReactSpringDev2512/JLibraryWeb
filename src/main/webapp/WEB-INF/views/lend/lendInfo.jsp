<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                            <img src="https://placehold.co/120x160/E0E0E0/fff" alt="Book Cover">
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
                        <button class="action-button extend-btn" data-bookno="${book.book_no}">연장하기</button>
						<button class="action-button return-btn" data-bookno="${book.book_no}">반납하기</button>
						</div>
                    </div>
                    <!-- 연체 여부 표시 -->
                    <c:if test="${book.overdue}">
                            <span class="overdue">연체 도서</span>
					</c:if>
                            <span></span>
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

<script>
$(document).ready(function() {
    $(".extend-btn").click(function() {
        let btn = $(this);
        let bookNo = btn.data("bookno");
        
        $.ajax({
            url: "/extendBook",
            type: "POST",
            data: { bookNo: bookNo },
            success: function(response) {
                // 연장 성공하면 화면의 반납 예정일 업데이트
                let returnDateElem = btn.closest(".book-item").find("p:contains('반납 예정일')");
                
                // 오늘 기준 7일 후로 표시
                let newDate = new Date();
                newDate.setDate(newDate.getDate() + 7);
                let yyyy = newDate.getFullYear();
                let mm = ("0" + (newDate.getMonth() + 1)).slice(-2);
                let dd = ("0" + newDate.getDate()).slice(-2);
                
                returnDateElem.text("반납 예정일 : " + yyyy + "-" + mm + "-" + dd);
                
                alert("연장이 완료되었습니다!");
            },
            error: function() {
                alert("연장 실패! 다시 시도해주세요.");
            }
        });
    });
    
    $(".return-btn").click(function() {
        let btn = $(this);
        let bookNo = btn.data("bookno");

        $.ajax({
            url: "/returnBook",
            type: "POST",
            data: { bookNo: bookNo },
            success: function(response) {
                // 반납되면 화면에서 책 제거
                btn.closest(".book-item").remove();
                alert("반납이 완료되었습니다!");
            },
            error: function() {
                alert("반납 실패! 다시 시도해주세요.");
            }
        });
    });
});
</script>