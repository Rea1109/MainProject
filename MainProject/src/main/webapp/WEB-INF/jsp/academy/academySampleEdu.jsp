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
        <title>academyMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
		<script>
		
		var academyCode = '${academy.academyCode}';
		var academyName = '${academy.academyName}';
		var imgcount = '${imgcount}';
		var vidcount = '${vidcount}';
		
		alert("�п� �ڵ� = " + academyCode + " �п� �̸� = " + academyName + " \n�̹��� ���� ���� = " + imgcount + " ���� ���� ���� = " + vidcount);
		
		
		$(document).ready(function()
		// input file ���� ÷�ν� fileCheck �Լ� ����
		{
			$("#input_file").on("change", fileCheck);
		});

		 // ÷�����Ϸ���
		$(function () {
		    $('#btn-upload').click(function (e) {
		        e.preventDefault();
		        $('#input_file').click();
		    });
		});

		// ���� ���� �ʵ� ���� totalCount�� �񱳰�
		var fileCount = 0;
		// �ش� ���ڸ� �����Ͽ� ��ü ���ε� ������ ���Ѵ�.
		var totalCount = 3;
		// ���� �����ѹ�
		var fileNum = 0;
		// ÷������ �迭
		var content_files = new Array();

		function fileCheck(e) {
		    var files = e.target.files;
		    
		    // ���� �迭 ���
		    var filesArr = Array.prototype.slice.call(files);
		    
		    // ���� ���� Ȯ�� �� ����
		    if (fileCount + filesArr.length > totalCount) {
		      $.alert('������ �ִ� '+totalCount+'������ ���ε� �� �� �ֽ��ϴ�.');
		      return;
		    } else {
		    	 fileCount = fileCount + filesArr.length;
		    }
		    
		    // ������ ���� �迭��� �� ��Ÿ
		    filesArr.forEach(function (f) {
		      var reader = new FileReader();
		      reader.onload = function (e) {
		        content_files.push(f);
		        $('#articlefileChange').append(
		       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
		       		+ '<font style="font-size:12px">' + f.name + '</font>'  
		       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
		       		+ '<div/>'
				);
		        fileNum ++;
		      };
		      reader.readAsDataURL(f);
		    });
		    console.log(content_files);
		    //�ʱ�ȭ �Ѵ�.
		    $("#input_file").val("");
		  }

		// ���� �κ� ���� �Լ�
		function fileDelete(fileNum){
		    var no = fileNum.replace(/[^0-9]/g, "");
		    content_files[no].is_delete = true;
			$('#' + fileNum).remove();
			fileCount --;
		    console.log(content_files);
		}
		
		 // �� submit ����
		
			function registerAction(){
				
			var form = $("form")[0];        
		 	var formData = new FormData(form);
				for (var x = 0; x < content_files.length; x++) {
					// ���� ���Ѱ͸� ��� �ش�. 
					if(!content_files[x].is_delete){
						 formData.append("article_file", content_files[x]);
					}
				}
		   
		   // ���Ͼ��ε� multiple ajaxó��
		       
			$.ajax({
		   	      type: "POST",
		   	   	  enctype: "multipart/form-data",
		   	      url: "/academy/file-upload/${academy.academyCode}",
		       	  data : formData,
		       	  processData: false,
		   	      contentType: false,
		   	      success: function (data) {
		   	    	if(JSON.parse(data)['result'] == "OK"){
		   	    		alert("���Ͼ��ε� ����");
					} else
						alert("���Ͼ��ε� ����");
		   	      },
		   	      error: function (xhr, status, error) {
		   	    	alert("���� ���� �Ф�");
		   	     return false;
		   	      }
		   	    });
		   	    return false;
			}
		
		</script>
		
	<title>Academy Sample Edu page</title>

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
                                    <a class="nav-link" href="/review/addReviewView">�п� �ı� ����</a>
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
                        <h1 class="mt-4">${academy.academyName }</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    �п� ��ȣ	: ${academy.academyPhone}<br/>
                                    
                                    �п� �̹��� :

           		    <c:set var="i" value="0" />
					<c:forEach var="academy" items="${list}">
							<c:set var="i" value="${ i+1 }" />
					
					
					<c:if test="${academy.multimediarole == 'I'}">
							<img height="200" src="/image/${academy.multimedia}"/>
							<button> ���� </button>
					</c:if>
		        	</c:forEach>	
		        	
		        	<br/><br/><br/>
		        					���� ���� : 
		        	
		        	<c:set var="i" value="0" />
					<c:forEach var="academy" items="${list}">
							<c:set var="i" value="${ i+1 }" />
					<c:if test="${academy.multimediarole == 'V'}">
							<video controls>
								<source src="/image/KakaoTalk_20210719_213033364.mp4">
							</video>
							<button> ���� </button>
					</c:if>
		        	</c:forEach>
		        	
                                    
                            </div>

                        </div>
            
            <div class="container">
  <h2>���Ͼ��ε�</h2>
  <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">���� �߰�</button>
  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
  	<span style="font-size:10px; color: gray;">��÷�������� �ִ� 3������ ����� �����մϴ�.</span>
  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
		<span>÷�� ����</span>
		<br />
		<div id="articlefileChange">
		</div>
	</div>
  	<button type="submit" style="border: 1px solid #ddd; outline: none;">����</button>
  </form>
</div>

            
            
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div>
                </main>
            </div>
            
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
</html>
    