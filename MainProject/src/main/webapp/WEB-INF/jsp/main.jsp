<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy Edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
		 p { margin:20px 0px; }
	</style>
	

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" >
		
		<!-- left -->
		<jsp:include page="./common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">

			<!-- ����� �п�����, ��Ƽ������ �̵� ���� -->
	        <div class="container-fluid">
	        
				<!-- �п� ����Ʈ ī�� -->
				<div id="academyList" class="row">
				</div>
	      	</div>
      	
       </div>
      
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	<!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    
    <script>
        
        var userno = '${user.userNo}';
        var role = '${user.role}';
        
        function academyList(){
        	$.ajax({
        		url : '/academy/json/academyProfile/${user.userNo}',
        		type : 'get',
        		success : function(data){
        			console.log(data);
        			$.each(data, function(key,value){
        				
        				var a = '';
        				
        				if(value.length<=2){
        					a += '<div class="col-lg-4"><div class="card shadow mb-4">'
    						a += '<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">'
    						a += '<h6 class="m-0 font-weight-bold text-primary"> �п� ��� �ϱ� </h6></div>'
    						
    						a += '<div class="card-body">'
    						a += '<a href="/academy/addAcademyView"> >> �п� ��� �ϱ� << </a></div></div></div>'
    					}
        				
        				for(var i=0; i<value.length;i++){
        					
        					a += '<div class="col-lg-4"><div class="card shadow mb-4">'
        					a += '<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">'
        					a += '<h6 class="m-0 font-weight-bold text-primary">'
        					a += '<a href="/academy/academyInfo?academyCode='+(value[i].academyCode)+'" >'+value[i].academyName+'</a></h6>'
        					a += '<div class="dropdown no-arrow">'
        					a += '<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
        					a += '<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i></a>'
        					a += '<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">'
        					a += '<div class="dropdown-header">Dropdown Header:</div>'
        					a += '<a onclick="deleteAcademyProfile(\''+(value[i].academyCode)+'\')" class="dropdown-item"> �п� ������ ���� </a>'
        					a += '</div></div></div>'
        					
        					a += '<div id="academyInfo_' + i +'" class="card-body">'
        					a += ' �п� ���� '+getAcademyInfo(i, value[i].academyCode) 
        					a += '</div></div></div>'
        													
        				}
        				
            			$("#academyList").html(a);
        				
        			});
        		}
        	});
        }
        
        function getAcademyInfo(index, academyCode){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 
					 var a = ''
					 	 a += 'PHONE : ' + data.academyPhone
				 		 a += '<br/><br/>������ : ' + data.academyArea
				 		 a += '<br/><br/>�л��� : ' + data.count + '��'
				 		 a += '<br/><br/>������ : ' + data.count2 + '��'
			
				 		 // �ι�° ����° ���� ���޾ƿ�
				 		 // ���� �л� ��
				 		 // ��� ���� ��
				 					
					$("#academyInfo_" + index).html(a);
				 }							
			});		
		}
        
		
		// �п� ������ �����ϱ�
		function deleteAcademyProfile(academyCode){
			alert(academyCode)
			
			if(confirm('�п��� ���õ� ��� ������ �����˴ϴ�. �׷��� ���� �Ͻðڽ��ϱ�?')){
				
			    $.ajax({
			    	
			        url : '/academy/json/deleteAcademyAll/'+academyCode,
			        type : 'post',
			        success : function(data){
			            alert("������ �Ϸ�Ǿ����ϴ�!")
			            function academyList();
			        }
			    });
			}
		}
        
        
        $(document).ready(function(){
            academyList();
        });
        
        </script>
    
  </body>
</html>