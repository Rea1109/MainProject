<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

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
  </head>
  	<script type="text/javascript">
  	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		
		function fncGetList(currentPage) {
			alert("1");
			$("#currentPage").val(currentPage)
			var cateCode=$("input[name='cateCode']").val();
			
			var isMine=$("input[name='isMine']").val();
			if(isMine=='n'){
				$("form").attr("method" , "POST").attr("action" , "/board/listBoard?cateCode="+cateCode).submit();
			}else{
				$("form").attr("method" , "POST").attr("action" , "/board/listBoard?isMine="+isMine).submit();
			}
		}
		
		function enterEvent(){
			if(window.event.keyCode == 13){
				fncGetList(1);
			}
		}
		
		$(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#search" ).on("click" , function() {
				fncGetList(1);
			});
			 
		 });
		
		  
	
	</script>
	<style>
	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	body{
	overflow-x:hidden; overflow-y:visible;
	font-family: 'ChosunGu';
	}
	
	#boardHeader{
	vertical-align : top;
	font-size : 0px;
	color : black;
	font-family : TmonMonsori;
	}

	#recommendPosition{
	background-color : #FFF5E1;
	font-weight : bold;
	}
	
	#tableHead{
	background-color : #F8B739;
	color : white;
	text-align : center;
	font-size : 18px;
	}
	
	#searchPosition{
	font-family :NanumBarunGothic;
	position : absolute;
	right : -17%;
	top : 4.7%;
	}
	
	#boardTable{
	width : 110%;
	}
	
	#tablerow{
	border-bottom: 1px solid #85827D;
	}
	
	 #ListboardTitle:hover{
	 text-decoration: underline;
	 }
	 
	 #ListboardTitle{
	 color: black;
	 }
	
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #F8B739;
    border-color: #F8B739;
	}

	</style>
	
	
  <body>
  <div class="wrapper d-flex align-items-stretch" style="background-color:#E6E5DB; width:100%;">
	<!-- left ���� -->
	<jsp:include page="../common/left.jsp"></jsp:include>
       <!-- Page Content  -->
       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">
	         <!-- ��� ����  -->
	        
	         <jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	         
				<!-- �Խ��� ��� �ڽ� �κ�-->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;
					 width : 100%;">
				  <!-- �Խ��� title -->
				  <div class="row" id="boardHeader">
					<c:choose>
					<c:when test="${board.cateCode eq '0' }">
					  <a href="/board/listBoard?cateCode=0"><h3>&nbsp;&nbsp;&nbsp;&nbsp;��������</h3></a>
					</c:when>
					<c:when test="${board.cateCode eq '1' }">
					  <a href="/board/listBoard?cateCode=1"><h3>&nbsp;&nbsp;&nbsp;&nbsp;Q&A</h3></a>
					</c:when>
					<c:when test="${board.cateCode eq '2' }">
					  <a href="/board/listBoard?cateCode=2"><h3>&nbsp;&nbsp;&nbsp;&nbsp;���� �Խ���</h3></a>
					</c:when>
					<c:when test="${board.cateCode eq '3' }">
					  <a href="/board/listBoard?cateCode=3&academyCode="+${academy.academyCode}><h3>&nbsp;&nbsp;&nbsp;&nbsp;${academy.academyName} ��������</h3></a>
					</c:when>
					<c:when test="${search.isMine eq 'y' }">
					  <a href="/board/listBoard?isMine=y"><h3>&nbsp;&nbsp;&nbsp;&nbsp;���� �� �Խñ� ����</h3></a>
					</c:when>
					</c:choose>	
	 			  </div><br>
	 ī���ڵ� : ${board.cateCode}----
			 	<!-- �˻��κ�  -->
		   		<div class="row">
		   		  <!-- �˻��׷�  -->
		   		  <div class="col-md-6 text-right" id="searchPosition">
			 	    <form class="form-inline" >
			    	<input type="hidden" name="cateCode" id="cateCode" value="${search.cateCode}" />
				    <!-- �˻�����  -->
				    <div class="form-group">
					    <select class="form-control" id="searchConditionb" name="searchConditionb" style="width:120px;">
							<option value="0"  ${ ! empty search.searchConditionb && search.searchConditionb==0 ? "selected" : "" }>����</option>
							<c:if test="${board.cateCode ne '0'}">
							<option value="2"  ${ ! empty search.searchConditionb && search.searchConditionb==2 ? "selected" : "" }>�ۼ���</option>
							</c:if>
						</select>
					</div>
				  	<!-- �˻��� �Է�  -->
				    <div class="form-group">
				   		<label class="sr-only" for="searchKeyword">�˻���</label>
				    	<input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    		   value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
				  	</div>
				  	<!-- �˻� ��ư  -->
				  	<div>
				  	<button type="button" id="search" class="btn btn-primary">�˻�</button>
				 	 <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				 	 <input type="hidden" id="currentPage" name="currentPage" value=""/>
					
					</form>
					
					</div>
	    		  </div>
				</div>
		
      		<!-- �Խ��� table Start -->
			<div class="table-responsive">
			<!--  ���� �� �Խñ�  -->
			 <c:if test="${search.isMine eq 'y' }">
			 <table class="table" id="boardTable" >
        		 <!-- �Խ��� table head -->
        		 <thead id="tableHead">
	         	   <tr>
		             <th width=10% align="center"></th>
		             <th width=30% align="center" >�Խñ�����</th>
		             <th width=15% align="left">�ۼ�����</th>
		             <th width=10% align="center">��ȸ��</th>
        		  </thead>
       	     	
				<!-- �Խ��� �⺻ table list -->  
		    	<tbody>
				    <c:set var="i" value="${resultPage.totalCount }" />
				    <c:forEach var="board" items="${listc}">
				    <c:set var="i" value="${i-1}" />
				  <tr>
					<td id="tablerow" width=10% align="center">${i+1-(resultPage.currentPage-1)*10}</td>
				    <td id="tablerow" width=30% align="left"><a href="/board/getBoard?boardNo=${board.boardNo}&isMine=y">${board.boardTitle} (<span class="commentCount">${board.comment_cnt}</span>)</a></td>
					<td id="tablerow" width=15% align="left">
					  <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
					<td id="tablerow" width=10% align="left">&nbsp;&nbsp;&nbsp;&nbsp;${board.viewCnt}</td>
				  </tr>
           		 	</c:forEach>
          		</tbody>
     	 	</table></c:if>
     	 	<!--  ������ �Խ���  -->
     	 	   <c:if test="${search.isMine ne 'y' }">
      	       <table class="table" id="boardTable" >
        		 <!-- �Խ��� table head -->
        		 <thead id="tableHead">
	         	   <tr>
		             <th width=10% align="center"></th>
		             <th width=30% align="center" >�Խñ�����</th>
		            <c:if test="${board.cateCode ne '0'}">
		             <th width=20% align="center">�ۼ���</th>
		            </c:if>
		             <th width=15% align="left">�ۼ�����</th>
		             <th width=10% align="center">��ȸ��</th>
		            <c:if test="${board.cateCode eq '2'}">
		             <th width=10% align="center">��õ��</th>
	           		</c:if>
        		  </thead>
        		  <!-- �Խ��� ��õ table list -->       			
		    	 <tbody id="recommendPosition">
					<c:if test="${board.cateCode eq '2' }">
		 			<c:set var="i" value="${resultPage.totalCount }" />
		 			<c:forEach var="board" items="${map}">
				  <tr>
				    <td id="tablerow" width=10% align="center">��õ</td>
				    <td id="tablerow" width=30% align="left"><a href="/board/getBoard?boardNo=${board.BOARD_NO}&cateCode=${board.CATEGORY_CODE}">
				    	<span id="ListboardTitle">${board.BOARD_TITLE}</span> (<span class="commentCount">${board.COMMENT_CNT}</span>)</a></td>
				    <td id="tablerow" width=20% align="left">${board.EMAIL}</td>
				    <td id="tablerow" width=15% align="left">
				  	  <fmt:formatDate value="${board.BOARD_DATE}" pattern="yyyy-MM-dd"/></td>
				    <td id="tablerow" width=10% align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.VIEW_COUNT}</td>
				    <td id="tablerow" width=10% align="left"><span id="recommendCnt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.RECNT}</span></td>
				  </tr>
         			 </c:forEach></c:if>
       	     	</tbody>
				<!-- �Խ��� �⺻ table list -->  
		    	<tbody>
				    <c:set var="i" value="${resultPage.totalCount }" />
				    <c:forEach var="board" items="${listc}">
				    <c:set var="i" value="${i-1}" />
				  <tr>
					<td id="tablerow" width=10% align="center">${i+1-(resultPage.currentPage-1)*10}</td>
					<td id="tablerow" width=30% align="left"><a href="/board/getBoard?boardNo=${board.boardNo}&cateCode=${board.cateCode}">
						<span id="ListboardTitle">${board.boardTitle}</span> (<span class="commentCount">${board.comment_cnt}</span>)</a></td>
					<c:if test="${board.cateCode ne '0'}">
					<td id="tablerow" width=20% align="left">${board.email}</td>
					</c:if>
					<td id="tablerow" width=15% align="left">
					  <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
					<td id="tablerow" width=10% align="left">&nbsp;&nbsp;&nbsp;&nbsp;${board.viewCnt}</td>
					<c:if test="${board.cateCode eq '2'}">
					<td id="tablerow" width=10% align="left"><span id="recommendCnt">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.recommendCnt}</span></td>
					</c:if>
				  </tr>
           		 	</c:forEach>
          		</tbody>
     	 	</table></c:if>
     	</div>
     	
     	
    	<!--  table End /////////////////////////////////////-->
	  <!-- �۾��� ��ư -->
	  <div class="form-group">
		<input type="hidden" name="cateCode" value="${search.cateCode}" />	    
		<input type="hidden" name="isMine" value="${search.isMine}" />	  
		 	
			  <c:if test="${search.cateCode eq '1'}">
			<div class="col-sm-offset-11  col-sm-1 text-center">
			<button type="button" class="btn btn-primary" id="cw" >
		     <a href="/board/addBoard?cateCode=1" >�۾���</a></button>
		    </div>
		    </c:if>
			
		  <c:choose>
			<c:when test="${search.cateCode eq '0' && user.role eq 'admin' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=0" >�۾���</a></button>
		    	</div>
			</c:when>
			
			<c:when test="${search.cateCode eq '2' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=2" >�۾���</a></button>
		    	</div>
			</c:when>
			
		  </c:choose>	
			 	
		</div>
		<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_new.jsp"/>
				<!-- PageNavigation End... -->
  	</div>
  	 <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>