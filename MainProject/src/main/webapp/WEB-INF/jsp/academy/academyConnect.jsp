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
        <title>academyInfo</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
	<title>Academy - Student Connect page</title>	
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
                                    <a class="nav-link" href="#">�п� �ı� ����</a>
                                    <a class="nav-link" href="/academy/academyConnect?academyCode=${academy.academyCode}">���� ����</a>
                                </nav>
                            </div>                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                ���� ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/edu/addEdu">���� ���</a>
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
                    
				       <form class="form-horizontal">
				       
				       <br></br>
						
						<table id="table" name="table" class="table table-hover table-striped" >
						<h4>���� ��û�� �л� ����</h4>
				    	</table>
				    	
						</form>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script>
       		
        function connectList(){
        	$.ajax({
        		url : '/academy/json/academyConnect/${academy.academyCode}',
        		type : 'post',
        		success : function(data){
        			console.log(data);
        			$.each(data, function(key,value){
        						
        				var a = ''
        				
        				if(value.length == 0){
    						a += '<span><h5>'
    						a += '<img src="/image/crying.png">'
    						a += '���� ��û�� �л��� �����ϴ�.!</h5></span>'
    					}else{
        					a += '<thead><tr>'
        					a += '<th align="center">No</th>'
        					a += '<th align="center">�л��̸�</th>'	
        					a += '<th align="center">��������</th>'		
        					a += '<th align="center">�������</th>'
        					a += '</tr></thead>'
        					
        					
        					a += '<tbody>'
        					
        					for(var i=0; i<value.length;i++){
                				
                				a += '<tr><td align="left">'+(i+1)+'</td>'
                				a += '<td align="left"><span class="cntStudentName" name="cntStudentName">'+(value[i].user.name)+'</span>'
                				a += '<input type="hidden" name="cntUserNo" value="'+(value[i].user.userNo)+'"></td>'
                				a += '<td align="left">'
                				
                					if(value[i].connectState == 0){
                						a += '<a onclick="updateConnect('+value[i].connectNo+')">���� ����� �Դϴ�.</a>'	
                					} else {
                						a += '���л� �Դϴ�.'	
                					}
                				
                				a += '</td>'	
                				a += '<td align="left">'	
                				
                					if(value[i].connectState == 0){
                						a += '<a onclick="deleteConnect('+value[i].connectNo+')">���� �ź�</a>'	
                					} else {
                						a += '<a onclick="deleteConnect('+value[i].connectNo+')">���� ����</a>'	
                					}
                				a += '</td></tr>'	
                									
                			}
        					a += '</tbody>'	
    					}	        				
        					
            			$("#table").html(a);
        			});
        		}
        	});
        }
        
    //  ���� ��û ����
		function updateConnect(connectNo){
			if(confirm('���� �Ͻðڽ��ϱ�?')){
				
			    $.ajax({
			    	
			        url : '/academy/json/updateConnect/'+connectNo,
			        type : 'post',
			        success : function(data){
			        	alert("���� �Ǿ����ϴ�!")
			        }
			    });
			}
			
			location.reload();
		}
		
		//  ���� ��û ���� -> ������ ����?
		function deleteConnect(connectNo){
			if(confirm('��û �л��� ���� �Ͻðڽ��ϱ�?')){
				
			    $.ajax({
			    	
			        url : '/academy/json/deleteConnect/'+connectNo,
			        type : 'post',
			        success : function(data){
			        	alert("���� �Ǿ����ϴ�!")
			        }
			    });
			}
			
			location.reload();
		}
        
        
        
        $(document).ready(function(){
            connectList();
        });
        
        
        </script>
        
        
    </body>
</html>
    