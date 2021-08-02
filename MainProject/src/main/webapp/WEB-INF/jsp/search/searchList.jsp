<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy!edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  
  <style>
    @font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	body{
	overflow-x:hidden; overflow-y:visible;
	font-family: 'ChosunGu';
	}
  </style>
  
  <body>
  
      	<c:if test="${lat == null}">
			<jsp:forward page="../common/noResult.jsp"/>
		</c:if>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- ���� ���� ������ �̻ڰ� -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
						     <form>
								<div class="row" style=" position:absolute; right:100px;  top:80px; z-index:2;" >
								  <div class="col-md-3">
								  	<input type="text" name="searchAcademyName" class="form-control" placeholder="�п��� �Է�" >
								  </div>
		
								  <div class="col-md-3">
									<select name="searchAcademyAddr" class="form-control" >
								  		<option value="">����</option>
								  		<option value="���α�">���α�</option>
								  		<option value="�߱�">�߱�</option>
								  		<option value="��걸">��걸</option>
								  		<option value="������">������</option>
								  		<option value="������">������</option>
								  		<option value="���빮��">���빮��</option>
								  		<option value="�߶���">�߶���</option>
								  		<option value="���ϱ�">���ϱ�</option>
								  		<option value="���ϱ�">���ϱ�</option>
								  		<option value="������">������</option>
								  		<option value="�����">�����</option>
								  		<option value="����">����</option>
								  		<option value="���빮��">���빮��</option>
								  		<option value="������">������</option>
								  		<option value="��õ��">��õ��</option>
								  		<option value="������">������</option>
								  		<option value="��õ��">��õ��</option>
								  		<option value="��������">��������</option>
								  		<option value="���۱�">���۱�</option>
								  		<option value="���Ǳ�">���Ǳ�</option>
								  		<option value="���ʱ�">���ʱ�</option>
								  		<option value="������">������</option>
								  		<option value="���ı�">���ı�</option>
								  		<option value="������">������</option>
								  	</select>
								  </div>
		
								  <div class="col-md-2">
									<select name="searchAcademyGrade" class="form-control" >
								  		<option value="">�г�</option>
								  		<option value="�ʵ�">�ʵ�</option>
								  		<option value="�ߵ�">�ߵ�</option>
								  		<option value="���">���</option>
								  		<option value="��3">��3</option>
								  		<option value="N��">N��</option>
								  	</select>
								  </div>
		
								  <div class="col-md-3">
									<select name="searchAcademySubject" class="form-control">
								  		<option value="">����</option>
								  		<option value="����">����</option>
								  		<option value="����">����</option>
								  		<option value="����">����</option>
								  		<option value="��ȸ">��ȸ</option>
								  		<option value="����">����</option>
								  		<option value="��2�ܱ���">�ܱ���</option>
								  		<option value="��ü��">��ü��</option>
								  	</select>
								  </div>
								  
								  <div class="col-md-1" >
								  	<button type="button" id="search" class="btn btn-primary">�˻�</button>
								  </div>
								</div>	
							</form>
								
								<div id="map" style="width:auto;height:600px; border:3px solid white; position:relative; z-index:1; "></div>
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
		
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${lat}, ${lng}), // ������ �߽���ǥ
		        level: 5 // ������ Ȯ�� ����
		    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption);
		
			// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
			var imageSrc =  "/image/marker2.png";
		
			 <c:forEach var="academy" items="${list}">
		
				// ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
			    var imageSize = new kakao.maps.Size(35, 35); 
			    
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
			        self.location = "/academy/academyInfo?academyCode="+"${academy.academyCode}"
			  	});

			    
			 </c:forEach>
			 
			 $("#search").on('click',function(){
				
				$("form").attr("method","POST").attr("action","/search/searchAcademy").submit();
			 });
			 
			
	</script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>