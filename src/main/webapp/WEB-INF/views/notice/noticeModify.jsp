<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/noticeModify.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">공지사항 수정</div>
            <p>메인</p> <p>></p> <p>공지사항</p> <p>></p> <p>공지사항 수정[관리자]</p>
        </div>


        <div class="form-container">
            <form action="/notice/modify" method="post">
            	<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="noticeSubject" value="${notice.noticeSubject}"></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><input type="text" name="noticeWriter" value="${notice.noticeWriter}" readonly></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><input type="text" name="noticeDate" value="${notice.noticeDate}" readonly></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="noticeContent">${notice.noticeContent}</textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-buttons">
            		<button>수정하기</button>
        		</div>
            </form>
        </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>