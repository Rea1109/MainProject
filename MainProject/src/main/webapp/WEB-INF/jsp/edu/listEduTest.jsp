<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>�������</title>
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
	
	<script type="text/javascript">
	
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿� 
			
		function fncGetList(currentPage) {
			
			var acaCode = $("#acaCode")
			alert ( acaCode )
			
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/edu/listEdu").submit();
		};
		
		
		$(function() {
			
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
			 
		});
		
		$(function() {
			
			$( "input:radio" ).on("click" , function() {
	
				fncGetList(1);
			});
			 
		});
		
		$( function() {
		      
		      $( "td:nth-child(2)" ).on("click" , function() {
	
		    	 var eduNo = $(this).find('input').val()
		         self.location ="/edu/getEdu?eduNo="+eduNo;
		         
		      });
		      
		      $( "td:nth-child(2)" ).css("color" , "red");
		      
		      $( ".btn:contains('��������')" ).on("click" , function() {
					 
					 var eduNo = $(this).find('input').val()
					 var eduState = $(this).find('#eduState').val()
					 
					 if( eduState == 1 ) {
						 alert ("�Ǹ����� ������ ������ �Ұ����մϴ�.")
					 } else if( eduState == 2 ) {
						 alert ("�ǸſϷ�� ������ ������ �Ұ����մϴ�.")
					 } else if( eduState == 0 ) {
						 $.ajax({
						     url : '/edu/json/deleteEdu/'+eduNo ,
						     method : 'POST',
						     dataType : "json",
						     headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json; charset:UTF-8"
							},
						    success : function(data, status){
	
						    	alert("������ �����Ǿ����ϴ�.")
						    }
						});
					 }
					 
				})
		      
		});
		
	</script>
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
					
					<div class="row">
					
						<div class="col-xs-12 col-md-5">
							<p class="text-primary">
					    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
					    	</p>
						</div>
						
						<div class="col-xs-12 col-md-3">
								<div class="radio">
									  <label >
									    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" >
									    �ǸŴ����
									  </label>
									  <label style="margin-left:20px;">
									    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" >
									    �Ǹ���
									  </label>
									  <label style="margin-left:20px;">
									    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" >
									    �ǸſϷ�
									  </label>
								 </div>
						
						</div>
						
						<div class="col-xs-12 col-md-4">
							<form class="form-inline" name="detailForm">
								  <div class="form-group">
								    <select class="form-control" name="searchCondition" >
										<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>������</option>
										<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>������</option>
									</select>
								  </div>
								  
								  <div class="form-group">
								    <label class="sr-only" for="searchKeyword">�˻���</label>
								    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
								    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  </div>
								  
								  <button type="button" class="btn btn-primary">�˻�</button>
								  
								  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
						</div>
					
					</div>
					
					<div class="row">
						
						<table class="table table-hover table-striped" >
					      
					      	  <c:if test="${user.role == 'student' or user.role == 'parents' }">
							      <c:if test="${edu.eduState == '1' }">
						      		<c:forEach var="edu" items="${eduList}" >
							        <div class="col-sm-6 col-md-4">
							          <div class="thumbnail">
							            <img src="/image/BBBB.png" >
							            <div class="caption" align="center">
							              <h2>${ edu.academy.academyName } <input type="hidden" name="acaCode" id="acaCode" value="${edu.academy.academyCode}"/> </h2>
							              <h5>${ edu.eduName }</h5>
							              <p>&#8361; ${ edu.eduPrice } ��</p>
							              <p>
							              <p><a href="/edu/getEdu?eduNo=${edu.eduNo}&currentPage=${search.currentPage}" class="btn btn-primary" role="button">�󼼺���</a> 
							            </div>
							          </div>
							        </div>
							       </c:forEach>
							      </c:if>
							    </c:if>
							    <c:forEach var="edu" items="${eduList}" >
							        <div class="col-sm-6 col-md-4">
							          <div class="thumbnail">
							            <img src="/image/BBBB.png" width="200" height="auto">
							            <div class="caption" align="center">
							              <h2>${ edu.academy.academyName } <input type="hidden" name="acaCode" id="acaCode" value="${edu.academy.academyCode}"/> </h2>
							              <h5>${ edu.eduName }</h5>
							              <p>&#8361; ${ edu.eduPrice } ��</p>
							              <p>
							              	<c:if test="${ edu.eduState == '0' }">
							              	�Ǹ� �����
							              	</c:if>
							              	<c:if test="${ edu.eduState == '1' }">
							              	�Ǹ���
							              	</c:if>
							              	<c:if test="${ edu.eduState == '2' }">
							              	�ǸſϷ�
							              	</c:if>
							              </p>
							              <p>
							              <p><a href="/edu/getEdu?eduNo=${edu.eduNo}&currentPage=${search.currentPage}" class="btn btn-primary" role="button">�󼼺���</a> 
							            </div>
							          </div>
							        </div>
							       </c:forEach>
				    	</table>
					</div>
					
					<div class="row">
						<jsp:include page="../common/pageNavigator_new.jsp"/>
					</div>
					
				</div>
	      	</div>
      		
       </div>
      	
	</div>
	

    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>