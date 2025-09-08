<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="book-item">
                    <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                    <div class="book-info">
                        <h3 id="bookTitle"><a href="/bookinfo">책 제목1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는</a></h3>
                        <p>저자 : 헤르만 헤세</p>
                        <p>출판사 : 지하실</p>
                        <p>반납 예정일 : 25/09/20</p>
                    </div>
                    <span>연체 도서</span>
                </div>
                <div class="book-item">
                    <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                    <div class="book-info">
                        <h3 id="bookTitle"><a href="/bookinfo">데미안</a></h3>
                        <p>저자 : 헤르만 헤세</p>
                        <p>출판사 : 지하실</p>
                        <p>반납 예정일 : 25/09/20</p>
                    </div>
                    <span>연체 도서</span>
                </div>
                <div class="book-item">
                    <div class="book-cover"><a href="/bookinfo"><img src="https://placehold.co/100x140/E0E0E0/fff" alt="Book Cover"></a></div>
                    <div class="book-info">
                        <h3 id="bookTitle"><a href="/bookinfo">노인과 바다</a></h3>
                        <p>저자 : 어니스트 헤밍웨이</p>
                        <p>출판사 : 삼성 출판사</p>
                        <p>반납 예정일 : 25/09/20</p>
                    </div>
                    <span></span>
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
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>