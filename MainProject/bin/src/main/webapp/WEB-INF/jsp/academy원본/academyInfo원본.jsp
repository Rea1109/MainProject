<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//============= �α��� ȭ���̵� =============
	$( function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('�α׾ƿ�')").on("click" , function() {
			self.location = "/user/logout"
		});
	});
	
	$( function() {
		//==> �߰��Ⱥκ� : "getUser"  Event ����
		$("a[href='#' ]:contains('����������')").on("click" , function() {
			self.location = "/user/getUser?email=${user.email}"
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('��й�ȣ����')").on("click" , function() {
			self.location = "/user/updatePassword?email=${user.email}"
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('Ż���ϱ�')").on("click" , function() {
			self.location = "/user/outUser?email=${user.email}"
		});
	});
	
	
	
	</script>

<title>Academy main page</title>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">buyEdu</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">�α׾ƿ�</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ����������
         			</div>
         			<!--  ȸ������ ������ -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������</a> <i class="glyphicon glyphicon-ok"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">��й�ȣ����</a>
						 </li>
						  <li class="list-group-item">
						 	<a href="#">Ż���ϱ�</a>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �п� ����
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">��Ƽ�̵�� ����</a>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�п� �ı�</a>
						 </li>
					</ul>
		        </div>
		        
		        <div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �Խ���
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="/board/listBoard">�����Խ���</a>
						 </li>
					</ul>
		        </div>

				
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   

			<h1>�п� �̸� ��ȣ / �Ұ� / ���� / ����</h1> 		
	 	 	
		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->

	</div>




</body>
</html>

























