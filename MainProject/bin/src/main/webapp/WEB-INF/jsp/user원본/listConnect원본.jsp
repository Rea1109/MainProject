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
				self.location = "/user/loginView"
			});
		});
		
		
		//�����ϱ� ��ư event
		 $(function() {
			 $(".addConnect").on("click" , function() {
				
				alert("������?");
				var userNo = ${user.userNo};
				var academyCode = $("#academyCode").val();
				
				console.log("userNo=> "+userNo);
				console.log("academyCode=> "+academyCode);
					
					$.ajax( 
							{
								url : "/user/json/addConnect/${user.userNo}/"+academyCode,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status) {
									
									console.log(JSONData)
									//alert(JSONData);

									if (JSONData.message == "no") {
										$("#academyCode").val("");
										$(".connect_text").text("�ִ� ���� ����(3��)�� �ʰ��߽��ϴ�.");
										$(".connect_text").css("color", "red");
										
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
			  		<p>�����ٴϴ��п� ���� ȭ��</p>
			  	</div>
		<!-- form Start /////////////////////////////////////-->	  	
		<form class="form-horizontal">
		  
		  <div class="form-group">
		    <h4><span class="label label-primary">�츮�п� �����ϱ�</span></h4>
		    <div class="col-sm-4">
		      <input type="hidden" value="${user.userNo}">
		      <input type="text" class="form-control" id="academyCode" name="academyCode" placeholder="*�п��ڵ� �Է�(���� �ִ� 3��)">
		    </div>
		    <input type="button" class="addConnect" value="�����ϱ�">
		    <span id="helpBlock" class="help-block">
		      	<strong class="connect_text"></strong>
		     </span>
		  </div>
		  
		  <div class="form-group">
		    <h4><span class="label label-primary">���� ��û</span></h4>
		      <input type="text" id="acaName1" name="acaName1" placeholder="�п���1">
		      <input type="text" id="state1" name="state1" placeholder="��������1">
		      <input type="button" id="cancel1" name="cancel1" value="����ϱ�"></br>
		      
		      <input type="text" id="acaName2" name="acaName2" placeholder="�п���2">
		      <input type="text" id="state2" name="state2" placeholder="��������2">
		      <input type="button" id="cancel2" name="cancel2" value="����ϱ�"></br>
		      
		      <input type="text" id="acaName3" name="acaName3" placeholder="�п���3">
		      <input type="text" id="state3" name="state3" placeholder="��������3">
		      <input type="button" id="cancel3" name="cancel3" value="����ϱ�">
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
			  	
			  	
	      
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>