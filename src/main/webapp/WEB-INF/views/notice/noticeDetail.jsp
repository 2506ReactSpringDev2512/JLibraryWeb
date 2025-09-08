<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/noticeDetail.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">공지사항</div>
            <p>메인</p> <p>></p> <p>공지사항</p>
        </div>

        <div class="detail-container">
            <div class="detail-header">
                <h2>공지 | 제이 도서관 홈페이지 오픈 안내(09/06)</h2>
                <div class="detail-meta">
                    <span class="date">작성일 2025.09.06</span>
                    <span class="views">조회수 15</span>
                </div>
            </div>
            <div class="detail-content">
                <p>2025.09.06 제이 홈페이지가 오픈했습니다. 공지 및 행사등의 일정은 공지사항에 업로드 될 예정입니다.</p>
                <p>그 밖 도서 관련 된 페이지를 통해 대출현황 및 연체 사항들을 확인해 보실 수 있습니다.</p>
                <br>
                <p>1. 도서관 소개</p>
                <p>2. 공지사항</p>
                <p>3. 도서검색</p>
                <p>4. 나의 도서관</p>
                <br>
                <p>문의(전화) 02 - 130 - 4983 / 독서관리팀</p>
            </div>
        </div>


        <div class="nav-buttons">
            <button><a href="/notice">목록</a></button>
            <button><a href="/notice/modify">수정</a></button>
        </div>


        <div class="prev-next">
            <div class="prev-next-item">
                <span>이전글</span>
                <a href="#">이전글 제목</a>
            </div>
            <div class="prev-next-item">
                <span>다음글</span>
                <a href="#">다음글 제목</a>
            </div>
        </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>