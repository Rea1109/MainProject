<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>

<head>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

</head>


<body>
			<nav id="sidebar">
				<div class="p-4 pt-5">
				<br></br>
				<c:choose>
	           		<c:when test="${user.role eq 'admin'}">
	           			<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/admin2.png); width:190px; height: 190px;"></a>
	           		</c:when>
	           		<c:when test="${user.role eq 'student' || user.role eq 'parents' || empty user.role}">
	           			<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/student2.png); width:190px; height: 190px;"></a>
	           		</c:when>
	           		<c:when test="${user.role eq 'academy'}">
	           			<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(/image/teacher2.png); width:190px; height: 190px;"></a>
	           		</c:when>
	           	</c:choose>
	           	
		  		
	        <ul class="list-unstyled components mb-5">
	           <h4>
	       		<c:choose>
	           		<c:when test="${!empty user.role}">
	           			<div align="center">
	           				<span style="color:#F8B739">${user.name}</span>
	           					 <c:if test="${user.role eq 'student' }">(�л�)</c:if>
		           				 <c:if test="${user.role eq 'parents' }">(�кθ�)</c:if>
		           				 <c:if test="${user.role eq 'academy' }">(����)</c:if>
		           				 <c:if test="${user.role eq 'admin' }">(������)</c:if> ��
	           			</div>
	           		</c:when>
	           		<c:otherwise>
	          			<div align="center"><span style="color:#F8B739">${email}</span> ��</div>
	           		</c:otherwise>
	           	</c:choose>
		      </h4>
		      
		        <br>
		        
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
		         
		         <c:if test="${user.role != 'admin'}"> 
		          <li>
		            <a href="#userSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">�� ����</a>
		          	 <ul class="collapse list-unstyled" id="userSubmenu">
				          <li>
				              <a href="/user/getUser?email=${user.email}">ȸ�� ����</a>
				          </li>
				          <c:if test="${user.role eq 'student' || user.role eq 'parents'}">
					          <li>
			                    <a href="/review/listmyReview?uesrNo=${user.userNo}">�� �ı� ����</a>
			               	 </li>
			               	 <li>
			                    <a href="/board/listBoard?isMine=y">�� �Խñ� ����</a>
			                </li>
		                  </c:if>
		              </ul>
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
	                    <a href="/complain/getComplainList">�Ű� ����</a>
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
		         
		         	</br>
		         	
	                   <div align="center"><span name="logout" href="#" data-toggle="modal" data-target="#logoutModal"><u>�α׾ƿ�</u></span></div>
	                
                
	        </ul>
	        
	        

	      </div>
    	</nav>
    	
    	<script src="/js/sockjs.min.js"></script>
    	<script src="/js/stomp.min.js"></script>
    	
    	
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
    		
    		 
    		 $('#allLogout').on("click" , function() {
    			 
    			 //console.log("2222�α׾ƿ�Ŭ��")
    			 
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
    				 
    				 //alert("īī�� �α׾ƿ�!")
    				 
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
    				 //alert("�Ϲ� �α׾ƿ�");
    				 self.location = "/user/logout"
    				 
    				 //������
    				 //self.location = "logout"
    			 }
    			 
    		 });
    	});


        
    	</script>
	
		<!-- �α׾ƿ���� -->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="abc"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <div align="center">
	                    	<h5 class="modal-title" id="abc">�α׾ƿ� �Ͻðڽ��ϱ�?</h5>
	                    </div>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">��</span>
	                    </button>
	                </div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" id="allLogout" name="allLogout" href="#" onclick="return false;">Logout</a>
	                </div>
	            </div>
	        </div>
	    </div>

</body>
</html>

