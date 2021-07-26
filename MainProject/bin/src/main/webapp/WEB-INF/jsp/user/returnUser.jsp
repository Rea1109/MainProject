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
			$("a[href='#']").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		
		$( function() {
			 
			$("button[name='returnUser']").on("click" , function() {
				
				var name = $("#name").val();
				var password = $("#password").val();
				var email = $("#email").val();
				
				console.log(name);
				console.log(password);
				console.log(email);
			
				$.ajax( 
						{
							url : "/user/json/returnUser",
							method : "POST" ,
							data : JSON.stringify({
								name : name,
								password: password,
								email: email,
							}),
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {
								
								//alert("����!");

								if (JSONData.message == "no") {
									console.log("���� ȸ�� ����");
									$(".explain").val("");
									$(".explain").text("���� ȸ�� �����Դϴ�.");
									$(".explain").css("color", "red");
									
									$('form').each(function() {
						                this.reset();
						            });
									
								} else if (JSONData.message == "ok") {
									console.log("���� ����");
									$(".explain").val("");
									$(".explain").text("������ �����Ͽ����ϴ�.");
									$(".explain").css("color", "blue");
									
									$('form').each(function() {
						                this.reset();
						            });
									
								}else if (JSONData.message == "disable") {
									console.log("�������ɱⰣ �ʰ�");
									$(".explain").val("");
									$(".explain").text("�������� �Ⱓ�� �ʰ��Ͽ����ϴ�.");
									$(".explain").css("color", "red");
									
									$('form').each(function() {
						                this.reset();
						            });
								}
								
							}
				});
				
			});
		});
		
		
		
	
		
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
			  		<p>���� ���� ȭ��</p>
			  	</div>
		<!-- form Start /////////////////////////////////////-->	  	
		<form class="form-horizontal" name="returnForm">
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="�̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		  	</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		  	  <span id="helpBlock" class="help-block">
		      	  <strong class="explain"></strong>
		      	</span>	
		  	</div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" name="returnUser" class="btn btn-primary">����������û</button>
		      <a class="btn btn-primary btn" href="#" role="button">�α����Ϸ�����</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
			  	
			  	
	      
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->


</body>

</html>