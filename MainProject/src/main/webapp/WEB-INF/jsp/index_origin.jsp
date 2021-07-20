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
        <title>index</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">Buy! Edu</a>

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
                        <li><a class="dropdown-item" href="/user/login">login</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
 
            <!-- ���Ⱑ ��� �� ȭ�� (�ٲ�� ��) -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Buy! Edu</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/main/userMain">�л�,�кθ�� �α��εǾ��ٸ�</a></li>
                            <li class="breadcrumb-item"><a href="/main/academyMain">��������� �α��εǾ��ٸ�</a></li>
                            <li class="breadcrumb-item"><a href="/main/adminMain">�����ڷ� �α��εǾ��ٸ�</a></li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                �츮�� ���ѹα� ��� �л��� �ڽſ� �´� �п��� �ٴ� �� �ֵ��� ��� �մϴ�. ���� �ٷ�
                                <a  href="/user/addUser">ȸ������</a>
                                �� �ϰ� �������� ��� ���׿� �п��� �˻� �غ����� .<br/><br/>
                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                ����..��� �ٹб�
                            </div>
                            <div class="card-body"></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                        
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>

    </body>
</html>
    