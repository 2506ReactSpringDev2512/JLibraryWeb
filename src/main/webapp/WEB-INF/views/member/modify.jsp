<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/modify.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">개인정보수정</div>
            <p>메인</p> <p>></p> <p>나의 도서관</p> <p>></p> <p>개인정보수정</p>
        </div>


        <div id="tbody">
            <div id="modify">
                <form action="/modify" method="" onsubmit="return validatePassword()">
                    <div class="form-row">
                        <label>아이디</label>
                        <!-- 아이디 (읽기 전용) -->
						<input type="text" value="${member.memberId}" readonly>
                    </div>


                    <div class="form-row">
                        <label>이름</label>
                        <!-- 이름 (읽기 전용) -->
						<input type="text" value="${member.memberName}" readonly>
                    </div>


                    <div class="form-row">
                        <label>현재 비밀번호</label>
                        <input type="password" value= "${member.memberPwd} " readonly>
                    </div>


                    <div class="form-row">
				        <label>새 비밀번호</label>
				        <input type="password" name="newPassword" placeholder="새 비밀번호를 입력해주세요(6자 이상)" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
				    </div>
				
				    <div class="form-row">
					    <label>새 비밀번호 확인</label>
					    <input type="password" name="confirmNewPassword" placeholder="새 비밀번호를 재입력해주세요">
					    <p class="error-message" id="passwordMismatchMessage">비밀번호가 일치하지 않습니다.</p>
					</div>


                    <div class="form-row">
                        <label>휴대폰 번호</label>
                        <div class="phone-input-wrapper">
                            <input type="text" name="phone" placeholder="010-1111-2222" pattern="010-[0-9]{4}-[0-9]{4}" required>
                        </div>
                    </div>


                    <div class="submit-wrapper">
                        <input type="submit" value="수정하기">
                        </div>
                </form>
            </div>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>

<script>
    function validatePassword() {
        const newPassword = document.querySelector('input[name="newPassword"]').value;
        const confirmPassword = document.querySelector('input[name="confirmNewPassword"]').value;
        const errorMessage = document.getElementById('passwordMismatchMessage');


        if (newPassword !== confirmPassword) {
            errorMessage.style.display = 'block';
            return false; // Prevent form submission
        } else {
            errorMessage.style.display = 'none';
        }


        return true; // Allow form submission
    }
</script>