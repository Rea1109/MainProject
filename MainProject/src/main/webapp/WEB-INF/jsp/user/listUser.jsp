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
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿� 
			
			function fncGetList(currentPage) {
				
				$("#currentPage").val(currentPage)
			   	$("form").attr("method", "POST").attr("action","/user/listUser").submit();	
			};
			
			
			$(function() {
				
				$( "button.btn.btn-default" ).on("click" , function() {
					fncGetList(1);
				});
				 
			});
			
		
			$(function() {
				
				$( "input:radio" ).on("click" , function() {
					//alert("������")
					fncGetList(1);
				});
				 
			});
		</script>
		

    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/adminMain">Buy! Edu</a>
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
                            <div class="sb-sidenav-menu-heading">search</div>
                            <a class="nav-link" href="/academy/listSearch">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                �п��˻�
                            </a>
                            <div class="sb-sidenav-menu-heading">information</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ����Ʈ ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/listUser">��ü ����� ����</a>
                                    <a class="nav-link" href="/chart/getChart">����Ʈ ��Ȳ ����</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEdu" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                �Ű� ����
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEdu" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">�Ű� �Խñ� ����</a>
                                    <a class="nav-link" href="#">�Ű� ��� ����</a>
                                    <a class="nav-link" href="#">�Ű� �ı� ����</a>
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
                        	
						<div class="page-header text-info">
					       <h3>ȸ�������ȸ</h3>
					    </div>
					    
					    <!-- table ���� �˻� Start /////////////////////////////////////-->
					    <div class="row">
					    
						    <div class="col-md-6 text-left">
						    	<p class="text-primary">
						    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
						    	</p>
						    </div>
						    
						   
						    
						    </br></br>
						    
						    <div class="col-md-6 text-right">
							    <form class="form-inline" name="detailForm">
							    
							     <div class="col-md-6 text-right">
							    	<p class="text-primary">
							    		<input type="radio" name="searchRole" value="student"> �л�
							    		<input type="radio" name="searchRole" value="parents"> �кθ�
							    		<input type="radio" name="searchRole" value="academy"> �п�
							    	</p>
						   		 </div>
							    
							    
								  <div class="form-group">
								    <select class="form-control" name="searchCondition" >
										<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>Email</option>
										<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
									</select>
								  </div>
								  
								  <div class="form-group">
								    <label class="sr-only" for="searchKeyword">�˻���</label>
								    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
								    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  </div>
								  
								  <button type="button" class="btn btn-default">�˻�</button>
								  
								  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
					    	</div>
					    	
						</div>
						<!-- table ���� �˻� Start /////////////////////////////////////-->
						
						
				      <!--  table Start /////////////////////////////////////-->
				      <table class="table table-hover table-striped" >
				      
				        <thead>
				          <tr>
				            <th align="center">No</th>
				            <th align="left" >ȸ�� Email</th>
				            <th align="left">ȸ����</th>
				            <th align="left">����</th>
				            <th align="left">������</th>
				            <th align="left">��������</th>
				          </tr>
				        </thead>
				       
						<tbody>
						
						  <c:set var="i" value="0" />
						  <c:forEach var="user" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr>
							  <td align="center">${ i }</td>
							  <td align="left"  title="Click : ȸ������ Ȯ��">${user.email}</td>
							  <td align="left">${user.name}</td>
							  <td align="left">${user.role}</td>
							  <td align="left">${user.inDate}</td>
							  <td align="left">
								  <c:choose>
									  <c:when test= "${user.accountState == '0' }">
										Ȱ����
									  </c:when>
									  <c:when test= "${user.accountState == '1' }">
										Ż��
									  </c:when>
								  </c:choose>
							  </td>
							</tr>
				          </c:forEach>
				        
				        </tbody>
				      
				      </table>
				      <jsp:include page="../common/pageNavigator_new.jsp"/>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
</html>
    