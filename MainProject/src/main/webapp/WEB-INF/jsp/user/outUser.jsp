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
		
		<style type="text/css">
		
		#content {
			margin-left: 800px; 
		    transform: translate(-50%);
		    width: 460px;
		    
		}
		
		/* �Է��� */
		h3 {
		    margin: 19px 0 8px;
		    font-size: 14px;
		    font-weight: 700;
		}
		
		
		.box {
		    display: block;
		    width: 100%;
		    height: 51px;
		    border: solid 1px #dadada;
		    padding: 10px 14px 10px 14px;
		    box-sizing: border-box;
		    background: #fff;
		    position: relative;
		}
		
		.int {
		    display: block;
		    position: relative;
		    width: 100%;
		    height: 29px;
		    border: none;
		    background: #fff;
		    font-size: 15px;
		}
		
		input {
		    font-family: Dotum,'����',Helvetica,sans-serif;    
		}
		
		
		
		/* �����޼��� */
		
		.error_next_box {
		    margin-top: 9px;
		    font-size: 12px;
		    color: red;    
		    display: none;
		}
		
		#alertTxt {
		    position: absolute;
		    top: 19px;
		    right: 38px;
		    font-size: 12px;
		    color: red;
		    display: none;
		}
		
		/* ��ư */
		
		.btn_area {
		    margin: 30px 0 91px;
		}
		
		.signup, .cancel {
		    width: 100%;
		    padding: 10px 0 17px;
		    border: 0;
		    cursor: pointer;
		    color: #fff;
		    background-color: #0D85ED;
		    font-size: 20px;
		    font-weight: 400;
		    font-family: Dotum,'����',Helvetica,sans-serif;
		}
		
		.cancel {
			margin-top: 3px;
		}
		
		</style>
		
		
		
		<script type="text/javascript">
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
				$( "button.btn.btn-primary" ).on("click" , function() {
					alert("�ȳ��� ������. �������ɱⰣ�� 30�� �̳��Դϴ�!")
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
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/userMain">Buy! Edu</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/user/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">search</div>
                            <a class="nav-link" href="/academy/listSearch">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                �п��˻�
                            </a>
                            <div class="sb-sidenav-menu-heading">information</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                �� ���� ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/getUser?email=${user.email}">�� ���� ����</a>
                                    <a class="nav-link" href="/user/updatePassword?email=${user.email}">��й�ȣ ����</a>
                                    <a class="nav-link" href="/user/outUser?email=${user.email}">Ż�� �ϱ�</a>
                                    <a class="nav-link" href="#">���� �ۼ��� �ı�</a>
                                    <a class="nav-link" href="/user/listConnect">���� �ٴϴ� �п�</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                �� ���� ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">���� ����</a>
                                    <a class="nav-link" href="#">���� ���</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">board</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoard" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                �Խ���
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="#">��������</a>
                                	<a class="nav-link" href="#">QnA �Խ���</a>
                                    <a class="nav-link" href="/board/listBoard">�����Խ���</a>
                                    <a class="nav-link" href="#">�п� ��������</a>
                                    <a class="nav-link" href="#">���� �ۼ��� �Խñ�</a>
                                    <a class="nav-link" href="#">���� �ۼ��� ���</a>
                                </nav>
                            </div>
                        </div>
                    </div>

                </nav>
            </div>
            <!-- ���Ⱑ ��� �� ȭ�� (�ٲ�� ��) -->
          <div id="content">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
				      <h2>ȸ��Ż��</h2>
				      
						<form class="form-horizontal">
						
							<!-- ��й�ȣ -->
			                <div>
			                    <h3 class="join_title"><label for="password0">���� ��й�ȣ</label></h3>
			                    <span class="box int_email">
			                        <input type="hidden" id="email" name="email" value="${user.email}">
			                        <input type="password" id="password0" name="password0" placeholder="���� ��й�ȣ" class="int" >
			                    </span> 
			                    <span class="password_check"></span> 
			                </div>
			                
			                 <div>
			                    <span class="join_title"><label for="out">Ż�� ��û</label></h3>
			                        <span>
				                        ���� Ż���Ͻðڽ��ϱ�? <br>
								 		���������� ��û�� ��¥�κ��� 30�� �̳��� �����մϴ�.
			                        </span>
			                    </span> 
			                </div>
			                
			                <div>
			                	<button type="button" class="btn btn-primary" id="out" name="out" disabled="disabled">Ż���ϱ�</button>
			                </div>
						 
						</form>
                    </div>
                </main>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
</html>
    