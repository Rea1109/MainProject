<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 10px;
        }
        
        header{
                display:flex;
                justify-content: center;
            }
            form{
                padding:10px;
            }
            .input-box{
                position:relative;
                margin:10px 0;
            }
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:100%;
            }
            input::placeholder{
                color:transparent;
            }
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;

            }
            input:focus + label, label{
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            #a{
                background-color: #8aa1a1;
                border:none;
                color:white;
                border-radius: 5px;
                width:100%;
                height:35px;
                font-size: 14pt;
            }
            .login{
            margin-top:100px;
            }
            .signup{
            margin-top:5px;
            }
            #forgot{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            .loginMessage{
            	margin-left:140px;
            }
        
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	

	$( function() {
		login();
	});


	

	//�α��� �Լ�
	function login(){
		
		var message = '${message}';
		
		$('.loginMessage').text(message).css("color", "red");
		
		$("#email").focus();
		
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".login").on("click" , function() {
			var id=$("input[name='email']").val();
			var pw=$("input[name='password']").val();
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				$("input[name='email']").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				$("input[name='password']").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
		});
	}
	
	
	
	//ȸ������, �̸���ã��, ��й�ȣã��, ���������ϱ� event
	$( function() {

		$("input[name='signup']").on("click" , function() {
			self.location = "/user/addUser"
		});
		
		$(".findEmail").on("click" , function() {
			self.location = "/user/findEmail"
		});
		
		$(".findPassword").on("click" , function() {
			self.location = "/user/findPassword"
		});
		
		$(".returnUser").on("click" , function() {
			self.location = "/user/returnUser"
		});
		
	});
	
	
	
	/*
	
	//�α��� event
	$( function() {
		
		var message = '${message}';
		
		$('.loginMessage').append(message).css("color", "red");
		
		$("#email").focus();
		
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".login").on("click" , function() {
			var id=$("input[name='email']").val();
			var pw=$("input[name='password']").val();
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				$("input[name='email']").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				$("input[name='password']").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
		});
	});
	
	*/

	
	
	
	
	//īī�� �α���
	
	$( function() {
		
		Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
        
		$("#kakao-login-btn").on("click", function(){
		    //1. �α��� �õ�
		    Kakao.Auth.login({
		        success: function(authObj) {
		          //console.log(JSON.stringify(authObj));
		          //console.log(Kakao.Auth.getAccessToken());
		        
		          //2. �α��� ������, API�� ȣ���մϴ�.
		          Kakao.API.request({
		            url: '/v2/user/me',
		            success: function(res) {
		            	
		            	console.log("ī��������̵� : "+res.id);
		            	console.log("��ū�� : "+authObj.access_token);
		            	
		            	var id = res.id;
		            	var kakaoEmail = res.id+("@kakao.com")
		            	console.log("������� ī���̸��� : "+kakaoEmail);
		              
			              $.ajax({
			                 
			            	  url : "/user/json/checkEmail/"+kakaoEmail,
			                  headers : {
			                      "Accept" : "application/json",
			                      "Content-Type" : "application/json"
			                    },
			                    success : function(JSONData, status){
			                        
			                    	console.log("���->" +JSONData.result);
			                        if(JSONData.result == 0){ //DB�� ���̵� ���� ��� => ȸ������
			                        	console.log("ȸ������ȭ�� �̵�...");
			                        	self.location = "/user/snsAddUser?id="+id;
			                        }else{ //DB�� ���̵� ������ ��� => �α���
			                        	console.log("�α�����...");
			                        	self.location = "/user/snsLogin/"+kakaoEmail;
			                        }
			                    }
			              })
		            },
		            fail: function(error) {
		              alert(JSON.stringify(error));
		            }
		          });
		                  
		        },
		        fail: function(err) {
		          alert(JSON.stringify(err));
		        }
		      });
		        
		})
		
	})//e.o.kakao
	
	
	//���̹� �α���
	$( function() {
	    var naverLogin = new naver.LoginWithNaverId({
	        clientId: "vqx5V5ejE6mgkpcPu2vP",
	        callbackUrl: "http://localhost:8081/user/callback",
	        isPopup: false,
	        loginButton: {color: "green", type: 3, height: 45}
	    });
	    naverLogin.init();
	    
	})
	    

		
	</script>		
	
</head>

<body>

	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
			
	 	 	<div class="col-md-3">
			</div><!-- ù��° 4 -->
			
			<div class="col-md-6">
			
				<br/><br/>
					
					<div class="jumbotron">	 	 	
			 	 		<h3 class="text-center">Login</h3>
	
				        <form class="form-horizontal">
				        
				        	<div class="input-box">
				                <input type="text" id="email" name="email" placeholder="email">
				                <label for="username">���̵�(email)</label>
				            </div>
				            
				            <div class="input-box">
				                <input type="password" id="password" name="password" placeholder="��й�ȣ">
				            	<label for="password">��й�ȣ</label>
				            </div>
			  				
			  				<div>&nbsp;</div>
						  	<div><strong><span class="loginMessage"></span></strong></div>
						  	<div>&nbsp;</div>
						  	<div class="findEmail" id="forgot">Email ã��</div>
						  	<div class="findPassword" href="#" id="forgot">��й�ȣ ã��</div>
						  	<div class="returnUser" href="#" id="forgot">���� �����ϱ�</div>
	            			<input type="button" class="login" id="a" value="�α���">
	            			<input type="button" class="signup" name="signup" id="a" value="ȸ������">
						  	<!-- īī�� �α��� �߰� -->
							<div id="kakaoLogin" align="center">
							   <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="100%" id="kakao-login-btn"/>
							</div>
							<a href="http://developers.kakao.com/logout"></a>
							<!-- ���̹� �α��� �߰� -->
							<div id="naverIdLogin" align="center">
							   <img src="https://static.nid.naver.com/oauth/big_g.PNG" width="80%" height="45"/>
							</div>
						</form>
						
							
				   	 </div>
				
			</div>
			
			<div class="col-md-3">
			</div>
			
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>