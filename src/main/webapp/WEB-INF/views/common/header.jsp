<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/header.css">
<div id="container">
    <div id="header">
        <div id="logo">
            <a href="/">
                <img src="${pageContext.request.contextPath}/resources/images/jliblogo.png" alt="jLibLogo">
            </a>
        </div>
        <div id="loginHeader">
                <a href="/login" id="clickLogin">로그인</a>
                <a href="/register" id="clickRegister">회원가입</a>
        </div>
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