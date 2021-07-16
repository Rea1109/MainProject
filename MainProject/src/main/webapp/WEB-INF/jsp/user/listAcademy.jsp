<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
</head>
<body>
	
	<c:if test="${lat == null}">
 		<jsp:forward page="../noData.jsp"/>
	</c:if>
	
	
	<form>

	<div id="map" style="width:100%;height:560px;"></div>
	
  	<input type="text" name="searchAcademyName" placeholder="�п��� �Է�" >
  	<input type="text" name="searchAcademyAddr" placeholder="�� �̸� �Է�">
  	<input type="text" name="searchAcademyGrade" placeholder="�г� �Է�">
  	<input type="text" name="searchAcademySubject" placeholder="���� �Է�">
	
	<button type="button">�˻�</button>
	
	</form>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0"></script>

	<script >
	
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${lat}, ${lng}), // ������ �߽���ǥ
	        level: 5 // ������ Ȯ�� ����
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
		// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
		var imageSrc =  "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
		 <c:forEach var="academy" items="${list}">
	
			// ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // ��Ŀ �̹����� �����մϴ�    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    var latlng = new kakao.maps.LatLng(${academy.academyLat},${academy.academyLng});
		    
		    // ��Ŀ�� �����մϴ�
		    var marker = new kakao.maps.Marker({
		        map: map, // ��Ŀ�� ǥ���� ����
		        position: latlng, // ��Ŀ�� ǥ���� ��ġ
		        title : "${academy.academyName} / ${academy.academyAddr}",
		        image : markerImage // ��Ŀ �̹��� 
		    }); 
		    
		    
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // ��Ŀ ���� ���������츦 ǥ���մϴ�
		        alert("${academy.academyName} �� �̵�!"); 
		  	});
		    
		 </c:forEach>
		 
		 $("button").on('click',function(){
			
			$("form").attr("method","POST").attr("action","/academy/listAcademy").submit();
		 });
		
	</script>
	

	
</body>
</html>
