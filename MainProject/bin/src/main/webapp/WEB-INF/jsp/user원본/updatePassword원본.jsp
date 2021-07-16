<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">
	
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
		
		
		
		
		 //��й�ȣ Ȯ��
		 $(function(){

				 $('#password2').blur(function(){
						
					   if($('#password').val() != $('#password2').val()){
						   
					    		if ( $('#password2').val() != '' ) {
					    			
					    			$('.text_password').text("");
					    			
					    			var str = '��й�ȣ�� ���� �ʽ��ϴ�.';
					    			
					    			$('.text_password').append(str).css("color", "red");
						    	    $('#password2').val('');
						         	$('#password2').focus();	
								};
					    }else{
			    			$('.text_password').text("��й�ȣ�� �½��ϴ�.").css("color", "blue");
					    }
					   
					})   
					
				});
		 
		 
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button" ).on("click" , function() {
				fncUpdatePassword();
			});
		});	
		
		
		function fncUpdatePassword() {
					
				$("form").attr("method" , "POST").attr("action" , "/user/updatePassword").submit();
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

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
			  		<p>��й�ȣ���� ȭ��</p>
			  	</div>
		<!-- form Start /////////////////////////////////////-->	  	
		<form class="form-horizontal">
		  <div class="form-group">
		  <input type="hidden" id="email" name="email" value="${user.email}">
		    <label for="current" class="col-sm-offset-1 col-sm-3 control-label">���� ��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password0" name="password0" placeholder="���� ��й�ȣ">
		       <span id="helpBlock" class="help-block">
		      	<strong class="password_check"></strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">�� ��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�� ��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		     	<span id="helpBlock" class="help-block">
		      	  <strong class="text_password"></strong>
		      	</span>
		  	</div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">�����ϱ�</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
			  	
			  	
	      
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>