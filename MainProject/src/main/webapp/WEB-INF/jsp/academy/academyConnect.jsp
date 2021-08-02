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
	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
			body{
				overflow-x:hidden; overflow-y:visible;
				font-family: 'ChosunGu';
			}
			
			#panel-color{
				background-color: black !important;
			}
			
			
			@font-face {
			    font-family: 'TmonMonsori';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
			#table{
				width : 110%;
			}
			
			#tableHead{
				background-color : #F8B739;
				color : white;
				text-align : center;
				font-size : 18px;
			}
			
			
		
 		</style>
	

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        	 
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- ���� ���� ������ �̻ڰ� -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="row">
					
					<div class="col-sm-3"> <!-- 3 �κ� -->
					</div>
					<div class="col-sm-6"> <!-- ���� �κ� -->
					
						<!-- �п� �̸�, ��ȭ��ȣ -->
						<div id="academytitle" class="row" > </div>
						
						<!-- �߰� ������ ����-->
						<div class="col-sm-12" align="center">
							<h4><strong><span>���� ����</span></strong></h4>
						</div><br>
						<br>
						<br>
						<!-- �߰� ������ ��-->
						
						 <div class="panel" style="border:1px solid #ECECEC;">
				            <div class="panel-heading" style="background-color:#ECECEC;">
				              <h3 class="panel-title" id="titlef">���� ��û�� �л� ����</h3>
				            </div>
				            <div class="panel-body"> 
				               	<table id="table" name="table" class="table" >
					   			 </table>
				            </div>
				          </div>
						
				
					
					</div>
					<div class="col-sm-3"> <!-- 3 �κ� -->
					</div>
					
					
					
 
						    
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script >
	var academyCode = '${academy.academyCode}';
	
	function getAcademyInfo(){
		$.ajax({
			 url : '/academy/json/getacademyInfo/'+academyCode,
		     method : 'GET',
		     dataType : "json",
			 success : function(data){
				 console.log(data);
				 academyInfo = data;
					 
				var b = '';
					b += '<div id="titlef" class="col-md-12" style="font-size: 45px;" align="center">'+data.academyName+'</div>'
				 
				$("#academytitle").html(b);
					 
			 }							
		});		
	}
	
	function connectList(){
    	$.ajax({
    		url : '/academy/json/academyConnect/${academy.academyCode}',
    		type : 'post',
    		success : function(data){
    			console.log(data);
    			$.each(data, function(key,value){
    						
    				var a = ''
    				
    				if(value.length == 0){
						a += '<span>'
						a += '<img src="/image/crying.png">'
						a += '���� ��û�� �л��� �����ϴ�.!</span>'
					}else{
    					a += '<thead><tr>'
    					a += '<th align="center">No</th>'
    					a += '<th align="center">�̸�</th>'	
    					a += '<th align="center">��������</th>'		
    					a += '<th align="center">�������</th>'
    					a += '</tr></thead>'
    					
    					
    					a += '<tbody>'
    					
    					for(var i=0; i<value.length;i++){
            				
            				a += '<tr><td align="left">'+(i+1)+'</td>'
            				a += '<td align="left"><span class="cntStudentName" name="cntStudentName">'+(value[i].user.name)+'</span>'
            				a += '<input type="hidden" name="cntUserNo" value="'+(value[i].user.userNo)+'"></td>'
            				a += '<td align="left">'
            				
            					if(value[i].connectState == 0){
            						a += '<a onclick="updateConnect('+value[i].connectNo+')">���� �����</a>'	
            					} else {
            						a += '���л� �Դϴ�.'	
            					}
            				
            				a += '</td>'	
            				a += '<td align="left">'	
            				
            					if(value[i].connectState == 0){
            						a += '<a onclick="deleteConnect('+value[i].connectNo+')">���� �ź�</a>'	
            					} else {
            						a += '<a onclick="deleteConnect('+value[i].connectNo+')">���� ����</a>'	
            					}
            				a += '</td></tr>'	
            									
            			}
    					a += '</tbody>'	
					}	        				
    					
        			$("#table").html(a);
    			});
    		}
    	});
    }
    
//  ���� ��û ����
	function updateConnect(connectNo){
		if(confirm('���� �Ͻðڽ��ϱ�?')){
			
		    $.ajax({
		    	
		        url : '/academy/json/updateConnect/'+connectNo,
		        type : 'post',
		        success : function(data){
		        	alert("���� �Ǿ����ϴ�!")
		        }
		    });
		}
		
		location.reload();
	}
	
	//  ���� ��û ���� -> ������ ����?
	function deleteConnect(connectNo){
		if(confirm('��û �л��� ���� �Ͻðڽ��ϱ�?')){
			
		    $.ajax({
		    	
		        url : '/academy/json/deleteConnect/'+connectNo,
		        type : 'post',
		        success : function(data){
		        	alert("���� �Ǿ����ϴ�!")
		        }
		    });
		}
		
		location.reload();
	}
	

	$(document).ready(function(){
		getAcademyInfo(); 
		connectList();
	});
			
	</script>
	<!-- <script src="/js/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>