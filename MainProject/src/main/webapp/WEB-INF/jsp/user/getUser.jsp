<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>getUser</title>
        <link href="/css/styles.css" rel="stylesheet" />
       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		 <script src="../assets/demo/jquery.ajax-cross-origin.min.js"></script> 
		
		<script type="text/javascript">
			
			//============= 회원정보수정 Event  처리 =============	
			 $(function() {
				 
				 Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
				 
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( ".updateInfo" ).on("click" , function() {
						self.location = "/user/updateUser?email=${user.email}"
					});
			});
			
			
			//=========로그아웃 테스트 중 =============
				$(function() {	
					
					 $('button[name=allLogout]').on("click" , function() {
						 
						 let x = document.cookie;
						 
						 const words = x.split("; ");
						 
						 var loginType = "";
						 
						 for(var i=0; i < words.length; i++ ){
							 
							if( words[i].split("=")[0] === "loginType" ){
								 console.log( words[i].split("=")[1] )
								 loginType = words[i].split("=")[1];
							}
						 }
						 
						 if(loginType == "kakao"){
							 
							 alert("카카오 로그아웃!")
							 if (!Kakao.Auth.getAccessToken()) {
								  console.log('Not logged in.');
								  return;
								}
							 
								 Kakao.API.request({
								  url: '/v1/user/unlink',
								  success: function(response) {
								    console.log(response);
								    
								    self.location = "/"
								  },
								  fail: function(error) {
								    console.log(error);
								  },
								});
							 
							 
								Kakao.Auth.logout(function() {
								  console.log(Kakao.Auth.getAccessToken());
								  
								  if(Kakao.Auth.getAccessToken()){
									  alert('로그아웃실패');
								  }else{
									  
								  }
								 
								});
								
							 
							 
						 }else if(loginType == "naver"){
							 var accessToken = localStorage.getItem("com.naver.nid.access_token")
							 var tokenArray = accessToken.split(".");
							 var finalToken = tokenArray[1]
							 
							  $.ajax({
			                 		
								  crossOrigin : true,
								  contentType: "application/json",
								  dataType : "json",
								  
				            	  url : "/user/naver/" + finalToken,
				                  success : function(JSONData, status){
				                  	console.log("결과->" +JSONData);
				                        
				                  }, error  : function (a,b,c) {
				                  	console.log(a)
				                  	alert("로그아웃 실패");
				                  	
				                  }
				              })
								
						 }else{
							 alert("일반 로그아웃");
							 self.location = "logout"
						 }
						 
						 /*
						 
						 if (!Kakao.Auth.getAccessToken()) {
							  console.log('Not logged in.');
							  return;
							}
						 
							 Kakao.API.request({
							  url: '/v1/user/unlink',
							  success: function(response) {
							    console.log(response);
							    
							    self.location = "/"
							  },
							  fail: function(error) {
							    console.log(error);
							  },
							});
						 
						 
						 
							Kakao.Auth.logout(function() {
							  console.log(Kakao.Auth.getAccessToken());
							  
							  if(Kakao.Auth.getAccessToken()){
								  alert('로그아웃실패');
							  }else{
								  
							  }
							 
							});
							
							*/
					 });
				});
				 
			
				 
			
			
		
			
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
                                학원검색
                            </a>
                            <div class="sb-sidenav-menu-heading">information</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                내 정보 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/getUser?email=${user.email}">내 정보 보기</a>
                                    <a class="nav-link" href="/user/updatePassword?email=${user.email}">비밀번호 변경</a>
                                    <a class="nav-link" href="/user/outUser?email=${user.email}">탈퇴 하기</a>
                                    <a class="nav-link" href="#">내가 작성한 후기</a>
                                    <a class="nav-link" href="/user/listConnect">내가 다니는 학원</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                내 수업 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">관심 수업</a>
                                    <a class="nav-link" href="#">구매 목록</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">board</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoard" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="#">공지사항</a>
                                	<a class="nav-link" href="#">QnA 게시판</a>
                                    <a class="nav-link" href="/board/listBoard">자유게시판</a>
                                    <a class="nav-link" href="#">학원 공지사항</a>
                                    <a class="nav-link" href="#">내가 작성한 게시글</a>
                                    <a class="nav-link" href="#">내가 작성한 댓글</a>
                                </nav>
                            </div>
                        </div>
                    </div>

                </nav>
            </div>
            <!-- 여기가 가운데 들어갈 화면 (바뀌는 곳) -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
				       <form class="form-horizontal">

						<!-- 프로필 제목, 사진 -->				       
				        <div>
		                    <h3 class="profile">
		                        <label for="profile">${user.name}님의 Profile</label>
		                    </h3>
		                    <span class="image">
		                    	<input type="hidden" value="${user.userNo}">
		                    	<img src="/image/user.jpg" width="200px"/>
		                    	<div>${user.role}</div>
		                    </span>
		                </div>
		                
						<!-- 회원정보수정버튼 -->
		                <div>
		                    <span class="box int_email">
		                       <img src="/image/edit.png" width="40px" name="updateInfo" class="updateInfo"/>
		                    </span> 
		                </div> 
						
						<!-- EMAIL -->
		                <div>
		                    <h3 class="join_title"><label for="email">이 메 일</label></h3>
		                    <span class="box int_email">
		                        <span>${user.email}</span>
		                    </span> 
		                </div> 
							        
						<!-- 이름 -->
		                <div>
		                    <h3 class="join_title"><label for="email">이 름</label></h3>
		                    <span class="box int_email">
		                        <span>${user.name}</span>
		                    </span> 
		                </div> 
				
						<!-- 전화번호 -->
		                <div>
		                    <h3 class="join_title"><label for="email">휴대전화번호</label></h3>
		                    <span class="box int_email">
		                        <span>${user.phone}</span>
		                    </span> 
		                </div> 
				
						<!-- 가입일자 -->
		                <div>
		                    <h3 class="join_title"><label for="email">가입일자</label></h3>
		                    <span class="box int_email">
		                        <span>${user.inDate}</span>
		                    </span> 
		                </div> 
						
						<!-- 추후 삭제예정 -->
						<div class="row">
					  		<div class="col-md-12 text-center ">
					  			<button type="button" name="allLogout" class="allLogout">로그아웃</button>
					  		</div>
						</div>
						
                    </div>
                </main>
            </div>
            
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
</html>
    