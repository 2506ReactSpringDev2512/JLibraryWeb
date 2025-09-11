<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <c:if test="${member != null}">
                <form action="/admin/modify-member" method="post">
                    <div class="form-row">
                        <label>아이디</label>
                        <input type="text" value="${memberId}" readonly>
                    </div>

                    <div class="form-row">
                        <input type="text" value="${memberName}" pattern="[가-힣]{2,5}" readonly>
                    </div>

                    <div class="form-row">
                        <label>성별</label>
                        <div class="gender">
                            <input type="radio" name="memberGender" value="M" ${member.gender == 'M' ? 'checked' : ''}>남
                            <input type="radio" name="memberGender" value="F" ${member.gender == 'F' ? 'checked' : ''}>여
                        </div>
                    </div>
               
                    <div class="form-row">
                        <label>나이</label>
                        <input type="number" name="memberAge" value="${member.age}" min="1" max="100" required>
                    </div>

                    <div class="form-row">
                        <label>휴대폰 번호</label>
                        <input type="text" name="memberPhone" value="${member.phone}" pattern="010-[0-9]{4}-[0-9]{4}" required>
                    </div>
                    <input type="submit" value="수정하기"> <br>
                </form>
                </c:if>
            </div>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>