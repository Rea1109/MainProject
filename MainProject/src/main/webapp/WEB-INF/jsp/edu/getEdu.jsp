<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


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
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			 
			$( ".btn:contains('������������')" ).on("click" , function() {
				 
				self.location = "/edu/updateEdu?eduNo=${edu.eduNo}"
			});
			
			$( ".btn:contains('�������')" ).on("click" , function() {
				 
					self.location = "/edu/listEdu"
			});
			
		});
		
		 $(function() {
			
			 $( ".btn:contains('���ɼ������')" ).on("click" , function() {
				 
				 var eduNo = ${edu.eduNo}
				 var acaCode = "ABC127"
				 
				 $.ajax({
				     url : '/pickedu/json/addPickEdu/${edu.eduNo}/'+acaCode ,
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
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduTeacher}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���� ���� ��¥</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduStartDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduPrice}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������ ���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduIntro}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���� ����</strong></div>
			<div class="col-xs-8 col-md-4">${edu.eduDay}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">������������</button>
	  			<button type="button" class="btn btn-primary">�������</button>
	  			<button type="button" class="btn btn-primary">���ɼ������</button>
	  			<button type="button" class="btn btn-primary">���ɼ�������</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>