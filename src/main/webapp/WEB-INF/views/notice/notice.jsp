<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <form action="/search" method="get">
                        <input type="text" name="query" placeholder="제목/작성자 검색">
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
                    <tr>
                        <td>1</td>
                        <td><a href="#">제이 도서관 홈페이지 오픈 안내제이 도서관 홈페이지 오픈 안내</a></td>
                        <td>관리자</td>
                        <td>2025.09.03</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#">추석 연휴 휴관 안내</a></td>
                        <td>관리자</td>
                        <td>2025.09.01</td>
                        <td>12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="#">도서관 시스템 점검 안내</a></td>
                        <td>관리자</td>
                        <td>2025.08.28</td>
                        <td>25</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><a href="#">독서의 달 행사 안내</a></td>
                        <td>관리자</td>
                        <td>2025.08.20</td>
                        <td>31</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><a href="#">신간 도서 입고 안내</a></td>
                        <td>관리자</td>
                        <td>2025.08.15</td>
                        <td>45</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td><a href="#">개인정보 처리방침 변경 안내</a></td>
                        <td>관리자</td>
                        <td>2025.08.10</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td><a href="#">도서관 서비스 개선을 위한 설문조사</a></td>
                        <td>관리자</td>
                        <td>2025.08.05</td>
                        <td>55</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td><a href="#">정기 휴무일 안내</a></td>
                        <td>관리자</td>
                        <td>2025.08.01</td>
                        <td>60</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td><a href="#">대출/반납 시스템 점검 안내</a></td>
                        <td>관리자</td>
                        <td>2025.07.28</td>
                        <td>72</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td><a href="#">도서관 이용시간 변경 안내</a></td>
                        <td>관리자</td>
                        <td>2025.07.25</td>
                        <td>80</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="manager-buttons">
            <button><a href="${pageContext.request.contextPath}/notice/add">글쓰기</button>
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
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>