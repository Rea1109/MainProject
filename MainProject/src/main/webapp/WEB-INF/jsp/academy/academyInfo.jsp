<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Academy Info</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>	
	
	<style>
		    
		    #academytitle{
				vertical-align : top;
				font-size : 0px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			@font-face {
			    font-family: 'TmonMonsori';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}

 		</style>
	

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        	 
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- ���� ���� ������ �̻ڰ� -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					
					<!-- �п� �̸�, ��ȭ��ȣ -->
					<div id="academytitle" class="row" ></div>		
						    
					<!-- �п� ���� -->
					<div id="academyInfo" class="row" style="margin-top: 30px;"></div>	 
					
					 
					
					<div class="row" style="margin-top: 30px;">
						<div class="col-md-12" >
							<div id="map" style="width:auto;height:400px; border:3px solid gold; "></div>
						</div>
					</div>
 
						    
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new kakao.maps.LatLng(${academy.academyLat}, ${academy.academyLng}), // ������ �߽���ǥ
        level: 5 // ������ Ȯ�� ����
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
	var imageSrc =  "/image/marker2.png";
	
	// ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // ��Ŀ �̹����� �����մϴ�    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
	var latlng = new kakao.maps.LatLng(${academy.academyLat},${academy.academyLng});
	
	// ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: latlng, // ��Ŀ�� ǥ���� ��ġ
        image : markerImage // ��Ŀ �̹��� 
    }); 
	
	
	var academyCode = '${academy.academyCode}';
	var role = '${user.role}';
	var academyInfo = {};

	alert("1");
	
	function getAcademyInfo(){
		$.ajax({
			 url : '/academy/json/getacademyInfo/'+academyCode,
		     method : 'GET',
		     dataType : "json",
			 success : function(data){
				 console.log(data);
				 academyInfo = data;
				 
				 var a = ''
					 a += '<div class="col-md-2">'
					 a += '<img alt="�л���" src="/image/studentcount.png" height="50">'
					 a += '<span>'+ data.count+'�� &nbsp;&nbsp;&nbsp;</span></div>'
					 a += '<div class="col-md-2">'
					 a += '<img alt="���¼�" src="/image/educount.png" height="50">'
					 a += '<span>'+ data.count2+'�� </span></div>'
					 
				 	 a += '<div class="col-md-4" id="AcademyIntro" style="white-space: pre;">'
			 	 	 a += '�п� �Ұ� : <br/>' + data.academyIntro
			 	 	 
			 	 if(role == 'academy'){
			 	 	 a += '<br/><a class="btn btn-primary" style="margin-top: 7px;" onclick="updateIntro(\''+data.academyCode+'\')"> �� �� </a>'
			 	 }
			 		 a += '</div>'
			 		 
			 		 a += '<div class="col-md-4" id="AcademyHistory" style="white-space: pre;">'
			 		 a += '�п� ���� : <br/>' + data.academyHistory
			 		 
			 	if(role == 'academy'){
					 a += '<br/><a class="btn btn-primary" style="margin-top: 7px;" onclick="updateHistory(\''+data.academyCode+'\')"> �� �� </a>'
			 	}
					 a += '</div>'
			 					
				var b = '';
					b += '<div id="header"><h1 class="mt-4">'+data.academyName+'</h1> <h3>'+data.academyPhone+'</h3></div>'
					
			            	
					 
				$("#academyInfo").html(a);
				$("#academytitle").html(b);
					 
			 }							
		});		
	}
	
	// �Ұ��� �ؽ�Ʈ area ����
	function updateIntro(academyCode){
	    var intro ='';
	    
	    alert("�ڵ� = " + academyCode + "�Ұ��� = "+academyInfo.academyIntro);
	    
	    	intro += '<div id="AcademyIntro">';
	    	intro += '<textarea name="academy_'+academyCode+'" rows="3" cols="40">'+academyInfo.academyIntro+'</textarea>'
	   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveIntro(\''+academyCode+'\');">����</button> </span>';
	   	 	intro += '</div>';
	    
	    $('#AcademyIntro').html(intro);
	    
	}
	 
	// �Ұ��� ����
	function saveIntro(academyCode){
	    var updateIntro = $('[name=academy_'+academyCode+']').val();
	    
	    $.ajax({
	        url : '/academy/json/updateIntro/'+academyCode,
	        type : 'POST',
	        data : {'academyCode' : academyCode, 'updateIntro' : updateIntro},
	        success : function(data){
	        	alert("���� �Ϸ�!");
	        	getAcademyInfo();
	        }
	    });
	}
	
	// ������ �ؽ�Ʈ area ����
	function updateHistory(academyCode){
	    var intro ='';
	    
	    alert("�ڵ� = " + academyCode + "������ = "+academyInfo.academyHistory);
	    
	    	intro += '<div id="AcademyHistory">';
	    	intro += '<textarea name="academy_'+academyCode+'" rows="3" cols="40">'+academyInfo.academyHistory+'</textarea>'
	   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveHistory(\''+academyCode+'\');">����</button> </span>';
	   	 	intro += '</div>';
	    
	    $('#AcademyHistory').html(intro);
	    
	}
	 
	// ������ ����
	function saveHistory(academyCode){
	    var updateHistory = $('[name=academy_'+academyCode+']').val();
	    
	    $.ajax({
	        url : '/academy/json/updateHistory/'+academyCode,
	        type : 'POST',
	        data : {'academyCode' : academyCode, 'updateHistory' : updateHistory},
	        success : function(data){
	        	alert("���� �Ϸ�!");
	        	getAcademyInfo();
	        }
	    });
	}

	$(document).ready(function(){
		getAcademyInfo(); 
	});
	
	// �п� ��������
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		var acaWriter=$('input[name="acaWriter"]').val();
			$("form").attr("method" , "POST").attr("action" , "/academy/academyInfo?academyCode="+acaWriter).submit();
	}
	
	function enterEvent(){
		if(window.event.keyCode == 13){
			fncGetList(1);
		}
	}
	
	$(function() {
		 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1);
		});
	 });
	
			
	</script>
	<!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>