<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../resources/css/container.css">
<link rel="stylesheet" href="../resources/css/register.css">

<div id="container">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

        <div id="subtitleArea">
            <div id="subtitle">회원 가입</div>
            <p>메인</p> <p>></p> <p>회원 관리</p> <p>></p> <p>회원 가입</p>
        </div>

        <div id="tbody">
            <div id="register">
                <form action="" method="" onsubmit="return validateForm()">
                    <div class="form-row">
                        <label>아이디</label>
                        <input type="text" name="memberId" placeholder="아이디를 입력해주세요(6~15자)" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                    </div>

                    <div class="form-row">
                        <label>비밀번호</label>
                        <input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요(6~15자)" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                    </div>

                    <div class="form-row">
					    <label style="width: 120px; text-align: left; position: relative;">비밀번호 재확인</label>
					    <div class="password-confirm-group"> <input type="password" name="memberPw2">
					        <p class="error-message" id="passwordMismatchMessage">비밀번호가 일치하지 않습니다.</p>
					    </div>
					</div>

                    <div class="form-row">
                        <label>이름</label>
                        <input type="text" pattern="[가-힣]{2,5}" required>
                    </div>

                    <div class="form-row">
                        <label>성별</label>
                        <div class="gender">
                            <label for="male"><input type="radio" name="memberGender" id="male" value="M" checked> 남자 </label>
                            <label for="female"><input type="radio" name="memberGender" id="female" value="F"> 여자 </label>
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



                    <input type="submit" value="회원가입"> <br>
                </form>
            </div>
        </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>

    <script>
        function validateForm() {
            const password = document.querySelector('input[name="memberPw"]').value;
            const confirmPassword = document.querySelector('input[name="memberPw2"]').value;
            const errorMessage = document.getElementById('passwordMismatchMessage');


            if (password !== confirmPassword) {
                errorMessage.style.display = 'block';
                return false; // 폼 제출 방지
            } else {
                errorMessage.style.display = 'none';
            }


            return true; // 폼 제출 허용
        }
    </script>