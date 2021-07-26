<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Buy! Edu</title>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/main.css" rel="stylesheet" />
    </head>
    <body >
        <!-- Background Video-->
        <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop"><source src="assets/mp4/main.mp4" type="video/mp4" /></video>
        <!-- Masthead-->
        <div class="masthead">
            <div class="masthead-content text-white" >
                <div class="container-fluid px-4 px-lg-0" style="color:#EB8F05;">
                    <h1 class="fst-italic lh-1 mb-4"><a href="/user/login" style="color:#EB8F05;" >Buy! Edu</a></h1>
                    <p class="mb-5">��� �л����� �´� �п����� �´� ������ ��⸦ �ٶ��ϴ�.</p>
                    <p class="mb-5">�츮�� ������� ���ǿ� �����Ͻð� �л����� ������ �����ϴ� ���� �´ٰ� �����մϴ�.</p>
                    
                </div>
            </div>
        </div>
        <!-- Social Icons-->
        <!-- For more icon options, visit https://fontawesome.com/icons?d=gallery&p=2&s=brands-->
        <div class="social-icons">
            <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
            	<div class="fw-bolder" style="color:white">Developer</div>
            	<a class="btn btn-dark m-3" id="moon"><img class="image" alt="����" src="/image/moon.jpg"></a>
            	<a class="btn btn-dark m-3" ><img class="image" alt="����" src="/image/kim.png"></a>
            	<a class="btn btn-dark m-3" ><img class="image" alt="����" src="/image/mk.jpg"></a>
            	<a class="btn btn-dark m-3" ><img class="image" alt="����" src="/image/jenny.jpg"></a>
                <a class="btn btn-dark m-3" ><img class="image" alt="����" src="/image/rea.jpg"></a>
                <a class="btn btn-dark m-3" ><img class="image" alt="����" src="/image/jeawoo.jpg"></a>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script type="text/javascript">
        $(".btn.btn-dark").on("click",function(){
        	alert("���߿� ������ ����");
        })
        
        </script>
        
        
    </body>
</html>
