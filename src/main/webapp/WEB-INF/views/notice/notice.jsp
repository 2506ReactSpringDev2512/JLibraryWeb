<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="../resources/css/notice.css">
    <link rel="stylesheet" href="../resources/css/container.css">
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">공지사항</div>
            <p>메인</p> <p>></p> <p>공지사항</p>
        </div>
       
        <div id="notice-content-container">
            <!-- 검색 영역 및 관리자 버튼 -->
            <div id="notice-controls">
                <div id="searchArea">
                    <form action="/notice" method="get">
                        <input type="text" name="query" placeholder="제목 검색">
                        <button type="submit">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="m21 21-4.35-4.35"></path>
                            </svg>
                        </button>
                    </form>
                </div>
            </div>
            <table class="notice-table">
                <thead>
                    <tr>
                        <th style="width: 10%;">번호</th>
                        <th style="width: 50%;">제목</th>
                        <th style="width: 15%;">작성자</th>
                        <th style="width: 15%;">작성일</th>
                        <th style="width: 10%;">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notice" items="${noticeList}">
					    <tr>
					        <td>${notice.noticeNo}</td>
					        <td><a href="#">${notice.noticeSubject}</a></td>
					        <td>${notice.noticeWriter}</td>
					        <td>${notice.noticeDate}</td>
					        <td>${notice.viewCount}</td>
					    </tr>
					</c:forEach>
                </tbody>
            </table>
        </div>
        <div class="manager-buttons">
            <a href="${pageContext.request.contextPath}/notice/add" class="write-button">글쓰기</a>
        </div>
        <!-- 페이지네이션 -->
        <div class="pagination">
		    <c:set var="maxPage" value="${(listCount / limit) + (listCount % limit > 0 ? 1 : 0)}"/>
		    <c:forEach begin="1" end="${maxPage}" var="i">
		        <a href="/notice?page=${i}&query=${query}" class="${currentPage == i ? 'active' : ''}">${i}</a>
		    </c:forEach>
		</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>