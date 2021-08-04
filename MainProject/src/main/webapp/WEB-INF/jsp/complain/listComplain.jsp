<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

  <head>
  	<title>List Complain</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
  </head>
  	<script type="text/javascript">
  	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			
				$("form").attr("method" , "POST").attr("action", "/complain/getComplainList").submit();
		}
		
		function enterEvent(){
			if(window.event.keyCode == 13){
				fncGetList(1);
			}
		}
		
		$(function() {
			 $( "button.btn.btn-default" ).on("click" , function() {
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
  <div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; width:100%;">

	<jsp:include page="../common/left.jsp"></jsp:include>

       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">

	         <jsp:include page="../common/toolbar.jsp" ></jsp:include>
	         
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;
					 width : 100%;">
					 
				   <div class="col-md-6 text-left" id="boardHeader">
		    	<h3> 신고 목록 </h3>
		    </div><br>
		    
		    <div class="col-md-6 text-right" id="searchPosition">
			    <form class="form-inline" >
			    
			    <div class="form-group">
				    <select class="form-control" id="searchCondition" name="searchCondition" style="width:120px;">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>신고 분류</option>
					</select>
				 </div>
				  
				 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
	    	</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover" id="boardTable">
        <thead id="tableHead">
          <tr>
            <th width=5%>신고 분류</th>
            <th width=5%>글 번호</th>
            <th width=10%>신고자 번호</th>
            <th width=5%>신고 사유</th>
            <th width=20%>신고일자</th>
            <th width=10%>신고 처리</th>
           </tr>
        </thead>
		<tbody>
		  <c:set var="i" value="${resultPage.totalCount}" />
		  <c:forEach var="complain" items="${comlist}">
			<c:set var="i" value="${i-1}" />
			
			<c:if test="${complain.complainState != '1'}">
			
			<tr>
			  <td width=5% align="center">
				<c:if test="${complain.complainSort == 'B'}">
				  게시글
				</c:if>
				<c:if test="${complain.complainSort == 'C'}">
				  댓글
				</c:if>
				<c:if test="${complain.complainSort == 'R'}">
				  후기
				</c:if>
			  </td>
				  
			  <td width=5% align="left">
			  
			  <c:if test="${complain.complainSort == 'B'}">
				  <a href="/board/getBoard?boardNo=${complain.board.boardNo}">${complain.board.boardNo}</a>
			  </c:if>
			  <c:if test="${complain.complainSort == 'C'}">
			  	  <a href="/board/getBoard?boardNo=${complain.board.boardNo}">${complain.board.boardNo}</a>
			  </c:if>
			  <c:if test="${complain.complainSort == 'R'}">
				  ${complain.commentNo}
			  </c:if>
			  
			  </td>
			  
			  <td width=10% id="listtable" align="left">${complain.user.userNo}</td>
			  <td width=5% id="listtable" align="left">${complain.complainReason}</td>
			  <td width=20% id="listtable" align="left">
			  <fmt:formatDate value="${complain.complainDate}" pattern="yyyy-MM-dd"/></td>
			  <td width=10% id="listtable" align="left">
			  <a onclick="updateComplainy(${complain.complainNo})">수락</a>
			  &nbsp;&nbsp; / &nbsp;
			  <a onclick="updateComplainn(${complain.complainNo})">반려</a>
			  </td>
			  
			</tr>
			</c:if>
          </c:forEach>
        </tbody>
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
	  
			 	<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_new.jsp"/>
				<!-- PageNavigation End... -->
		</div>
	</div></div></div>
	
  	</div>
  	 <!-- <script src="/js/jquery.min.js"></script>   -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    <script>
    
	// 신고 처리 yes
	function updateComplainy(complainNo){
		if(confirm('신고 처리 하시겠습니까?')){
		    $.ajax({
		        url : '/complain/json/updateComplain/'+complainNo,
		        type : 'POST',
		        success : function(data){
		        	alert("신고 처리가 완료되었습니다.");
		        	location.reload()
		        }
		    });
		}
	}
	
	// 신고 처리 no
	function updateComplainn(complainNo){
		if(confirm('신고 반려 하시겠습니까?')){
		    $.ajax({
		        url : '/complain/json/deleteComplain2/'+complainNo,
		        type : 'POST',
		        success : function(data){
		        	alert("신고 처리가 완료되었습니다.");
		        	location.reload()
		        }
		    });
		}
	}
	
	// 게시판 블러처리
	function updateBoardState(boardNo){
		if(confirm('게시글을 블러처리 하시겠습니까?')){
		    $.ajax({
		        url : '/complain/json/updateBoardState/'+boardNo,
		        type : 'POST',
		        success : function(data){
		        	alert("블러 처리가 완료되었습니다.");
		        	location.reload()
		        }
		    });
		}
	}
    
    
    $(document).ready(function(){
		//alert('${comlist[0].complainNo}');
	});
    
    </script>
    
</body>
</html>