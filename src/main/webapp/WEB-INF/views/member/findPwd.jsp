<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../resources/css/findPwd.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">비밀번호 찾기</div>
            <p>메인</p> <p>></p> <p>로그인</p> <p>></p> <p>비밀번호 찾기</p>
        </div>


        <div id="tbody">
            <div id="findPwd">
                <form id="findPwdForm" onsubmit="return checkAuthNumber()" action="/findPwd" method="post">
                    <div class="form-row">
                        <label>아이디</label>
                        <input type="text" placeholder="아이디를 입력해주세요" name="memberId" minlength="6" maxlength="15" pattern="[A-Za-z0-9]+" required>
                    </div>


                    <div class="form-row">
                        <label>이름</label>
                        <input type="text" placeholder="이름을 입력해주세요" name="memberName" pattern="[가-힣]{2,5}" required>
                    </div>


                    <div class="form-row">
                        <label>휴대폰 번호</label>
                        <div class="phone-input-wrapper">
                            <input type="text" placeholder="010-1234-5678" name="memberPhone" pattern="010-[0-9]{4}-[0-9]{4}" required>
                			<button type="button" class="verify-btn" onclick="requestAuthNumber()">인증번호 요청</button>
                        </div>
                    </div>
                    
                    <div class="form-row">
			            <label>인증번호 입력</label>
			            <input type="text" placeholder="인증번호를 입력해주세요" id="authNumberInput" required>
			        </div>


                    <div class="submit-wrapper">
                        <input type="submit" value="확인">
                    </div>
                </form>
            </div>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>

<script>
let authNumber = "";

function requestAuthNumber() {
    authNumber = Math.floor(100000 + Math.random() * 900000); // 6자리 랜덤
    alert("인증번호: " + authNumber);
}

function checkAuthNumber() {
    let userInput = document.getElementById("authNumberInput").value;
    if (userInput !== authNumber.toString()) {
        alert("인증번호가 틀렸습니다.");
        return false;
    }
    // 서버로 전송
    return true;
}
</script>