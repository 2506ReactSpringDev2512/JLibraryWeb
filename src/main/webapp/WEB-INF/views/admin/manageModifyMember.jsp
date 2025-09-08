<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/manageModifyMember.css">
	<link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">회원 수정</div>
            <p>메인</p> <p>></p> <p>회원 관리</p> <p>></p> <p>회원 수정[관리자]</p>
        </div>




        <div id="tbody">
            <div id="modify_member">
                <form action="/modify_member" method="">
                    <div class="form-row">
                        <label>아이디</label>
                        <input type="text" name="memberId" value="tjdwndo1233" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" readonly required>
                    </div>


                    <div class="form-row">
                        <label>비밀번호</label>
                        <input type="password" name="memberPw" value="123123" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" readonly required>
                    </div>




                    <div class="form-row">
                        <label>이름</label>
                        <input type="text" value="성주애" pattern="[가-힣]{2,5}" required>
                    </div>




                    <div class="form-row">
                        <label>성별</label>
                        <div class="gender">
                            <label for="male"><input type="radio" name="memberGender" id="male" value="M" checked> 남자 </label> <!-- value값에 따라 어떤성별에 checked 되게 할지 [미반영] -->
                            <label for="female"><input type="radio" name="memberGender" id="female" value="F"> 여자 </label>
                        </div>
                    </div>
               
                    <div class="form-row">
                        <label>나이</label>
                        <input type="number" value="26" name="memberAge" min="1" max="100" required>
                    </div>




                    <div class="form-row">
                        <label>휴대폰 번호</label>
                        <input type="text" value="010-1111-2222" name="memberPhone" pattern="010-[0-9]{4}-[0-9]{4}" required>
                    </div>
                    <input type="submit" value="수정하기"> <br>
                </form>
            </div>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>