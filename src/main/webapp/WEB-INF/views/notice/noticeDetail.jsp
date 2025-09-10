<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
                <h2>${notice.noticeSubject}</h2>
                <div class="detail-meta">
                    <span class="date">작성일 ${notice.noticeDate}</span>
                    <span class="views">조회수 ${notice.viewCount}</span>
                </div>
            </div>
            <div class="detail-content" style="white-space: pre-line;"> <!-- 줄바꿈 문제 해결 -->
                <c:out value="${notice.noticeContent}"/>
            </div>
        </div>


        <div class="nav-buttons">
            <button><a href="/notice">목록</a></button>
            <c:if test="${not empty loginUser and loginUser.adminYn == 'Y'}">
            <button><a href="${pageContext.request.contextPath}/notice/modify?noticeNo=${notice.noticeNo}">수정</a></button>
            </c:if>
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