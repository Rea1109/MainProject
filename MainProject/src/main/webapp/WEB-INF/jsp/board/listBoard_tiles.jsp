<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/style.css" rel="stylesheet">  
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		
		function fncGetList(currentPage) {
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
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
	
	</script>
	<style>
	#boardHeader{
	vertical-align : top;
	font-size : 0px;
	color : #1F4E79;
	font-family : TmonMonsori;
	}
	
	
	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

	#recommendPosition{
	background-color : #D4EAFB;
	font-weight : bold;
	
	}
	
	#tableHead{
	background-color : #2E75B6;
	color : white;
	text-align : center;
	font-size : 18px;
	}
	
	@font-face {
     @font-face {
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
	 font-weight: 400;
	 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
	}
	}
	
	#searchPosition{
	font-family :NanumBarunGothic;
	position : absolute;
	right : -33%;
	top : -4.5%;
	}
	</style>
	</head>
	
  <body>
	<!-- �Խ��� title -->
	<div class="card shadow mb-4">
	  <div class="card-header py-3" id="boardHeader">
			<c:choose>
				<c:when test="${search.cateCode eq '0' }">
					<h3>��!���� ��������</h3>
				</c:when>
				<c:when test="${search.cateCode eq '1' }">
					<h3>��!���� Q&A</h3>
				</c:when>
				<c:when test="${board.cateCode eq '2' }">
					<h3>���� �Խ���</h3>
				</c:when>
				<c:when test="${search.cateCode eq '3' }">
					<h3>�п� ��������</h3>
				</c:when>
				<c:when test="${search.isMine eq 'y' }">
					<h3>���� �� �Խñ� ����</h3>
				</c:when>
			</c:choose>	
	  </div>
	
	<div class="row">
		<div id="searchPosition" ><br></br>
			<div class="col-md-6 text-right" id="totalPosition">
			<form class="form-inline" name="detailForm" id="searchPosition">
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
			    <input type="hidden" name="cateCode" id="cateCode" value="${search.cateCode}" />
			    
			    <div class="col-md-12 text-right">
				    <select class="form-control" id="searchConditionb" name="searchConditionb">
						<option value="0"  ${ ! empty search.searchConditionb && search.searchConditionb==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchConditionb && search.searchConditionb==1 ? "selected" : "" }>����</option>
						<c:if test="${board.cateCode eq '2' || board.cateCode eq '1' }">
						<option value="2"  ${ ! empty search.searchConditionb && search.searchConditionb==2 ? "selected" : "" }>�ۼ���</option>
						</c:if>
					</select>
				
				
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" onkeyup="enterEvent()" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : null }"  >
			
				  <button type="button" class="btn btn-default">�˻�</button>
				  <br/><br/>
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			</form>
	    	</div></div>
		</div>
	</div>
		
      <!-- table Start -->
      <div class="card-body">
		<div class="table-responsive">
      	   <table class="table table-hover" id="boardTable" width="100%" cellspacing="0">
        	 <thead id="tableHead">
         	   <tr>
	             <th align="center">No</th>
	             <th align="center" >�Խñ�����</th>
	             <th align="center">�ۼ���</th>
	             <th align="left">�ۼ�����</th>
	             <th align="center">��ȸ��</th>
	            <c:if test="${board.cateCode eq '2'}">
	             <th align="center">��õ��</th>
	            </c:if>
        	 </thead>
       			
		    <tbody id="recommendPosition">
			<c:if test="${board.cateCode eq '2' }">
		 	 <c:set var="i" value="${resultPage.totalCount }" />
		 	 <c:forEach var="board" items="${map}">
			<tr>
			  <td align="left">��õ</td>
			  <td align="left"><a href="/board/getBoard?boardNo=${board.BOARD_NO}&cateCode=${board.CATEGORY_CODE}">${board.BOARD_TITLE} (<span class="commentCount">${board.COMMENT_CNT}</span>)</a></td>
			  <td align="left">${board.EMAIL}</td>
			  <td align="left">
			  	<fmt:formatDate value="${board.BOARD_DATE}" pattern="yyyy-MM-dd"/></td>
			  <td align="left">${board.VIEW_COUNT}</td>
			  <td align="left"><span id="recommendCnt">${board.RECNT}</span></td>
			</tr>
         	</c:forEach></c:if>
       	    </tbody>
		
		    <tbody>
		  	<c:set var="i" value="${resultPage.totalCount }" />
		  	<c:forEach var="board" items="${list}">
			<c:set var="i" value="${i-1}" />
			<tr>
			  <td align="left">${i+1-(resultPage.currentPage-1)*10}</td>
			  <td id="listtable" align="left"><a href="/board/getBoard?boardNo=${board.boardNo}&cateCode=${board.cateCode}">${board.boardTitle} (<span class="commentCount">${board.comment_cnt}</span>)</a></td>
			  <td id="listtable" align="left">${board.email}</td>
			  <td id="listtable" align="left">
			  	<fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
			  <td id="listtable" align="left">${board.viewCnt}</td>
			 <c:if test="${search.isMine eq 'n' && board.cateCode eq '2'}">
			  <td id="listtable" align="left"><span id="recommendCnt">${board.recommendCnt}</span></td>
			 </c:if>
			</tr>
            </c:forEach>
            </tbody>
     	 </table>
     </div>
     </div>
	  <!--  table End /////////////////////////////////////-->
	  <div class="form-group">
	  ī�װ��� :  ${search.cateCode}
	  userNo : ${user.userNo}
		<input type="hidden" name="cateCode" value="${search.cateCode}" />	    
		<input type="hidden" name="isMine" value="${search.isMine}" />	  
		   
		 <c:choose>
			<c:when test="${search.cateCode eq '0' && user.userNo eq 140 }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=0" >�۾���</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '1' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default" value="${search.cateCode}" >
		     	 <a href="/board/addBoard?cateCode=1" >�۾���</button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '2' }">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=2" >�۾���</a></button>
		    	</div>
			</c:when>
			<c:when test="${search.cateCode eq '3' && user.role eq 'academy'}">
				<div class="col-sm-offset-11  col-sm-1 text-center">
		     	 &nbsp;&nbsp;<button type="button" class="btn btn-default"  >
		     	 <a href="/board/addBoard?cateCode=3" >�۾���</a></button>
		    	</div>
			</c:when>
		  </c:choose>	
		</div>
		
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_tiles.jsp"/>
	<!-- PageNavigation End... -->

  
</body>
</html>
    