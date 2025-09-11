<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <span class="ml-2">아이디</span>
                    </label>
                    <label>
                        <input type="radio" name="searchType" value="author">
                        <span class="ml-2">이름(개발중)</span>
                    </label>
                </div>
   
                <!-- 검색 영역 -->
                <div id="searchArea">
                <form action="/manage-member" method="get">
                    <div id="replaceForm">
			            <input type="hidden" name="searchType" value="id">
			            <input type="text" name="searchKeyword" placeholder="회원검색">
			            <button type="submit">
			                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2">
			                    <circle cx="11" cy="11" r="8"></circle>
			                    <path d="m21 21-4.35-4.35"></path>
			                </svg>
			            </button>
			        </div>
                </form>
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
                            <th>나이</th>
                            <th>성별</th>
                            <th>대출 도서 수</th>
                            <th>연체 도서 수</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- JSP에서 반복문을 통해 생성할 회원 리스트 항목 -->
                        <c:forEach var="member" items="${memberList}">
                        <tr>
                            <td>${member.memberId}</td>
					        <td>${member.memberName}</td>
					        <td>${member.phone}</td>
					        <td>${member.gender}</td>
					        <td>${member.age}</td>
					        <td>${member.adminYn}</td>
					        <td>${member.lendCount}</td>
					        <td>${member.overdueCount}</td>
                            <td>
                                <a href="/admin/modify-member?memberId=${member.memberId}"><button class="action-button">수정</button></a>
                                <button class="action-button" onclick="deleteMember('${member.memberId}', '${member.memberName}', ${member.lendCount})">삭제</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="addButton">
            <a href="/add-member"><button class="action-button">추가</button></a>
            </div>


            <!-- 페이지네이션 -->
            <div class="pagination">
			<c:if test="${currentPage > 1}">
			        <a href="?page=${currentPage-1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">이전</a>
		    </c:if>
		
		    <c:forEach begin="1" end="${totalPage}" var="i">
		        <c:choose>
		            <c:when test="${i == currentPage}">
		                <b>${i}</b>
		            </c:when>
		            <c:otherwise>
		                <a href="?page=${i}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">${i}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		
		    <c:if test="${currentPage < totalPage}">
		        <a href="?page=${currentPage+1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">다음</a>
		    </c:if>
            </div>


        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>

<script>
function deleteMember(memberId, memberName) {
    if(confirm("정말 '" + memberName + "'의 데이터를 삭제하시겠습니까?")) {
        // form을 만들어 POST로 보내는 방식
        let form = document.createElement('form');
        form.method = 'post';
        form.action = '/delete-member';
        
        let input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'memberId';
        input.value = memberId;
        form.appendChild(input);
        
        document.body.appendChild(form);
        form.submit();
    }
}
</script>