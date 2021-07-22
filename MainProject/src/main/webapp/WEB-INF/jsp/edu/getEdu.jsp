<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 70px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
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
				
				var eduNo = ${edu.eduNo}
				self.location = "/purchaseedu/addPurchaseEdu?eduNo="+eduNo
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


	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">�����󼼺��� ȭ��</h3>
	       <h5 class="text-muted">���������� <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	       <h5 class="text-muted">�Ǹ���, �ǸſϷ�� ������ <strong class="text-danger">����, ����</strong>�� �Ұ����մϴ�.</h5>
	    </div>
	
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
	  			<button type="button" class="btn btn-primary">������������</button>
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
		
		<br/>
		
 	</div>

</body>

</html>