<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->

<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body style="display: none;">

	callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		
	
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "vqx5V5ejE6mgkpcPu2vP",
				callbackUrl: "http://localhost:8081/user/callback",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					
					var accessToken = naverLogin.accessToken.accessToken;
					var email = naverLogin.user.getEmail();

					console.log(accessToken);
					console.log(email);
					
					debugger;
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					
					
					$.ajax({
		                 
		            	  url : "/user/json/checkEmail/"+email,
		                  headers : {
		                      "Accept" : "application/json",
		                      "Content-Type" : "application/json"
		                    },
		                    success : function(JSONData, status){
		                        
		                    	console.log("결과->" +JSONData.result);
		                        if(JSONData.result == 0){ //DB에 아이디가 없을 경우 => 회원가입
		                        	console.log("회원가입화면 이동...");
		                        	//self.location = "/user/snsAddUser?id="+id;
		                        }else{ //DB에 아이디가 존재할 경우 => 로그인
		                        	console.log("로그인중...");
		                        	//self.location = "/user/snsLogin/"+id;
		                        }
		                    }
		              })
					
					
					window.location.replace("http://" + window.location.hostname + 
                            ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/user/naverLogin?email="+email);
				                                                    /* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
                 } else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		
		
		
		
		
	</script>
</body>

</html>