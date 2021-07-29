<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

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
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<script type="text/javascript">
//============= "����"  Event ���� =============
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('��')" ).on("click" , function() {
		fncAddBoard();
	});
});	
//============= "���"  Event ó�� ��  ���� =============

function fncAddBoard(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	var title= $('input[name="boardTitle"]').val();
	var content=$('textarea[name="boardContent"]').val();
	var boardWriter=$('input[name="boardWriter"]').val();
	var cateCode=$('input[name="cateCode"]').val();
	var acaWriter=$('input[name="acaWriter"]').val();
	alert(acaWriter)
	
	if(title == null || title.length <1){
		alert("�� ������ �Է����ּ���.");
		return;
	}
	
	/* var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value; */
	//var target = document.getElementById("cate");
	//var cateName = target.options[target.selectedIndex].text;
	//var cateName = $("#cate option:checked").text();
	//console.log('name : ' + cateName)
	//document.getElementById("cateName").value = cateName;
	

	
	$("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
}
</script>


 <body>
 <div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; width:100%;">
	<!-- left ���� -->
	<jsp:include page="../common/left.jsp"></jsp:include>
       <!-- Page Content  -->
       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">
	         <!-- ��� ����  -->
	         <jsp:include page="../common/toolbar.jsp"></jsp:include> 
				<!-- �Խ��� ��� �ڽ� �κ�-->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
				  <!-- �Խ��� title -->
				  <div class="row" id="boardHeader">
					<c:choose>
					<c:when test="${board.cateCode eq '0' }">
					  <h3>&nbsp;&nbsp;&nbsp;&nbsp;��!���� ��������</h3>
					</c:when>
					<c:when test="${board.cateCode eq '1' }">
					  <h3>&nbsp;&nbsp;&nbsp;&nbsp;��!���� Q&A</h3>
					</c:when>
					<c:when test="${board.cateCode eq '2' }">
					  <h3>&nbsp;&nbsp;&nbsp;&nbsp;���� �Խ���</h3>
					</c:when>
					<c:when test="${board.cateCode eq '3' }">
					  <h3>&nbsp;&nbsp;&nbsp;&nbsp;�п� ��������</h3>
					</c:when>
					<c:when test="${search.isMine eq 'y' }">
					  <h3>���� �� �Խñ� ����</h3>
					</c:when>
					</c:choose>	
	 			  </div><br>
  
	
	<div class="container-fluid">
	<form class="form-horizontal">
	
	<input type="hidden" name="boardWriter" value="${user.userNo}" />
	<input type="hidden" name="cateCode" value="${board.cateCode}" />
	<input type="hidden" name="acaWriter" value="${board.acaWriter}" />
		
	 	<div id="addbrdview" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="������ �Է����ּ���.">
		    </div>
		</div>
		
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12" height=100px>
		      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="boardContent"
						placeholder="����" style="resize: none"></textarea>
		    </div>
		</div>
		
</form>
		
		</div>	
				
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >�� &nbsp;��</button>
			  &nbsp;<a class="btn btn-default" href="/board/listBoard" role="button">��&nbsp;��</a>
		 	</div>
		</div>
		</div>
	</div>

  <div id="summernote"></div>
  <script>
    $(document).ready(function() {
    	 $('#summernote').summernote({
    	        placeholder: '������ �Է����ּ���.',
    	        tabsize: 2,
    	        height: 500,
    	        lang: "ko-KR",
    	        maximumImageFileSize : 20 * 1024 * 1024,
    	  	  // �����Ϳ� Ŀ�� �̵� (inputâ�� autofocus��� �����Ͻø� �˴ϴ�.)
    	  	  focus : true,
    	  	  toolbar: [
    	  		    // �۲� ����
    	  		    ['fontname', ['fontname']],
    	  		    // ���� ũ�� ����
    	  		    ['fontsize', ['fontsize']],
    	  		    // ����, ����Ӳ�, ����,��� ��, ���������
    	  		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	  		    // ���ڻ�
    	  		    ['color', ['forecolor','color']],
    	  		    // ǥ�����
    	  		    ['table', ['table']],
    	  		    // �۸Ӹ� ��ȣ, ��ȣ�ű��, ��������
    	  		    ['para', ['ul', 'ol', 'paragraph']],
    	  		    // �ٰ���
    	  		    ['height', ['height']],
    	  		    // �׸�÷��, ��ũ�����, ������÷��
    	  		    ['insert',['picture','link','video']],
    	  		    // �ڵ庸��, Ȯ���ؼ�����, ����
    	  		    ['view', ['codeview','fullscreen', 'help']]
    	  		  ],
    	  		  // �߰��� �۲�
    	  		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','���� ���','�ü�','����ü','����','����ü','����ü'],
    	  		 // �߰��� ��Ʈ������
    	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    	  		callbacks: {	//�̹��� ÷���ϴ� �κ�
    	               onImageUpload : function(files) {
    	                    uploadSummernoteImageFile(files[0],this);
    	                }
    	            }
    	  	  
           });
    });	 
    
    function uploadSummernoteImageFile(file, editor) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/board/uploadSummernoteImageFile",
            contentType : false,
            processData : false,
            success : function(data) {
                //�׻� ���ε�� ������ url�� �־�� �Ѵ�.
                $(editor).summernote('insertImage', data.url);
            }
        , error:function(request,status,error){
        	alert("code : " + request.status + " / msg : " + request.responseText + " / error : " + error);
        
        }
        });
    }
      
    	 </script>
    
</body>
</html>