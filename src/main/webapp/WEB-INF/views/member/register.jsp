<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/container.css">
<link rel="stylesheet" href="../resources/css/register.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div id="containerAll">
    <div id="subtitleArea">
        <div id="subtitle">회원 가입</div>
        <p>메인</p> <p>></p> <p>회원 관리</p> <p>></p> <p>회원 수정[관리자]</p>
    </div>
    
    <div id="tbody">
        <div id="register">
            <form action="/register" method="">
                <div class="form-row">
                    <label>아이디</label> 
                    <input type="text" placeholder="아이디를 입력해주세요">
                </div>

                <div class="form-row">
                    <label>비밀번호</label>
                    <input type="password" placeholder="비밀번호를 입력해주세요(6자 이상)">
                </div>

                <div class="form-row">
                    <label>비밀번호 <br> &nbsp; 재확인</label>
                    <input type="password">
                </div>

                <div class="form-row">
                    <label>이름</label>
                    <input type="text">
                </div>

                <div class="form-row">
                    <label>성별</label>
                    <div class="gender">
                        <label for="male"><input type="radio" name="gender" id="male" checked> 남자 </label>
                        <label for="female"><input type="radio" name="gender" id="female"> 여자 </label>
                    </div>
                </div>
                
                <div class="form-row">
                    <label>나이</label>
                    <input type="number">
                </div>

                <div class="form-row">
                    <label>휴대폰 번호</label>
                    <input type="text" placeholder="010-1234-5678">
                </div>

                <input type="submit" value="회원가입"> <br>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>