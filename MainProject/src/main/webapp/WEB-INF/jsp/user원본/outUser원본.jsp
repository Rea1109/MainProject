<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

	
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
			//==> �߰��Ⱥκ� : "listUser"  Event ����
			$("a[href='#' ]:contains('��üȸ������')").on("click" , function() {
				self.location = "/user/listUser"
			});
		});
		
		
$( function() {
			
			fncCheckPassword();
			
		});
		
		
		//���� ��й�ȣ �´��� Ȯ��
		function fncCheckPassword() {
			 
			$("#password0").blur(function(){
				
				var email = $("#email").val();
				var password = $("#password0").val();
				
				console.log(email);
				console.log(password);
			
				$.ajax( 
						{
							url : "/user/json/checkPassword",
							method : "POST" ,
							data : JSON.stringify({
								email : email,
								password: password,
							}),
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {
								
								//alert("����!");

								if (JSONData.result == "no") {
									console.log("��� NO");
									$(".password_check").text("��й�ȣ�� ���� �ʽ��ϴ�");
									$(".password_check").css("color", "red");
									
								} else if (JSONData.result == "ok") {
									console.log("��� OK");
									$(".password_check").text("��й�ȣ�� �½��ϴ�");
									$(".password_check").css("color", "blue");
								}
								
							}
				});
				
			});
		}
		
		//============= "Ż���ϱ�"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				//console.log("�߳�����");
				fncOutUser();
			});
		});	
		
		
		 function fncOutUser() {
					
				$("form").attr("method" , "POST").attr("action" , "/user/outUser").submit();
		}
		
		
	</script>	
	
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
   	<!-- ToolBar End /////////////////////////////////////-->
   	
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
						 	<a href="#">�����ٴϴ��п�</a>
						 </li>
						  <li class="list-group-item">
						 	<a href="#">Ż���ϱ�</a>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> ȸ������
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">��üȸ������</a>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">Ż��ȸ������</a>
						 </li>
					</ul>
		        </div>

				
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1>ȸ��Ż��ȭ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		
		<form class="form-horizontal">
		  
		  <div class="form-group">
		    <label for="password0">��й�ȣ Ȯ��</label>
		   	  <input type="hidden" id="email" name="email" value="${user.email}">
		      <input type="password" id="password0" name="password0" placeholder="�����й�ȣ">
		      <strong class="password_check"></strong>
		    </br></br></br></br>
		    <label>Ż���û</label></br>
		      ���� Ż���Ͻðڽ��ϱ�? </br>
			  ���������� ��û�� ��¥�κ��� 30�� �̳��� �����մϴ�. 
			 
		  <button type="button" class="btn btn-primary" id="out" name="out">Ż���ϱ�</button>
		  	
		  </div>
		 
		</form>
		 
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>