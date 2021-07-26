<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>academyInfo</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<style>
		    .btn{  <!-- ��� ��ư������ css���� -->
		      text-decoration: none;
		      font-size:20px;
		      font-weight:bolder;
		      color:white;
		      padding:5px 10px 5px 10px;
		      margin:20px;
		      display:inline-block;
		      border-radius: 50px;
		      transition:all 0.1s;
		      font-family: 'Nanum Pen Script', cursive;
		    }
		    .btn:active{
		      transform: translateY(3px);
		    }
		    .btn.blue{
		      background-color: #1f75d9;
		      border-bottom:5px solid #165195;
		    }
		    .btn.blue:active{
		      border-bottom:2px solid #165195;
		    }
		    
		    #boardHeader{
				vertical-align : top;
				font-size : 0px;
				color : #1F4E79;
				font-family : TmonMonsori;
			}
			
			@font-face {
			    font-family: 'TmonMonsori';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}

 		</style>

	<title>Academy Info page</title>	
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/user/loginacademy?email=${user.email}">Buy! Edu</a>
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
                        <li><a class="dropdown-item" href="/">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                           <div class="sb-sidenav-menu-heading">update</div>
                            <a class="nav-link" href="/academy/addAcademyView">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                �п� ��� �ϱ�
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
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">academy</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAcademy" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                �п� ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseAcademy" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="/user/loginacademy?email=${user.email}">������ ����</a>
                                    <a class="nav-link" href="/academy/academyInfo?academyCode=${academy.academyCode}">�⺻ ����</a>
                                    <a class="nav-link" href="/academy/academySampleEdu?academyCode=${academy.academyCode}">��Ƽ�̵�� ����</a>
                                    <a class="nav-link" href="/review/listReview?academyCode=${academy.academyCode}">�п� �ı� ����</a>
                                    <a class="nav-link" href="/academy/academyConnects?academyCode=${academy.academyCode}">���� ����</a>
                                    <a class="nav-link" href="/user/deleteacademy?email=${user.email}">�п� ������ ����</a>
                                </nav>
                            </div>                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                ���� ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/edu/addEdu?academyCode=${academy.academyCode}">���� ���</a>
                                    <a class="nav-link" href="#">���� ���</a>
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
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">${academy.academyName}</h1>
                        <h5 class="mt-4">&nbsp;�п� ��ȭ ��ȣ : ${academy.academyPhone}</h5>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                        
                        <div id="academyInfo" class="card-body">
                        	
                        </div>
                            
                        
            
        
            <div class="row">

	    
		    <div class="col-md-6 text-left" id="boardHeader">
		    	<h3>�п� ��������</h3>
		    </div>
		    
		    <div class="col-md-6 text-right" id="searchPosition">
			    <form class="form-inline" >
			    <input type="hidden" name="cateCode" id="cateCode" value="${search.cateCode}" />
			    
			    <div class="form-group">
				    <select class="form-control" id="searchConditionb" name="searchConditionb" style="width:120px;">
						<option value="0"  ${ ! empty search.searchConditionb && search.searchConditionb==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchConditionb && search.searchConditionb==1 ? "selected" : "" }>����</option>
					</select>
				 </div>
				  
				 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
