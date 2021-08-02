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
	
	<style>
		.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	    z-index: 3;
	    color: #fff;
	    cursor: default;
	    background-color: #F8B739;
	    border-color: #F8B739;
	   }
	   
	    @font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
   }
	
   body{
   overflow-x:hidden; overflow-y:visible;
   font-family: ChosunGu;
   }
	
	#tableHead{
	background-color : #4D4D4D;
	color : white;
	text-align : center;
	font-size : 18px;
	}
	   
	</style>
	
	<script type="text/javascript">
	
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿� 
		
		function fncGetList(currentPage) {
			
			$("#currentPage").val(currentPage)
		   	$("form").attr("method", "POST").attr("action","/purchaseedu/listPurchaseEdu").submit();
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
		      
		      $( "td:nth-child(3)" ).on("click" , function() {

		    	 var eduNo = $(this).find('input').val()
		    	 var academyCode = $(this).find('#academyCode').val()
		    	 
		    	 
		         self.location ="/edu/getEdu?eduNo="+eduNo+"&academyCode="+academyCode;
		         
		      });
		      
		      $( "td:nth-child(3)" ).css("color" , "#FFAB00");
		      
		      $( ".btn:contains('���')").on("click", function() {
		    	  
		    	  var userNo = "${user.userNo}"
		    	  var eduNo = $(this).find('input').val()
		    	
		    	  $.ajax({
					    url : '/purchaseedu/json/deletePurchaseEdu/'+userNo+"/"+eduNo ,
					    method : 'POST',
				 	    dataType : "json",
					    headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json; charset:UTF-8"
						},
					    success : function(data, status){

					    	alert("������ ��ҵǾ����ϴ�. ȯ�ұ��� �� 3~5������ �ҿ�˴ϴ�.")
					    	
					    	self.location = "/purchaseedu/listPurchaseEdu?userNo="+userNo
					    }
					});
		    	  
		      })
		      
		});
	
  </script>
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- ���� ���� ������ �̻ڰ� -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="row">
					
					<div class="col-md-12">
						<div id="titlef" class="col-md-12" style="font-size: 38px;" align="center">
			    			�������Ÿ��
			    		</div>
			    		
			    		<div class="col-md-12">
			    			<br>
			    		</div>
			    		
					  <c:if test="${empty list}">
					      <div class="col-md-12">
							<hr>
						  </div>
					  </c:if>
						
					</div>
					
					
					 <c:if test="${empty list}">
				      	<div class="col-sm" align="center">
							<span><img src="/image/nothing.png"></span>
						</div>
					  </c:if>
						
					<c:if test="${!empty list}">	
						<table class="table table-hover table-striped" >
      
					        <thead>
					          <tr>
					            <th align="center">No</th>
					            <th align="left">�п���</th>
					            <th align="left">������</th>
					            <th align="left">���� ������</th>
					            <th align="left">������</th>
					            <th align="left">��������</th>
					            <th align="left">��������</th>
					            <th align="left">�п��ڵ�</th>
					            <th align="left"></th>
					          </tr>
					        </thead>
					       
							<tbody>
		
							  <c:set var="i" value="0" />
							  <c:forEach var="purchase" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
								  <td align="center">${ i }</td>
								  <td align="left">${purchase.purchaseAcademy.academyName}</td>
								  <td align="left"><strong>${purchase.purchaseEdu.eduName}
									  	<input type="hidden" name="eduNo" id="eduNo" value="${purchase.purchaseEdu.eduNo}"/>
									  	<input type="hidden" name="academyCode" id="academyCode" value="${purchase.purchaseAcademy.academyCode}"/>
								  	</strong>
								  </td>
								  <td align="left">${purchase.purchaseEdu.eduStartDate}</td>
								  <td align="left">${purchase.purchaseEdu.eduPrice}</td>
								  <td align="left">${purchase.payDate}</td>
								  <td align="left">
								  <c:choose>
										  <c:when test= "${purchase.payState == '0' }">
											���ſϷ�
										  </c:when>
										  <c:when test= "${purchase.payState == '1' }">
											��ҿϷ�
										  </c:when>
								  </c:choose>
								  </td>
								  <td align="left">
								  <c:choose>
										  <c:when test= "${purchase.payState == '0' }">
											${purchase.purchaseAcademy.academyCode}
										  </c:when>
										  <c:when test= "${purchase.payState == '1' }">
										  </c:when>
								  </c:choose>
								  <td align="left"> 
								  <button type="button" class="btn btn-primary">��� 
								  <input type="hidden" name="eduNo" id="eduNo" value="${purchase.purchaseEdu.eduNo}"/> </button>
								  </td>
								</tr>
					          </c:forEach>
					        
					        </tbody>
					      
					    </table>
					  </c:if>   
					    
					</div>
					
					 <c:if test="${empty list}">
					      <div class="col-md-12">
							<hr>
						  </div>
					 </c:if>
					
					<div class="row">
						<jsp:include page="../common/pageNavigator_new.jsp"/>
					</div>
					
				</div>
	      	</div>
	      	
	      	 <!-- footer �ڸ� -->
       		<jsp:include page="../common/footer.jsp"></jsp:include>
      		
       </div>
      	
	</div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>