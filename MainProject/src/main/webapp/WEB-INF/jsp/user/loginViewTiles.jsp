<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="UTF-8">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BuyEdu - Login</title>

    <!-- Custom fonts for this template-->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
	<!-- Bootstrap core JavaScript-->
    <script src="/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/sbadmin/js/sb-admin-2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    
    <style>
    
    .btn-google {
    
    color: #fff;
    background-color: #FFEE50;
    border-color: #fff;
	}
	
	.btn-google:hover {
    color: #fff;
    background-color: #FAE200;
    border-color: #e6e6e6;
	}
	
	
	.btn-facebook {
    
    color: #fff;
    background-color: #FFFFFF;
    border-color: #fff;
	}
	
	.btn-facebook:hover {
    color: #fff;
    background-color: #FFFFFF;
    border-color: #FFFFFF;
	}
	
	.bg-gradient-primary {
    /* background-color: #F6EAC7; */
    background-image: linear-gradient(
	180deg
	,#D8D8D8 10%,#F6EAC7 100%);
	    background-size: cover;
	}
	
	.btn-primary {
    color: #fff;
     background-color: #636363; 
     border-color: #636363; 
	}
	
	.btn-primary:hover {
    color: #fff;
    background-color: #323232;
    border-color: #323232;
	}
	
	a {
    color: #323232;
    text-decoration: none;
    background-color: transparent;
	}
	
	a:hover {
    color: #000000;
    text-decoration: underline;
    }
    
   
   .loginMessage {
   color: red; font-size:12px; color:red; font-family:'??????';
   } 
   
}
	
	
	
    
    </style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		$(function() {
			login();
		});
	
		//????????? ??????
		function login() {
	
			var message = '${message}';
	
			$('.loginMessage').text(message).css("color", "red");
	
			$('input[name="email"]').focus();
	
			//==> DOM Object GET 3?????? ?????? ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$('a[name="loginBtn"]').on("click", function() {
				//alert("?????????????????????")
						var id = $("input[name='email']").val();
						var pw = $("input[name='password']").val();
	
						if (id == null || id.length < 1) {
							swal('Email??? ??????????????????!');
							$("input[name='email']").focus();
							return;
						}
	
						if (pw == null || pw.length < 1) {
							swal('??????????????? ??????????????????!');
							$("input[name='password']").focus();
							return;
						}
	
						$('form[name="loginForm"]').attr("method", "POST").attr("action",
								"/user/login").attr("target", "_parent").submit();
					});
		}
	
		//????????????, ???????????????, ??????????????????, ?????????????????? event
		$(function() {
	
			$('div[name="signup"]').on("click", function() {
				self.location = "/user/addUser"
			});
	
			$('div[name="findEmail"]').on("click", function() {
				self.location = "/user/findEmail"
			});
	
			$('div[name="findPassword"]').on("click", function() {
				self.location = "/user/findPassword"
			});
	
			$('div[name="returnUser"]').on("click", function() {
				self.location = "/user/returnUser"
			});
	
		});
	
		
		
	
		//????????? ?????????
		$(function() {
	
			Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
	
			$('span[name="kakaoLogin"]').on("click", function() {
				//1. ????????? ??????
				Kakao.Auth.login({
					success : function(authObj) {
						//console.log(JSON.stringify(authObj));
						//console.log(Kakao.Auth.getAccessToken());
	
						//2. ????????? ?????????, API??? ???????????????.
						Kakao.API.request({
							url : '/v2/user/me',
							data : {
								property_keys : [ "kakao_account.email" ]
							},
							success : function(res) {
	
								console.log("res : ", res);
								console.log(authObj)
	
								console.log("????????????????????? : " + res.id);
								console.log("????????? : " + authObj.access_token);
	
								var id = res.id;
								var email = res.kakao_account.email
	
								console.log(id);
								console.log(email);
	
								if ("email" != null) {
									email = res.kakao_account.email;
								}
	
								if (typeof email === 'undefined') {
									email = id + "@kakao.com";
									console.log("???????????????->" + email)
								}
	
								$.ajax({
	
									url : "/user/json/checkEmail/" + email,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData, status) {
	
										console.log("??????????????? ???????????? ??????");
										self.location = "/user/snsLogin/" + email;
	
									}
								})
							},
							fail : function(error) {
								alert(JSON.stringify(error));
							}
						});
	
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
	
			})
	
		})//e.o.kakao
	
		//????????? ?????????
		
		
		
		
		//???????????????
		$(function() {
				
				var naverLogin = new naver.LoginWithNaverId({
					clientId : "vqx5V5ejE6mgkpcPu2vP",
					callbackUrl : "http://192.168.0.47:8081/user/callback", 
					isPopup : false,
					
					loginButton : {
						color : "green",
						height : 37,
						width: '100%'
					}
					
				});
				naverLogin.init();
		
			})
		
		
	</script>







</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-5 col-lg-9 col-md-6">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Login</h1>
                                    </div>
                                    <form class="user" name="loginForm">
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Email Address">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        
                                        <div align="center"><!-- ???????????? ?????? ????????? ???????????? -->
											<span class="loginMessage"></span>
										</div>
                                        <br>
                                        <a href="#" name="loginBtn" class="btn btn-primary btn-user btn-block">
                                            ?????????
                                        </a><hr>
                                        <span name="kakaoLogin"><a href="#"><img src="/image/kakao.png"></a></span><span id="naverIdLogin"></span>
                                        
										
                                    </form>
                                    <hr>
                                    <div class="text-center" name="findEmail">
                                        <a class="small" href="#">????????? ??????</a>
                                    </div>
                                    <div class="text-center" name="findPassword">
                                        <a class="small" href="#">???????????? ??????</a>
                                    </div>
                                    <div class="text-center" name="returnUser">
                                        <a class="small" href="#">?????? ????????????</a>
                                    </div>
                                    <hr>
                                    <div class="text-center" name="signup">
                                        <a class="small" href="#">Buy!edu ????????????</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>


    

</body>

</html>