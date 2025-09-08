<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/container.css">
<link rel="stylesheet" href="../resources/css/manageMember.css">

<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">회원 관리</div>
            <p>메인</p> <p>></p> <p>회원 관리[관리자]</p>
        </div>
        <div id="webContainer">
            <!-- 검색 영역 박스 -->
            <div id="searchArea-box">
                <!-- 검색 필터 -->
                <div class="search-options">
                    <label>
                        <input type="radio" rounded" name="searchType" value="bookName" checked>
                        <span class="ml-2">이름</span>
                    </label>
                    <label>
                        <input type="radio" name="searchType" value="author">
                        <span class="ml-2">아이디</span>
                    </label>
                </div>
   
                <!-- 검색 영역 -->
                <div id="searchArea">
                    <div id="replaceForm">
                        <input type="text" name="memberId" placeholder="회원검색">
                        <button type="submit">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="m21 21-4.35-4.35"></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>


            <!-- 회원 목록 테이블 -->
            <div class="member-table-container">
                <table class="member-table">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>비밀번호</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>성별</th>
                            <th>나이</th>
                            <th>대출 도서 수</th>
                            <th>연체 도서 수</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- JSP에서 반복문을 통해 생성할 회원 리스트 항목 -->
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>tjdowndo1233</td>
                            <td>123123</td>
                            <td>성주애</td>
                            <td>010-1111-2222</td>
                            <td>여자</td>
                            <td>26</td>
                            <td>1</td>
                            <td>1</td>
                            <td>
                                <button class="action-button">수정</button>
                                <button class="action-button">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
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