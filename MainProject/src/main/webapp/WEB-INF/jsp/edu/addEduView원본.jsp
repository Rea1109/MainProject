<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Buy Edu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script type="text/javascript">
	
	   function fncAddProduct(){
	   
	      $('form').attr("method", "POST").attr("action", "/edu/addEdu?academyCode=${code}").submit();
	   }
	   
	   $( function() {
	      
	      $( ".btn:contains('�� ��')").on("click", function() {
	         
	         fncAddProduct();
	      });
	      
	   });
	   
	   $( function() {
	      
	      $( ".btn btn-primary btn:contains('���')").on("click", function() {
	          
	    	  window.history.back();
	      });
	      
	   });
	   
	   $( function() {
		   
		   $('#eduStartDate').datepicker( { dateFormat : "yy-mm-dd" } );
		   
		   $('#eduEndDate').datepicker( { dateFormat : "yy-mm-dd" } );
		   
	   })
	   
	
	</script>

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
		
		<div id="header"><h1 class="mt-4">${edu.academy.academyName}</h1></div>
		
		<!-- ����� �п�����, ��Ƽ������ �̵� ���� -->
		<jsp:include page="../common/toolbar.jsp"></jsp:include>
	        
	        <div class="container">
				<!-- ���� ���� ������ �̻ڰ� -->
				
				<h1 class="text-center">�� �� �� ��</h1>
	
	<form class="form-horizontal" enctype="multipart/form-data">
		
		
		  <div class="form-group">
		    <label for="eduName" class="col-sm-offset-1 col-sm-1 control-label">�� �� ��</label>
		    <div class="col-lg-3">
		      <input type="text" class="form-control" id="eduName" name="eduName" placeholder="�������� �Է����ּ���.">
		    </div>
		    <label for="eduTeacher" class="col-sm-2 control-label">�� �� ��</label>
		    <div class="col-lg-3">
		      <input type="text" class="form-control" id="eduTeacher" name="eduTeacher" placeholder="������� �Է����ּ���.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduPrice" class="col-sm-offset-1 col-sm-1 control-label">�� �� ��</label>
		    <div class="col-lg-3">
		      <input type="text" class="form-control" id="eduPrice" name="eduPrice" placeholder="�����Ḧ �Է����ּ���.">
		      <span style = "color:red">���ڸ� �Է����ּ���.</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		  	<label for="eduStartDate" class="col-sm-2 control-label">���� ���� ��¥</label>
			    <div class="col-lg-3">
			      <input type="text" class="form-control" id="eduStartDate" name="eduStartDate" placeholder="���� ���۳�¥�� �������ּ���."/>
			    </div>
		    <label for="eduEndDate" class="col-sm-2 control-label">���� ���� ��¥</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="eduEndDate" name="eduEndDate" placeholder="���� ���ᳯ¥�� �������ּ���."/>
			    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduDay" class="col-sm-2 control-label">���� ��¥</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduDay" name="eduDay" placeholder="������¥�� �Է����ּ���."/>
		    </div>
		    <label for="eduMember" class="col-sm-2 control-label">���� �� �ο�</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduMember" name="eduMember" placeholder="���� �������� �Է����ּ���."/>
		      <span style = "color:red">���ڸ� �Է����ּ���.</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduStartTime" class="col-sm-2 control-label">���� ���� �ð�</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduStartTime" name="eduStartTime" placeholder="EX) ���� 9�� , AM 9:00"/>
		    </div>
		    <label for="eduEndTime" class="col-sm-2 control-label">���� ���� �ð�</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="eduEndTime" name="eduEndTime" placeholder="EX) ���� 9�� , PM 9:00"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="eduIntro" class="col-sm-2 control-label">���� ������</label>
		    <div class="col-sm-3">
		      <textarea rows="8" cols="62" name="eduIntro", id="eduIntro"> ���������� ������ �ۼ����ּ���.</textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    &nbsp;&nbsp;&nbsp;<label for="eduGrade" class="col-sm-2 control-label">���� ����г�</label>
		    <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="�ʵ�">�ʵ�
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="�ߵ�">�ߵ�
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="��1~��2">��1~��2
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="��3">��3
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduGrade" value="N��">N��
			 </label>
			 <span style="color : red"> 1���� �������ּ��� </span>
		  </div>
		  
		  <div class="form-group">
		  &nbsp;&nbsp;&nbsp;<label for="eduSubject" class="col-sm-2 control-label">���� ����</label>
		     <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="����">����
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="����">����
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="����">����
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="��ȸ">��ȸ
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="����">����
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="�� 2�ܱ���">�� 2�ܱ���
			 </label>
			 <label class="btn btn-default">
			  <input type="checkbox" name="eduSubject" value="��ü��">��ü��
			 </label>
			 <span style="color : red"> 1���� �������ּ��� </span>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="add">�� ��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		  
	</form>
        
	      	</div>
      	
       </div>
      
	</div>
	
    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>