<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script>
	
	var checkVaild = false;
	
	$( function() {
		$("a[href='#' ]").on("click" , function() {
			self.location = "/user/login"
		});
	});
	
	
	//��й�ȣ ã�� �������� true �� üũ �޼���
	function fncCheckAll() {
		
		var valid = false;
		
		if( checkVaildNumber() ){
			valid = true;
		}
		
		return valid;
	}
	
	
	
	$(function() {
		
		//������ȣ �߼� event
		$( "button[name='send_sms']" ).on("click" , events.click.phonBtn);
		
		//������ȣ Ȯ�� event
		$( "button[name='check_sms']" ).on("click" , events.click.vaildBtn);
		
		//��й�ȣã�� event
		$( "button[name='findPassword']" ).on("click" , events.click.findBtn);
		
	});
	
	
	
	var events = {
			
			click : {
				
				phonBtn : function() {
					alert("������ȣ�߼� Ŭ��")
					fncAuth();
					
				},
				
				vaildBtn : function() {
					alert("����Ȯ�� Ŭ��")
					fncKey();
					
				},
				
				findBtn : function() {
					alert("��й�ȣã���ư Ŭ��")
					
					if( checkVaild ){
						alert("2222")
						findPassword();
					}
					
				}
			}
	}
	
	//�޴���ȭ��ȣ �ڵ� ��� �Է�
	$(document).on("keyup", "#phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

	
	
	//������ȣ �߼� �Լ�
	function fncAuth(){					
		
		var phone = $("#phone").val()
		alert("�Է��� ����ó : "+phone);
		
		$.ajax({
				url : "/user/json/sms/"+phone ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : 
						function(JSONData , status) {

						//alert("status : "+status);
						//alert("JSONData : \n"+JSONData);
						//alert("JSONData : \n"+JSONData.key);
						key = JSONData.key;
						
				}
					
		});	//End ajax
	};
	
	
	//����Ȯ�� �Լ�
	//test ��, ���߿� ���������� �����
	
	var key ="123456";
	//var key = "";
	
	var vaildNum = $("#vaildNum").val();
	
	function fncKey() {	
		
		var vaildNum = $("#vaildNum").val();
		
		console.log("key : " +key)
		
		if( vaildNum == key ){
			
			$(".text_sms").text("������ȣ�� �½��ϴ�.");
			$(".text_sms").css("color", "blue");
			
			checkVaild = true;
			
		}else{
			
			$(".text_sms").text("������ȣ�� ���� �ʽ��ϴ�.");
			$(".text_sms").css("color", "red");
		
		}		
	}		
	
	
	
	//�� �Է� �ϼ�-> ��й�ȣ ã�� ��������
	function findPassword() {
			
			console.log(checkVaild);
			console.log('������!');
			
			var name = $("#name").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			
			console.log(name);
			console.log(phone);
			console.log(email);
		
			$.ajax({
						url : "/user/json/findPassword",
						method : "POST" ,
						data : JSON.stringify({
							name : name,
							phone : phone,
							email : email,
						}),
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							
							alert("����!");
				    			
							if (JSONData.message == "no") {
								
								var str = '���� ȸ�������Դϴ�.';
								
								console.log("���� ����");
								$('.explain1').text("")
								$('.explain1').append(str).css("color", "red");
								
							} else if (JSONData.message == "ok") {
								
								$('button[name="changeButton"]').prop('disabled', false);
								$("input[type='password']").removeAttr('disabled');
								
								var displayText = '���ο� ��й�ȣ�� �������ּ���!';
								$('.explain1').text("")
								$('.explain1').append(displayText).css("color", "blue");
							}
						}
			});
	}
			
			
	
	
	// ��й�ȣ, �� ��й�ȣ Ȯ��
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
	
	
	//���ο� ������� ����
	 $( function() { 
			
			$("button[name='changeButton']").click(function(){
				
					console.log('������!');
					
					var name = $("#name").val();
					var phone = $("#phone").val();
					var email = $("#email").val();
					var password = $("#password").val();
					
					console.log(name);
					console.log(phone);
					console.log(email);
					console.log(password);
				
					$.ajax( 
							{
								url : "/user/json/changePassword",
								method : "POST" ,
								data : JSON.stringify({
									name : name,
									phone : phone,
									email : email,
									password : password,
								}),
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData, status) {
									
									alert("����!");
						    			
									if (JSONData.message == "ok") {
										
										var str = '��й�ȣ�� �� ���� �Ǿ����ϴ�!';
										$('.text_password').text("")
										$('.explain2').text("")
										$('.explain2').append(str).css("color", "blue");
										
									}
								}
					});
				});
			});


	
	//cool sms
	
	
	
	
	
	
	

	</script>
    
</head>

<body>

		<div class="col-md-9">
				<div class="jumbotron">
			  		<p>Password ã�� ȭ��</p>
			  	</div>

		<form class="form-horizontal" name="form1">
			  <div class="form-group">
			    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="name" name="name" placeholder="name">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="phone" name="phone" placeholder="phone">
			      <button name="send_sms" class="btn btn-primary" onclick="return false">������ȣ�߼�</button>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="vaild" class="col-sm-offset-1 col-sm-3 control-label"></label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="vaildNum" name="vaildNum" placeholder="������ȣ">
			      <button name="check_sms" class="btn btn-primary" onclick="return false">����Ȯ��</button>
			    </div>
				  <span id="helpBlock" class="help-block">
					 <strong class="text_sms"></strong>
				  </span>
			  </div>
			  
			  <div class="form-group">
			    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="email" name="email" placeholder="email">
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" name="findPassword" class="btn btn-primary">��й�ȣ ã��</button>
			    </div>
			  </div>
			  
			    <span id="helpBlock" class="help-block">
				   <strong class="explain1"></strong>
				 </span>
			  
		  </form> <!-- /////////////ù��° �� �� -->
		  
		 
		  <form class="form-horizontal" name="form2">
			  <div class="form-group">
			    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">�� ��й�ȣ</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password" name="password" placeholder="�� ��й�ȣ" disabled="disabled">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��" disabled="disabled">
			     	<span id="helpBlock" class="help-block">
			      	  <strong class="text_password"></strong>
			      	</span>
			  	</div>
			  </div>
		  </form>
		  
		  <span id="helpBlock" class="help-block">
		   <strong class="explain2"></strong>
		 </span>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" name="changeButton" class="btn btn-primary" disabled="disabled">�����ϱ�</button>
			  <a class="btn btn-primary btn" href="#" role="button">�α����Ϸ�����</a>
		    </div>
		  </div>
			
		
		  
		</form>
	
</body>

</html>