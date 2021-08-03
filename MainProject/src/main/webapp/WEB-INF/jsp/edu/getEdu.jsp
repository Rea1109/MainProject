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
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
	
	function numberWithCommas(eduPrice) {
	      return eduPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   }
	   
	   $(function() {
	      
	      var eduPrice = "${edu.eduPrice}"
	      
	      var eduPrice2 = numberWithCommas(eduPrice)
	      
	      $("#price").text(eduPrice2+"��")
	      
	   })
	
	function fncPurchaseEdu() {
	
		var IMP = window.IMP; // ��������
		IMP.init('iamport'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
			
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0���� ����.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${edu.eduName}',
		    amount : 100,
		    buyer_email : '${user.email}',
		    buyer_name : '${user.name}' ,
		    buyer_tel : '${user.phone}',
		    buyer_addr : '${edu.academy.academyAddr}',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '������ �Ϸ�Ǿ����ϴ�.';
		        var eduNo = ${edu.eduNo}
		        var userNo = ${user.userNo}
		        
		        self.location = "/purchaseedu/addPurchaseEduUid?eduNo="+eduNo+"&userNo="+userNo+"&uid="+rsp.imp_uid
		        		
		    } else {
		        var msg = '������ �����Ͽ����ϴ�.\n';
		        msg += '�������� : ' + rsp.error_msg;
		    }
		    //alert(msg);
		    swal(msg);
		});
	
	};
	
	 $(function() {
		 
		$( ".btn:contains('������������')" ).on("click" , function() {
			 
			var eduState = ${edu.eduState}
			
			if(eduState == 1) {
				swal("�Ǹ����� ������ ������ �Ұ����մϴ�.")
			} else if(eduState == 2) {
				swal("�ǸſϷ�� ������ ������ �Ұ����մϴ�.")
			} else {
				self.location = "/edu/updateEdu?eduNo=${edu.eduNo}"
			}
			
		});
		
		$( ".btn:contains('�������')" ).on("click" , function() {
			
			self.location = "/edu/listEdu?acaCode=${edu.academy.academyCode}"
		});
		
		$( ".btn:contains('��������')" ).on("click" , function() {
			
			fncPurchaseEdu()
		});
		
	});
	
	 $(function() {
		
		 $( ".btn:contains('���ɼ������')" ).on("click" , function() {
			 
			 $.ajax({
			     url : '/pickedu/json/addPickEdu/${edu.eduNo}/${edu.academy.academyCode}' ,
			     method : 'POST',
			     dataType : "json",
			     headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json; charset:UTF-8"
				},
			    success : function(data, status){

			    	swal(data)
			    }
			});
		})
		
		$( ".btn:contains('���ɼ�������')" ).on("click" , function() {
			 
			 var eduNo = ${edu.eduNo}
			 
			 $.ajax({
			     url : '/pickedu/json/deletePickEdu/${edu.eduNo}' ,
			     method : 'POST',
			     dataType : "json",
			     headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json; charset:UTF-8"
				},
			    success : function(data, status){

			    	swal("���ɼ������� �����Ǿ����ϴ�.")
			    }
			});
		})
	 })
		
	</script>
	
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
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
	        
	        <div class="container-fluid"  >
	        
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				 <!-- ���� ���� ������ �̻ڰ� -->
				 <div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
				 
				 <div  class="col-sm">
					<div class="float-center">
						 <h1 id="titlef" class=" text-info" align="center">&nbsp;���� �󼼺���</h1>
			      		 <c:if test="${user.role == 'academy' }">
                         <h4 align="center">�Ǹ���, �ǸſϷ�� ������ <span style="color:#FFAB00; font-size: 18px;"><strong>����, ����</strong></span>�� �Ұ����մϴ�.</h4>
                      	 <br>
                      	</c:if>
					</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduName}</div>
					<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduTeacher}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-xs-4 col-md-2 "><strong>���� ���� ��¥</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduStartDate}</div>
					<div class="col-xs-4 col-md-2 "><strong>���� ���� ��¥</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduEndDate}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-xs-4 col-md-2 "><strong>������</strong></div>
					<div class="col-xs-8 col-md-4" id="price">${edu.eduPrice} ��</div>
					<div class="col-xs-4 col-md-2 "><strong>�� �ο�</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduMember} ��</div>
				</div>
				
				
				
				<hr/>
				
				<div class="row">
					<div class="col-md-2 "><strong>���� ���� �ð�</strong></div>
					<div class="col-md-4">${edu.eduStartTime}</div>
					<div class="col-xs-4 col-md-2 "><strong>���� ����</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduDay}</div>
					<div class="col-md-2 "><strong>���� ���� �ð�</strong></div>
					<div class="col-md-4">${edu.eduEndTime}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-md-2 "><strong>���� ����г�</strong></div>
					<div class="col-md-4">${edu.eduGrade}</div>
					<div class="col-xs-4 col-md-2 "><strong>���� ����</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduSubject}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-md-2 "><strong>������ ���� ����</strong></div>
					<div class="col-xs-8 col-md-4">${edu.eduIntro}</div>
				</div>
				
				<hr/>
				
				<div class="row">
			  		<div class="col-md-12 text-center ">
			  			<c:if test="${user.role == 'academy' }">
			  				<button type="button" class="btn btn-primary">������������</button>
			  			</c:if>
				  			<button type="button" class="btn btn-primary">�������</button>
			  			<c:if test="${user.role == 'student' || user.role == 'parents'}">
			  				<c:if test="${edu.eduState == '1'}">
			  					<button type="button" class="btn btn-primary">���ɼ������</button>
			  					<button type="button" class="btn btn-primary">��������</button>
			  				</c:if>
			  			</c:if>
		
			  		</div>
				</div>
				 
			</div>
	    </div>
	    
	    <!-- footer �ڸ� -->
       		<jsp:include page="../common/footer.jsp"></jsp:include>
	    
      		
        </div>
    </div>
      	
    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>