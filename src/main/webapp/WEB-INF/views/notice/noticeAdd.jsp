<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/addNotice.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">공지사항 추가</div>
            <p>메인</p> <p>></p> <p>공지사항</p> <p>></p> <p>공지사항 추가[관리자]</p>
        </div>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/notice/add" method="post">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="noticeSubject"></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><input type="text" name="noticeWriter" value="관리자"></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><input type="text" name="noticeDate"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="noticeContent"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
		        <div class="form-buttons">
		            <a href="${pageContext.request.contextPath}/notice"><button>글 작성</button> </a>
		        </div>
            </form>
        </div>


	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>