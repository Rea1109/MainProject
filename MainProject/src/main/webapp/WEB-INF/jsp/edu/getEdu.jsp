<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy Edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<style>
 		body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 70px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
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
		        var msg = '������ �����Ͽ����ϴ�.';
		        msg += '�������� : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	
	};
	
	 $(function() {
		 
		$( ".btn:contains('������������')" ).on("click" , function() {
			 
			var eduState = ${edu.eduState}
			
			if(eduState==1) {
				alert("�Ǹ����� ������ ������ �Ұ����մϴ�.")
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

			    	alert("���ɼ����� ��ϵǾ����ϴ�.")
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

			    	alert("���ɼ������� �����Ǿ����ϴ�.")
			    }
			});
		})
	 })
		
	</script>

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
		
		<div id="header"><h1 class="mt-4">${edu.academy.academyName}</h1></div>
		
		<!-- ����� �п�����, ��Ƽ������ �̵� ���� -->
		<jsp:include page="../common/toolbar.jsp"></jsp:include>
	        
	        <div class="container">
				<!-- ���� ���� ������ �̻ڰ� -->
				
				<div  class="row">
					<div class="float-left">
						 <h3 class=" text-info">�����󼼺��� ȭ��</h3>
			      		 <h5 class="text-muted">���������� <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
			      		 <h5 class="text-muted">�Ǹ���, �ǸſϷ�� ������ <strong class="text-danger">����, ����</strong>�� �Ұ����մϴ�.</h5>
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
					<div class="col-xs-8 col-md-4">${edu.eduPrice} ��</div>
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
				  			<button type="button" class="btn btn-primary">���ɼ������</button>
				  			<button type="button" class="btn btn-primary">���ɼ�������</button>
			  			<c:choose>
							  <c:when test= "${edu.eduState == '1' }">
								 <button type="button" class="btn btn-primary">��������</button>
							  </c:when>
							  <c:when test= "${edu.eduState == '2' }">
							  </c:when>
						</c:choose>
		
			  		</div>
				</div>
		      	
		   </div>
      
	</div>

    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>