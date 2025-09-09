<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <img src="${empty book.image_url ? 'https://placehold.co/250x350/E0E0E0/fff' : book.image_url}" alt="Book Cover" style="width: 100%; height: 100%; object-fit: cover; border-radius: 8px;">
        </div>
        <div id="bookDetails">
            <h2 id="bookTitle">${book.title_nm}</h2>
            <div class="info-row">
                <span class="info-label">저자 </span><span class="info-text"> ${book.authr_nm}</span>
            </div>
            <div class="info-row">
                <span class="info-label">출판사 </span><span class="info-text"> ${book.publisher_nm}</span>
            </div>
            <div class="info-row">
                <span class="info-label">ISBN </span><span class="info-text"> ${book.isbn_no}</span>
            </div>
            <div class="info-row">
                <span class="info-label">가격 </span><span class="info-text"> ${book.prc_value}원</span>
            </div>
            <div id="status">
                ${book.lend_yn == '대여가능' ? '대출 가능' : '대출 중'}
            </div>
        </div>
    </div>

    <!-- 도서 상세 설명 섹션 -->
    <div id="descriptionSection">
        <p>
            ${book.book_intrcn_cn }
        </p>
    </div>

    <!-- 버튼 섹션 -->
    <div id="buttonSection">
    <a href="/search">
        <button class="action-button-list gray-button">목록</button>
    </a>

    <!-- 대출하기 버튼을 form 태그로 감싸서 POST 요청을 보냄 -->
    <a><button id="lendBtn" class="action-button-lend black-button">대출하기</button></a>
	</div>

	<script>
	const lendBtn = document.getElementById("lendBtn");
	
	lendBtn.addEventListener("click", function() {
	    if (!confirm("이 도서를 대출하시겠습니까?")) return;
	
	    const bookNo = "${book.book_no}"; // 현재 책 번호
	
	    fetch("${pageContext.request.contextPath}/lend", {
	        method: "POST",
	        headers: { "Content-Type": "application/x-www-form-urlencoded" },
	        body: "bookNo=" + bookNo
	    })
	    .then(response => response.text())
	    .then(result => {
	        alert(result); // 서버에서 보내는 메시지 표시
	        // 필요시, 버튼 상태를 바꿔서 다시 클릭 못하게 처리 가능
	        if (result === "대출 성공!") {
	            lendBtn.disabled = true;
	            lendBtn.textContent = "대출 완료";
	        }
	    })
	    .catch(err => alert("대출 중 오류가 발생했습니다."));
	});
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>