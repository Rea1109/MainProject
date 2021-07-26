<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>userMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		
		<script type="text/javascript">
			$( function() {
						
				fncCheckPassword();
				
			});
			
			//���� ��й�ȣ �´��� Ȯ��
			function fncCheckPassword() {
				 
				$('input[name="password0"]').blur(function(){
					
					var email = $("#email").val();
					var password = $('input[name="password0"]').val();
					
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
										
										$('button[name="out"]').prop('disabled', false);
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
				$( "button[name=out]" ).on("click" , function() {
					//swal("�ȳ��� ������. �������ɱⰣ�� 30�� �̳��Դϴ�!")
					//fncOutUser();
					
					swal({
						  title: "Ż�� �Ͻðڽ��ϱ�?",
						  text: "�������ɱⰣ�� 30�� �̳��Դϴ�!",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
							  fncOutUser();
						  }
						});
				});
			});	
			
			
			 function fncOutUser() {
						
				$('form[name="outForm"]').attr("method" , "POST").attr("action" , "/user/outUser").submit();
			}
			
			
		</script>	
		
		
		
	    
                    <div class="card-body p-0">
	
	                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Ż���û</h1>
                                        <p class="mb-4">���� ��й�ȣ �Է� ��, Ż�������� �������ּ���.</p>
                                    </div>
                                    <form class="user" name="outForm">
                                        <div class="form-group">
                                        	<input type="hidden" id="email" name="email" value="${user.email}">
                                            <input type="password" class="form-control form-control-user"
                                               name="password0" id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="�����й�ȣ">
                                            <span id="helpBlock" class="help-block">
										      	<strong class="password_check"></strong>
										     </span>
										     <br>
										     <div class="card mb-4 py-3 border-left-primary">
				                                <div class="card-body">
				                                    <p>���� Ż���Ͻðڽ��ϱ�? <br>
				                                       ���������� ��û�� ��¥�κ��� 30�� �̳��� �����մϴ�.
								 					</p>
				                                </div>
						                      </div>
                                        </div>
	                                        <button type="button" id="out" name="out" disabled="disabled" class="btn btn-primary btn-user btn-block">
	                                            Ż���ϱ�
	                                        </button>
	                                    </form>
	                                    
	                                </div>
	                        </div>
	                    </div>
	                </div>
		