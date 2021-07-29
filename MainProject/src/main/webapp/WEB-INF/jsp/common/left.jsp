<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>


<body>
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/student.png);"></a>
		  		
		  		
	        <ul class="list-unstyled components mb-5">

	        
	        <c:if test="${user.role != null }"></c:if>
	        
	        <c:if test="${user.role == 'academy'}">
	          <li>
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">�� �п�</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
			
			<c:forEach var="academy" items="${list}">
				
				<li>
					<input type="hidden" name="codes" value="${academy.academyCode}" />
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

			<button name="test" onclick="send();">�׽�Ʈ</button>
	        <div class="footer">
	        	<a name="logout" href="/user/logout">�α׾ƿ�</a>
	        </div>
	        

	      </div>
    	</nav>
    	
    	<script src="/js/sockjs.min.js"></script>
    	<script src="/js/stomp.min.js"></script>
    	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
    	
    	
    	<script>
    	let socket = new SockJS("/socket");
        let stompClient = Stomp.over(socket);
        
		function connect(){
			stompClient.connect("", "", function(frame) {
	        	console.log("���� ����", frame);
	        	subscribe();
	        });
        }
		
		function subscribe(){
			document.getElementsByName("codes").forEach(item => {
				stompClient.subscribe("/subscribe/noti/" + item.value + "/userNo", (res) => {
					setNotis(res);
	        		alert("message");
	        		console.log("�޽����� �޾ҽ��ϴ�.");
	            	console.log("res", res);
	            });	
			});
		}
		
		function setNotis(res){
			let notis = JSON.parse(res);
			let notiCount = notis.length;
			addNotiList(notis);
		}
		
		function addNotiList(notis){
			//�˶� ����Ʈ ����
		}
        
        function close(){
        	socket.close();
        }
        
        document.addEventListener("DOMContentLoaded", function(){
        	connect();
        	socket.onclose = function() {
        	    console.log('close');
        	    stompClient.disconnect();
        	};
        });
        
         
        
      //=========�α׾ƿ� �׽�Ʈ �� =============
    	$(function() {	
    		
    		 Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
    		
    		 $('a[name=logout]').on("click" , function() {
    			 
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

