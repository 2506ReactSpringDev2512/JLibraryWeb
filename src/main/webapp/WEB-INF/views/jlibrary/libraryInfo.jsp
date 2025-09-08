<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../resources/css/libraryInfo.css">
    <link rel="stylesheet" href="../resources/css/container.css">
    
<div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div id="subtitleArea">
            <div id="subtitle">도서관 소개</div>
            <p>메인</p> <p>></p> <p>도서관 소개</p>
        </div>
        <div class="section-content">
            <p>제이 도서관은 지역 주민들에게 지식과 문화의 공간을 제공하는 현대적인 복합문화 공간입니다. 다양한 장서와 편의시설을 갖추고 있으며, 모두에게 열린 배움의 장을 지향합니다.</p>
            <br>
            <p>문의: </p>
        </div>


        <div id="subtitleArea">
            <div id="subtitle">찾아오시는 길</div>
        </div>
       
        <div id="map-container">
            <div id="map-overlay"></div>
            <div id="map-marker"></div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.247475306853!2d126.983005!3d37.568470!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca275c88c7f07%3A0x6d9a4f47514b840e!2z7ISc7Jq47Iq57IKY66Gc66mU7JiB7Ja4IOyEnOq1rCDrgqjqta3roZwgMTIw!5e0!3m2!1sko!2skr!4v1624444444444!5m2!1sko!2skr&zoom=15&gestureHandling=none" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" scrolling="no"></iframe>
        </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>