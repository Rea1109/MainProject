<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>�п� �˻�</title>
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
	
	
	<style>
	
	.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px; 
    border-top-right-radius: 0px; 
	}
	
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
	
		    #title{
				vertical-align : top;
				font-size : 50px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			#count{
				vertical-align : bottom;
				font-size : 20px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			#phone{
				vertical-align : right;
				font-size : 15px;
				color : #1F4E79;
				font-family : TmonMonsori;
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
					

					<div class="row">
						<div align="right" class="col-md-12">
						<c:if test="${count == 0 && state == '1'}">
							<button type="button" id="addReview" class="btn btn-primary" onclick="addReview();">�ۼ�</button>
						</c:if>
						</div>	
					</div>
					
					
					<div class="row">
					<div class="col-md-12">
					<form>	
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
						
							 
					<c:forEach var="review" items="${listR}">
							 
					<div class="col-md-4">
							 <div class="panel" style="border:5px solid #FFCA77;">
							 <div class="panel-heading" style="background-color:#FFCA77;">
							 
							      <h3 class="panel-title" style="padding-left: 10">${review.reviewTitle}</h3>
							      <div align="right">${review.reviewDate}</div>
							 </div>
							 <div class="panel-body" style="padding-left: 30">${review.reviewContent}</div>
							 <div align="right" style="padding-right: 20">${review.reviewWriter.email}</div>
							 
							 <c:if test="${review.reviewWriter.email == user.email}">
							 <button class="btn btn-primary" id="update" value="${review.reviewNo}" style="margin-left: 10; margin-bottom: 5;">�� ��</button>
							 <button class="btn btn-primary" id="delete" value="${review.reviewNo}" style="margin-left: 10; margin-bottom: 5;">�� ��</button>
							 </c:if>
							 
							</div> 
					</div>
					
					</c:forEach>
						
					</form>
					
					</div>
					</div>
					
					
						</div>
					          </div>
						<jsp:include page="../common/pageNavigator_new.jsp"></jsp:include>
						
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																				
	var academyCode = '${academy.academyCode}';
	
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage)	
		$("form").attr("method","post").attr("action","/review/listReview?academyCode="+academyCode).submit()	
	}
	
	
	function addReview(){
		self.location = "/review/testAddReview?userNo=${user.userNo}&academyCode="+academyCode
	}
	
	
	 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn:contains('��')" ).on("click" , function() {
				 if(confirm("�����Ͻðڽ��ϱ�?")==true){
					 
				 var reviewNo = $("div").find('button#delete').val();
					self.location = "/review/deleteReview?reviewNo="+reviewNo+"&academyCode="+academyCode
				 }else{
					 return false;
				 }
				});
		});
	 
	 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".btn:contains('��')" ).on("click" , function() {
				 
				 var reviewNo = $("div").find('button#update').val();
					self.location = "/review/updateReview?reviewNo="+reviewNo+"&academyCode="+academyCode
				});
		});

	function getAcademyInfo(){
		$.ajax({
			 url : '/academy/json/getacademyInfo/'+academyCode,
		     method : 'GET',
		     dataType : "json",
			 success : function(data){
				 console.log(data);
				 academyInfo = data;
					 
				var b = '';
					b += '<div id="title" class="col-md-4" style="">'+data.academyName+'</div>'
					b += '<div id="count" class="col-md-5" > �л� �� : '+data.count+'�� &nbsp;&nbsp; ���� �� : '+data.count2+'��</div>'
			        b += '<div id="phone" class="col-md-3" align="right"> <img alt="��ȭ��ȣ" src="/image/phone_icon.png" height="20">&nbsp;'+data.academyPhone+'</div>'
					 
				$("#academytitle").html(b);
					 
			 }							
		});		
	}
	
	$(document).ready(function(){
		getAcademyInfo(); 
	});
				
	</script>
		
    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>