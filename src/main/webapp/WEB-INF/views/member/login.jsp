<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/container.css">
	<link rel="stylesheet" href="../resources/css/login.css">
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	 <div id="containerAll">
            <div id="subtitleArea">
                <div id="subtitle">로그인</div>
                <p>메인</p> <p>></p> <p>로그인</p>
            </div>
           
            <form action="/login" method="">
                <div class="form-row">
                    <input type="text" placeholder="아이디" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                </div>




                <div class="form-row">
                    <input type="password" placeholder="비밀번호" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                </div>




                <div class="alink">
                    <a href="#">비밀번호 찾기</a>
                    <a href="#">회원가입</a>
               
                </div>




                <input type="submit" value="로그인">
            </form>
        </div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>