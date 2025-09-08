<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" href="../resources/css/header.css">
<div id="container">
    <div id="header">
        <div id="logo">
            <a href="/">
                <img src="${pageContext.request.contextPath}/resources/images/jliblogo.png" alt="jLibLogo">
            </a>
        </div>
        
        <c:if test="${memberId eq null }">
        <div id="loginHeader">
                <a href="/login" id="clickLogin">로그인</a>
                <a href="/register" id="clickRegister">회원가입</a>
        </div>
        </c:if>
        
        <c:if test="${sessionScope.memberId ne null && sessionScope.memberId eq 'admin123' }">
        <div id="loginHeader">
                <a href="/manage-member" id="manageMember">회원관리</a>
                <a href="/manage-book" id="manageBook">도서 관리</a>
                <a href="/logout" id="logout">로그아웃</a>
        </div>
        </c:if>
        
        <c:if test="${sessionScope.memberId ne null && sessionScope.memberId ne 'admin123' }">
        <div id="loginHeader">
                <a href="/" id="welcome">${memberName }님 환영합니다.</a>
                <a href="/logout" id="logout">로그아웃</a>
        </div>
        </c:if>
        
        
        <div id="nav">
            <ul id="topMenu">
                <li><a href="/lib-info">도서관 소개</a></li>
                <li><a href="/notice">공지사항</a></li>
                <li><a href="/search">도서 검색</a></li>
                <li><a href="/mylibrary">나의 도서관</a></li>
            </ul>
        </div>
    </div>
</div>