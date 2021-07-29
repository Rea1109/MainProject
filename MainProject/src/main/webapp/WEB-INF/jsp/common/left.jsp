<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>


<body>
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/student.png);"></a>
	        <ul class="list-unstyled components mb-5">
	        
	        <c:if test="${user.role == 'academy'}">
	          <li>
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">�� �п�</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">

			<c:if test="${list.size()<=2}">
				<li>
					<a href="/academy/addAcademyView">�п� ���</a>
				</li>
			</c:if> 
			
			<c:forEach var="academy" items="${list}">
				
				<li>
					<a href="/academy/academyInfo?academyCode=${academy.academyCode}" >${academy.academyName}</a>		 
				</li>	
			</c:forEach>			




	            </ul>
	          </li>
	         </c:if> 
	          
	         <c:if test="${user.role != 'admin' }">
	          <li>
	              <a href="/user/getUser?email=${user.email}">�� ����</a>
	          </li>
	         </c:if> 
	          
	         <c:if test="${user.role != 'academy'}"> 
	          <li>
	              <a href="/search/searchAcademy">�п��˻�</a>
	          </li>
	         </c:if> 
	         
	         <c:if test="${user.role == 'admin'}">  
	          <li>
	            <a href="#siteSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">����Ʈ ����</a>
	            <ul class="collapse list-unstyled" id="siteSubmenu">
                <li>
                    <a href="/user/listUser">ȸ�� ���</a>
                </li>
                <li>
                    <a href="/chart/getChart">��Ȳ ��Ʈ</a>
                </li>
	            </ul>
	          </li>
	          <li>
              <a href="#comSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">�Ű����</a>
              <ul class="collapse list-unstyled" id="comSubmenu">
                <li>
                    <a href="#">�ı� �Ű�</a>
                </li>
                <li>
                    <a href="#">�Խñ� �Ű�</a>
                </li>
                <li>
                    <a href="#">��� �Ű�</a>
                </li>
              </ul>
	          </li>	          
	         </c:if> 
	          
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">�Խ���</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="/board/listBoard?cateCode=2">�����Խ���</a>
                </li>
                <li>
                    <a href="/board/listBoard?cateCode=0">��������</a>
                </li>
                <li>
                    <a href="/board/listBoard?cateCode=1">QnA</a>
                </li>
                <li>
                    <a href="/board/listBoard?isMine=y">�� �Խñ� ����</a>
                </li>
              </ul>
	          </li>
	          
	         <c:if test="${user.role == 'student' || user.role =='parents'}">  
	          <li>
              <a href="#eduSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">����</a>
              <ul class="collapse list-unstyled" id="eduSubmenu">
                <li>
                    <a href="/pickedu/listPickEdu?userNo=${user.userNo}">���ɼ���</a>
                </li>
                <li>
                    <a href="/purchaseedu/listPurchaseEdu?userNo=${user.userNo}">���ż���</a>
                </li>
              </ul>
	          </li>
	         </c:if> 
	          
	        </ul>

	        <div class="footer">
	        	<a name="logout" href="/user/logout">�α׾ƿ�</a>
	        </div>

	      </div>
    	</nav>
    	
    	<script src="/js/sockjs.min.js"></script>
    	<script src="/js/stomp.min.js"></script>
    	
    	
    	<script>
    	let socket = new SockJS("/socket");
        let stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
        	console.log("���� ����", frame);
        	stompClient.subscribe("/topic/message", (res) => {
        		console.log("�޽����� �޾ҽ��ϴ�.");
            	console.log("res", res);
            });
            
            stompClient.send("/chat", {}, '{"test", "test"}');
        });
        
        
        
        
        //�α׾ƿ� JS
        $(function() {	
		
			 Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
			
			 $('a[name=logout]').on("click" , function() {
				 
				 alert("�α׾ƿ� Ŭ��")
				 
				 let x = document.cookie;
				 
				 const words = x.split("; ");
				 
				 var loginType = "";
				 
				 for(var i=0; i < words.length; i++ ){
					 
					if( words[i].split("=")[0] === "loginType" ){
						 console.log( words[i].split("=")[1] )
						 loginType = words[i].split("=")[1];
					}
				 }
				 
				 if(loginType == "kakao"){
					 
					 alert("īī�� �α׾ƿ�!")
					 
					 if (!Kakao.Auth.getAccessToken()) {
						  console.log('Not logged in.');
						  
						  self.location = "/"
						  
						  return;
					}
					 
					 Kakao.API.request({
						 
					  url: '/v1/user/unlink',
					  success: function(response) {
					    console.log(response);
					    
					    self.location = "/"
					  },
					  
					  fail: function(error) {
					    console.log(error);
					  },
					  
					});
					 
				 }else if(loginType == "naver"){
					 
					 alert("���̹��α׾ƿ�")
					 
					 var accessToken = localStorage.getItem("com.naver.nid.access_token")
					 var tokenArray = accessToken.split(".");
					 var finalToken = tokenArray[1]
					 
					  $.ajax({
	                 		
						  crossOrigin : true,
						  contentType: "application/json",
						  dataType : "json",
						  
		            	  url : "/user/json/naver/logout/" + finalToken,
		                  success : function(JSONData, status){
		                  	console.log("���->" +JSONData);
		                  	self.location = "/" 
		                  }, error  : function (a,b,c) {
		                  	console.log(a)
		                  	alert("�α׾ƿ� ����");
		                  	
		                  }
		              })
						
				 }else{
					 alert("�Ϲ� �α׾ƿ�");
					 self.location = "logout"
				 }
				 
			 });
	});


        
        
        
        
    	</script>

</body>
</html>