<br/><br/>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->

		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover" id="boardTable">
      
        <thead id="tableHead">
          <tr>
            <th width="100" align="center">No</th>
            <th width="400" align="center" >�Խñ�����</th>
            <th width="200" align="left">�ۼ�����</th>
            <th width="200" align="center">��ȸ��</th>
            
        </thead>
		
		<tbody>
		
		  <c:set var="i" value="${resultPage.totalCount }" />
		  <c:forEach var="board" items="${list}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td align="left">${i+1-(resultPage.currentPage-1)*10}</td>
		
	
		<td id="listtable" align="left"><a href="/board/getBoardAca?boardNo=${board.boardNo}&cateCode=3&academyCode=${academy.academyCode}">${board.boardTitle} (<span class="commentCount">${board.comment_cnt}</span>)</a></td>
					  
			  
			
			  <td id="listtable" align="left">
			  <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
			  <td id="listtable" align="left">${board.viewCnt}</td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
	  
	  userNo : ${user.userNo}    
	  ��ī���� �ڵ� : ${academy.academyCode}
		<input type="hidden" name="isMine" value="${search.isMine}" />		
		<input type="hidden" name="acaWriter" value="${academy.academyCode}" />	  
		  
			<c:if test="${user.role eq 'academy'}">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 
		     	 <a href="/board/addBoard?cateCode=3&academyCode=${academy.academyCode}">�۾���</a></button>
		    	</div> 
			</c:if>
		</div>
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
	<div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div>
                </main>
                </div>
	</div>
        </div>
	
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script>
		var academyCode = '${academy.academyCode}';
		var role = '${user.role}';
		
		 alert("�п� �ڵ� = "+academyCode);
			
		
		function getAcademyInfo(){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 
					 var a = ''
					 	 a += '�п� ��ȣ : ' + data.academyPhone
				 		 a += '<br/>�п� �ּ� : ' + data.academyAddr
				 		 a += '<br/>������ : ' + data.academyArea
				 	 	 a += '<div id="AcademyIntro">'
				 	 	 a += '�п� �Ұ� : ' + data.academyIntro
				 	 	 
				 	 if(role == 'academy'){
				 	 	 a += '<a class="btn blue" onclick="updateIntro(\''+data.academyCode+'\',\''+data.academyIntro+'\')"> �� �� </a>'
				 	 }
				 		 a += '</div>'
				 		 a += '<div id="AcademyHistory">'
				 		 a += '�п� ���� : ' + data.academyHistory
				 		 
				 	if(role == 'academy'){
						 a += '<a class="btn blue" onclick="updateHistory(\''+data.academyCode+'\',\''+data.academyHistory+'\')"> �� �� </a>'
				 	}
						 a += '</div>'
				 					
					$("#academyInfo").html(a);
				 }							
			});		
		}
		
		// �Ұ��� �ؽ�Ʈ �ڽ� ����
		function updateIntro(academyCode, academyIntro){
		    var intro ='';
		    
		    alert("�ڵ� = " + academyCode + "�Ұ��� = "+academyIntro);
		    
		    	intro += '<div id="AcademyIntro">';
		   	 	intro += '<input type="text" class="form-control" name="academy_'+academyCode+'" value="'+academyIntro+'"/>';
		   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveIntro(\''+academyCode+'\');">����</button> </span>';
		   	 	intro += '</div>';
		    
		    $('#AcademyIntro').html(intro);
		    
		}
		 
		// �Ұ��� ����
		function saveIntro(academyCode){
		    var updateIntro = $('[name=academy_'+academyCode+']').val();
		    
		    $.ajax({
		        url : '/academy/json/updateIntro/'+academyCode,
		        type : 'POST',
		        data : {'academyCode' : academyCode, 'updateIntro' : updateIntro},
		        success : function(data){
		        	alert("���� �Ϸ�!");
		        	getAcademyInfo();
		        }
		    });
		}
		
		// ������ �ؽ�Ʈ �ڽ� ����
		function updateHistory(academyCode, academyHistory){
		    var intro ='';
		    
		    alert("�ڵ� = " + academyCode + "������ = "+academyHistory);
		    
		    	intro += '<div id="AcademyHistory">';
		   	 	intro += '<input type="text" class="form-control" name="academy_'+academyCode+'" value="'+academyHistory+'"/>';
		   	 	intro += '<span class="input-group-btn"><button class="btn blue" id="saveIntro" type="button" onclick="saveHistory(\''+academyCode+'\');">����</button> </span>';
		   	 	intro += '</div>';
		    
		    $('#AcademyHistory').html(intro);
		    
		}
		 
		// ������ ����
		function saveHistory(academyCode){
		    var updateHistory = $('[name=academy_'+academyCode+']').val();
		    
		    $.ajax({
		        url : '/academy/json/updateHistory/'+academyCode,
		        type : 'POST',
		        data : {'academyCode' : academyCode, 'updateHistory' : updateHistory},
		        success : function(data){
		        	alert("���� �Ϸ�!");
		        	getAcademyInfo();
		        }
		    });
		}

		$(document).ready(function(){
			getAcademyInfo(); 
		});
		
		// �п� ��������
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			var acaWriter=$('input[name="acaWriter"]').val();
				$("form").attr("method" , "POST").attr("action" , "/academy/academyInfo?academyCode="+acaWriter).submit();
		}
		
		function enterEvent(){
			if(window.event.keyCode == 13){
				fncGetList(1);
			}
		}
		
		$(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		</script>
        
    </body>
</html>
    