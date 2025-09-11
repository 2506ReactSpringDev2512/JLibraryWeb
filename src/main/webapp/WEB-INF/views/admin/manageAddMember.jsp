<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/container.css">
<link rel="stylesheet" href="../resources/css/manageAddMember.css">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div id="container">
	
	<div id="subtitleArea">
            <div id="subtitle">회원 추가</div>
            <p>메인</p> <p>></p> <p>회원 관리</p> <p>></p> <p>회원 추가[관리자]</p>
        </div>


        <div id="tbody">
            <div id="add_member">
                <form action="/add-member" method="post">
                    <div class="form-row">
                        <label>아이디</label>
                        <input type="text" name="memberId" placeholder="아이디를 입력해주세요(6~15자)" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                    </div>


                    <div class="form-row">
                        <label>비밀번호</label>
                        <input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요(6~15자)" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                    </div>


                    <div class="form-row">
                        <label>비밀번호 <br> &nbsp; 재확인</label>
                        <input type="password" name="memberPw" placeholder="비밀번호를 다시 입력해주세요(6~15자)" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                    </div>


                    <div class="form-row">
                        <label>이름</label>
                        <input type="text" name="memberName" pattern="[가-힣]{2,5}" required>
                    </div>


                    <div class="form-row">
                        <label>성별</label>
                        <div class="gender">
                            <label for="male"><input type="radio" name="memberGender" value="M" id="male" checked> 남자 </label>
                            <label for="female"><input type="radio" name="memberGender" value="F" id="female"> 여자 </label>
                        </div>
                    </div>
                   
                    <div class="form-row">
                        <label>나이</label>
                        <input type="number" name="memberAge" min="1" max="100" required>
                    </div>


                    <div class="form-row">
                        <label>휴대폰 번호</label>
                        <input type="text" placeholder="010-1234-5678" name="memberPhone" pattern="010-[0-9]{4}-[0-9]{4}" required>
                    </div>


                    <input type="submit" value="추가하기"> <br>
                </form>
            </div>
        </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>