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
            <form action="#" method="post">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="noticeSubject" value="임시 제목"></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><input type="text" name="noticeWriter" value="관리자" readonly></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><input type="text" name="noticeDate" value="임시 작성일"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="noticeContent"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>


        <div class="form-buttons">
            <button>수정하기</button>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>