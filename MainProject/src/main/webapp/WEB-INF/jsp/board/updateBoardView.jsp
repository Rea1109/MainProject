<%@page import="com.buyedu.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<head>

  <title>Summernote</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('��')" ).on("click" , function() {
		fncupdateBoard();
	});
});	

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	

function fncupdateBoard(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	var title=$("input[name='boardTitle']").val();
	var content=$("textarea[name='boardContent']").val();
	var writer=$("input[name='boardWriter']").val();

	
	/* var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value; */
	
	//var cateName = target.options[target.selectedIndex].text;
	

	
	
		
	$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
}


</script>
</head>

<body>



	<div class="navbar  navbar-default">
	 <div class="container">
        	<a class="navbar-brand" href="/index.jsp">JENNYSHOP</a>
   		</div>
   	</div>
   	
   	<div class="container">
	
		<div class="page-header text-default">
		
		<h3 style="text-align:center;">�Խñ� ����</h3> 
		</div>
		
	
	<br/><br/>
	
	<form class="form-horizontal">
	<input type="hidden" name="boardNo" value="${board.boardNo}" />
		
 	<div id="updatebrdview" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label">����</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle}">
		    </div>
		</div>
		
		<div id="updatebrdview" class="form-group">
		    <label for="boardWriter" class="col-sm-offset-1 col-sm-1 control-label">�ۼ���</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="boardWriter" name="boardWriter" value="${board.boardWriter}">
		    </div>
		</div>
			
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label">����</label>
		    <div class="col-sm-12" height=100px>
		      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="boardContent"
						placeholder="����" style="resize: none;">${board.boardContent}</textarea>
		    </div>
		</div>
		
		
		
		
		
		
		
		</div>
				
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >��&nbsp;��</button>
			  &nbsp;<a class="btn btn-default" href="#" role="button">��&nbsp;��</a>
		    </div>
		</div>
		
		  <div id="summernote"></div>
  <script>
    $(document).ready(function() {
    	 $('#summernote').summernote({
    	        placeholder: 'Hello Bootstrap 4',
    	        tabsize: 2,
    	        height: 500,
    	        lang: "ko-KR",
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
    	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    	      });
    });
  </script>
	

</head>

</form> 
</body>
</html>