<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<head>

  <title>�Խñ� ����</title>
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
	alert(title)
	var content=$('textarea[name="boardContent"]').val();
	alert(content)
	var boardWriter=$('input[name="boardWriter"]').val();
	alert(boardWriter)
	var cateCode=$('input[name="cateCode"]').val();
	alert(cateCode)
	
	
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
 <%@ include file="toolbar.jsp" %>

	
   	</br></br></br>
   	
   	<div class="container">
	
		<div class="page-header text-default"> 
		
		<h3 style="text-align:center;">�Խñ� ����</h3> 
		</div>
	<br/><br/>
	
	<div class="container-fluid">
	<form class="form-horizontal">
	
	<input type="hidden" name="boardWriter" value="${user.userNo}" />
	<input type="hidden" name="cateCode" value="${board.cateCode}" />
	search.cateCode : ${search.cateCode}
	board.cateCode : ${board.cateCode}

		
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
				
		</div>
		
	 	
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >�� &nbsp;��</button>
			  &nbsp;<a class="btn btn-default" href="/board/listBoard" role="button">��&nbsp;��</a>
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