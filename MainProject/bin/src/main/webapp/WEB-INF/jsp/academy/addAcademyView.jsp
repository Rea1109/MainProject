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
        <title>addAcademyView</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<script type="text/javascript">
		
			$(function(){
				$("#ok").on('click',function(){
					
					alert("��Ϲ�ư Ŭ��")
					
					var acaname=$("input[name='academyName']").val();
					var acaadde=$("input[name='academyAddr']").val();
					var acaphone=$("input[name='academyPhone']").val();
					
					if(acaname == null || acaname.length <1){
						alert("�п� �̸��� �ݵ�� �Է��ϼž� �մϴ�.");
						return;
					}
					if(acaadde == null || acaadde.length <1){
						alert("�п� �ּҴ�  �ݵ�� �Է��ϼž� �մϴ�.");
						return;
					}
					
					$("form").attr("method" , "POST").attr("action" , "/academy/addAcademy?userNo=${user.userNo}").submit();

				});
			});
			
		</script>
		
	<title>Add Academy page</title>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main/academyMain">Buy! Edu</a>
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
                                    <a class="nav-link" href="#">�⺻ ����</a>
                                    <a class="nav-link" href="#">��Ƽ�̵�� ����</a>
                                    <a class="nav-link" href="#">�п� �ı� ����</a>
                                    <a class="nav-link" href="#">���� ����</a>
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
                        <h1 class="mt-4">�п� ��� �ϱ�</h1>
      
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    <form>
										<input type="text" name="academyName" placeholder="�п��� �Է�"> <br/><br/>
										<input type="text" name="academyPhone" placeholder="�п���ȭ��ȣ �Է�"> <br/><br/>
										<input type="text" onclick="sample5_execDaumPostcode()" id="sample5_address" name="academyAddr"  placeholder="�ּ�" readonly/> <br/><br/>								
										<input type="text" id="sample5_address_extra" name="academyArea" placeholder="���̸�" readonly/>
										<input type="text" id="lat" name="academyLat"  placeholder="����" readonly/>
										<input type="text" id="lng" name="academyLng"  placeholder="�浵" readonly/>
										
										<button type="button" id="ok" class="btn btn-primary"  >���</button>
										<button type="button" id="cancle" class="btn btn-primary"  >���</button>
										
										<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
									</form>	
                                </p>
                            </div>
                        </div>
                      </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
		            level: 5 // ������ Ȯ�� ����
		        };
		
		    //������ �̸� ����
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //�ּ�-��ǥ ��ȯ ��ü�� ����
		    var geocoder = new daum.maps.services.Geocoder();
		    //��Ŀ�� �̸� ����
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // ���� �ּ� ����
						var extra = data.sigungu; // ��, �� �̸�
		                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
		                document.getElementById("sample5_address").value = addr;
		                document.getElementById("sample5_address_extra").value = extra;
		                // �ּҷ� �� ������ �˻�
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // ���������� �˻��� �Ϸ������
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //ù��° ����� ���� Ȱ��
		
		                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // ������ �����ش�.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // ���� �߽��� �����Ѵ�.
		                        map.setCenter(coords);
		                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
		                        marker.setPosition(coords)
		                        document.getElementById("lat").value = result.y
		    	                document.getElementById("lng").value = result.x
		                    }
		                });
		            }
		        }).open();
		    }
		</script>
    </body>
</html>
    