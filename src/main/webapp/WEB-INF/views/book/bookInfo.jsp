<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/bookInfo.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
<script>
document.addEventListener('DOMContentLoaded', () => {
    const bookTitle = document.getElementById('bookTitle');
    if (bookTitle) {
        bookTitle.addEventListener('click', () => {
            bookTitle.classList.toggle('expanded');
        });
    }
});
</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- 상단 헤더 -->
    <div id="subtitleArea">
        <div id="subtitle">도서 정보</div>
        <p>메인</p> <p>></p> <p>도서 검색</p> <p>></p> <p>도서 정보</p>
    </div>

    <!-- 도서 정보 섹션 -->
    <div id="bookInfoSection">
        <div id="bookCover">
            <img src="https://placehold.co/250x350/E0E0E0/fff" alt="Book Cover" style="width: 100%; height: 100%; object-fit: cover; border-radius: 8px;">
        </div>
        <div id="bookDetails">
            <h2 id="bookTitle">데미안 1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는</h2>
            <div class="info-row">
                <span class="info-label">저자 </span><span class="info-text"> 헤르만 헤세</span>
            </div>
            <div class="info-row">
                <span class="info-label">출판사 </span><span class="info-text"> 자화상</span>
            </div>
            <div class="info-row">
                <span class="info-label">발행처 </span><span class="info-text"> 헤르만 헤세 / 출판사 : 자화상</span>
            </div>
            <div class="info-row">
                <span class="info-label">ISBN </span><span class="info-text"> 9788972756608</span>
            </div>
            <div class="info-row">
                <span class="info-label">가격 </span><span class="info-text"> 12,000원</span>
            </div>
            <div id="status">
                대출 가능
            </div>
        </div>
    </div>

    <!-- 도서 상세 설명 섹션 -->
    <div id="descriptionSection">
        <p>
            1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는
            1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는
            1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는
            1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는
            1919년 간행된 헤세의 소설. 소년 싱클레어가 자기자신을 자각해 가는 과정을 그린 작품이며, 제1차 세계대전 후 혼미한 독일의 청년들에게 큰 반향을 안겨주었다. 소년 싱클레어는
            
        </p>
    </div>

    <!-- 버튼 섹션 -->
    <div id="buttonSection">
        <button class="action-button-list gray-button"><a href="${pageContext.request.contextPath}/search">목록</a></button>
        <button class="action-button-lend black-button">
        <a href="${pageContext.request.contextPath}/lendinfo" 
           onclick="return confirm('이 도서를 대출하시겠습니까?') && (alert('도서가 성공적으로 대출되었습니다!'), true);">대출하기</a>
    </button>
    </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>