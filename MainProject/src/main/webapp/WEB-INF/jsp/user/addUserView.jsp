<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    
    <title> Sign Up </title>

    <!-- Custom fonts for this template-->
    <link href="/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
	
</head>

<style>

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
    
   .email_check, .text_name, .text_password, .text_sms {
    font-size:12px; font-family:'돋움';
    }
    
    

</style>

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
                                        <h1 class="h4 text-gray-900 mb-2">Sign Up!</h1>
                                        <br>
                                    </div>
                                    <form class="user">
                                         <div class="form-group" align="center">
                                            <div class="custom-control custom-checkbox small">
                                               <span class="radio">
							                        <label><input name="role" id="student" name="student" type="radio" class="radio-label" checked value="student">학생 </label>
										            <label><input name="role" id="parents" name="parents" type="radio" class="radio-label" value="parents"> 학부모 </label>
										            <label><input name="role" id="academy" name="academy" type="radio" class="radio-label" value="academy"> 학원</label>
							                    </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="email" name="email" class="form-control form-control-user"
                                                id="aaa" aria-describedby="emailHelp"
                                                placeholder="ex)buyedu@co.kr">
                                        </div>
                                        <div class="form-group" align="center">
										     <span class="email_check"></span>
										</div>
                                        <div class="row"><!-- 비밀번호 입력 -->
												<div class="col-6">
													<div class="form-group">		
														<input type="password" id="password" name="password" class="form-control form-control-user"
			                                                placeholder="새비밀번호" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-6"><!-- 새비밀번호 -->
													<div class="form-group">		
														<input type="password" class="form-control form-control-user"
			                                                placeholder="비밀번호확인" id="password2" name="password2" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                            </div>
			                            <div class="form-group" align="center">
										     <span class="text_password"></span>
										</div>
                                        <div class="form-group">
                                            <input type="text" id="name" name="name" class="form-control form-control-user"
                                               aria-describedby="emailHelp"
                                                placeholder="이름">
                                        </div>
                                        <div class="form-group" align="center">
										     <span class="text_name"></span>
										</div>
                                        <div class="row"><!-- 휴대전화번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" id="phone" name="phone" class="form-control form-control-user"
			                                                placeholder="휴대전화번호"  aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 발송버튼 -->
													<div class="form-group">
														<div class="text-center">
					                                       <a href="#" name="send_sms" class="btn btn-primary btn-user btn-block">
					                                            인증요청
					                                        </a>
					                                    </div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="row"><!-- 인증번호 입력 -->
												<div class="col-8">
													<div class="form-group">		
														<input type="text" class="form-control form-control-user"
			                                                placeholder="인증번호입력" id="vaildNum" name="vaildNum" aria-describedby="emailHelp">
			                                        </div>
			                                    </div>
			                                    <div class="col-4"><!-- 인증번호 확인버튼 -->
													<div class="form-group">		
														<div class="text-center">
					                                        <a href="#" name="check_sms" class="btn btn-primary btn-user btn-block">
					                                            확인
					                                        </a>
					                                    </div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="form-group" align="center">
												<span class="text_sms"></span>
											</div>
                                        <a href="#" name="btnJoin" id="btnJoin" class="btn btn-primary btn-user btn-block">
                                            가입하기
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" name="login" href="/user/login">Login</a>
                                    </div>
                                    
                               
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/sbadmin/js/sb-admin-2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>



	<script type="text/javascript">
	

	var emailDuplicationCheck = false;
	
	var checkVaild = false;
	
	//가입버튼 눌렀을때 모든 true 값 체크 메서드
	function fncCheckAll() {
		
		var valid = false;
		
		if( checkEmail() && fncCheckPw() && fncCheckName() && fncCheckPhone() && checkVaild ){
			valid = true;
		}
		
		return valid;
	}
	

	
	$(function() {
		
		//가입 event 연결
		$( "#btnJoin" ).on("click" , events.click.signup);
		
		//이메일칸 변화 event
		$("input[name='email']").on("change" , events.change.email);
		
		//비밀번호1 변화 event
		$('#password').on("change", events.change.password);
		
		//비밀번호2 변화 event
		$('#password2').on("change", events.change.password2);
		
		//이름 변화 event
		$("#name").on("change", events.change.name);
		
		//이름 변화 event
		$("#phone").on("change", events.change.phone);
		
		//인증번호 발송 event
		$( "a[name='send_sms']" ).on("click" , events.click.phoneBtn);
		
		//인증번호 확인 event
		$( "a[name='check_sms']" ).on("click" , events.click.vaildBtn);
		
		
	});	
	
	
	
	
	var events = {
			
		click : {
			
			signup : function() {
				//alert("11111")
				if(fncCheckAll()){
					
					swal("Buy!edu 회원가입을 환영합니다^ㅇ^")
					
					fncAddUser();
					
				}
				
			},
			
			phoneBtn : function() {
				//alert("인증번호발송 클릭")
				fncAuth();
				
			},
			
			vaildBtn : function() {
				//alert("인증확인 클릭")
				fncKey();
				
			}
			
			
		},
	
		change : {
			
			email : function() {
				emailChange();
			},
			
			password : function(){
				fncCheckPw("first");
			},
			
			password2 : function(){
				fncCheckPw("second");
			},
			
			name : function(){
				fncCheckName();
			},
			
			phone : function(){
				fncCheckPhone();
			}
		}
	}
	
	
	
	
	
	
	function emailChange(){
		
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var email=$("input[name='email']").val();
		
		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (email) {
			
			if(emailRegExp.test(email)){
				fncCheckEmailDuplication();
			}else{
				$(".email_check").text("올바른 이메일 형식이 아닙니다.");
				$(".email_check").css("color", "red");
			}
		
		}else{
			$(".email_check").text("이메일을 입력하세요.");
			$(".email_check").css("color", "red");
		}
		
	}
	
	

	//이메일유효성 함수
    function checkEmail() {
		
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var email=$("input[name='email']").val();
		
		// null , undefined, "" 빈값을 false 로 인식, 만약 값이 있으면 true 
		if (email) {
			
			if(emailRegExp.test(email)){
				
				if(emailDuplicationCheck){
					return true;
				} else {
					$(".email_check").text("중복된 이메일입니다.");
					$(".email_check").css("color", "red");
				}
			} else {
				$(".email_check").text("올바른 이메일 형식이 아닙니다.");
				$(".email_check").css("color", "red");
			}
		} else {
			$(".email_check").text("이메일을 입력하세요.");
			$(".email_check").css("color", "red");
		}
		return false;
    }
	
	
	
	
	
	//이름 체크 함수
    function fncCheckName() {
		
		var name = $("#name").val();
		
        if(name){
        	var nameRegExp = /^[가-힣]{2,20}$/;
        	
        	if(nameRegExp.test(name)){
        		$(".text_name").text("올바른 이름 형식입니다.");
				$(".text_name").css("color", "blue");
        		return true;
        	}else{
        		$(".text_name").text("올바른 이름 형식이 아닙니다.");
				$(".text_name").css("color", "red");
        	}
        } else{
        	$(".text_name").text("이름을 필수로 입력하세요!");
			$(".text_name").css("color", "red");
        }
        return false; //확인이 완료되었을 때
    }
	
	
	
    

	//핸드폰 체크 함수 
    function fncCheckPhone(){
    	
    	var phone = $("#phone").val();
    	
    	if(phone){
    		
    		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
    		
    		if(regExp.test(phone)){
				
				return true;
				
    		}else{
    			
    			$(".text_phone").text("올바르지 않은 휴대폰 형식입니다.");
				$(".text_phone").css("color", "red");
    			
    		}
    	}else{
    		
    		$(".text_phone").text("휴대폰번호를 필수로 적어주세요!");
			$(".text_phone").css("color", "red");
    		
    	}
    	return false;
    }


	
	//회원가입 버튼 함수
	function fncAddUser() {
		$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
	}
	
	//휴대전화번호 자동 대시 입력
	$(document).on("keyup", "#phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });

	
	
	 
	//이메일 중복확인 함수 ajax
	function fncCheckEmailDuplication() {

		var email = $("#email").val();
		
		$.ajax({
			url : "/user/json/checkEmail/"+email,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				
				console.log(JSONData)
				//alert(JSONData);

				if (JSONData.result == 1) {
					
					emailDuplicationCheck = false;
					$(".email_check").text("사용중인 이메일입니다.");
					$(".email_check").css("color", "red");
					
				} else {
					
					emailDuplicationCheck = true;
					$(".email_check").text("사용가능한 이메일입니다.");
					$(".email_check").css("color", "blue");
					
				}
			}
		});
			
	}
	
	
	
	//첫번째,두번째 비밀번호 조건
	
	function fncCheckPw(passwordType){
		var passwordTarget = passwordType == "first" ? "password" : "password2";
		var passwordCompare = passwordType == "first" ? "password2" : "password";
		
		
		var pw = $("#" + passwordTarget).val();
		var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		
		console.log(pw);
		
		if(reg.test(pw)) {
			
			var pw2 = $("#" + passwordCompare).val();
			
			if( pw == pw2 ){
				
				$(".text_password").text("비밀번호가 일치합니다.");
				$(".text_password").css("color", "blue");
				
				return true;
				
			}else{
				
				$(".text_password").text("비밀번호가 일치하지 않습니다.");
				$(".text_password").css("color", "red");
			}
			
		}else {
			
			var str = '비밀번호는 8자 이상, 숫자/영문/특수문자를 모두 포함해야 합니다.';
			$('.text_password').text(str).css("color", "red");
			$("#password").focus();
		}
		return false;
	}
	
	
	
	//인증번호 발송 함수
	function fncAuth(){					
		
		var phone = $("#phone").val()
		
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
	
	
	//인증확인 함수
	//test 용, 나중에 실제에서는 지우기
	
	//var key ="123456";
	var key = "";
	
	var vaildNum = $("#vaildNum").val();
	
	function fncKey() {	
		
		var vaildNum = $("#vaildNum").val();
		
		console.log("key : " +key)
		
		if( vaildNum == key ){
			
			$(".text_sms").text("인증번호가 맞습니다.");
			$(".text_sms").css("color", "blue");
			
			$("#vaildNum").attr('disabled', 'disabled')
			
			checkVaild = true;
			
		}else{
			
			$(".text_sms").text("인증번호가 맞지 않습니다.");
			$(".text_sms").css("color", "red");
		
		}		
	}		
	

	</script>





</html>