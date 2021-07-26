<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

	<!-- JS ���� /////////// Ÿ�� �� �ٲ��ֱ�! (���ø������� �߰��� ����, ������ �Ұ�)-->
	<script type="text/javascript">

	//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿� 
	
	function fncGetList(currentPage) {
		//alert(currentPage)
		$("#currentPage").val(currentPage)
	   	$('form[name="detailForm"]').attr("method", "POST").attr("action","/user/listUser").submit();	
	};
	
	
	//���ͽ� ���� �ذ� �ʿ� �ȵǴ°ž�
	function enterEvent(){
		if(window.event.keyCode == 13){
			//alert("����")
			fncGetList(1);
		}
	}
	
	//ó�����۶� ���� ����
	$(function() {
		
		$('form[name="detailForm"] input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
		    	event.preventDefault();
		 	 };
		});
		 
		 
	});
	
	
	
	//�˻���ư Ŭ�� event
	$(function() {
		
		Kakao.init('ceef97deb317ea49500db9f27e7cc2fa');
		
		$( 'button[name="click"]' ).on("click" , function() {
			fncGetList(1);
		});
		 
	});
	
	
	
	
	$(function() {
		
		$("input[name=searchRole]").each(function(index, item){
			var $check = $(this)
			var roles = '${roles}';
			
			console.log(item)
			if (roles.indexOf(item.value) > -1) {
			//	item.checked = true;
				$check.attr("checked", "checked");
			}
		})
		
		$("input[name=searchAccountState]").each(function(index, item){
			var states = '${states}';
			if (states.indexOf(item.value) > -1 )
				item.checked = true;
		})
		
		
		
		
		
	//=========�α׾ƿ� �׽�Ʈ �� =============
	$(function() {	
		
		 $('input[name=allLogout]').on("click" , function() {
			 
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
				 
				 
					Kakao.Auth.logout(function() {
					  console.log(Kakao.Auth.getAccessToken());
					  
					  if(Kakao.Auth.getAccessToken()){
						  alert('�α׾ƿ�����');
					  }else{
						  
					  }
					 
					});
					
				 
				 
			 }else if(loginType == "naver"){
				 
				 alert("���̹� �α׾ƿ�!")
				 
				 //sessionStorage.clear();
				 //localStorage.clear();
				 //deleteAllCookies();
				 
				 var accessToken = localStorage.getItem("com.naver.nid.access_token")
				 
				 //console.log(accessToken)
				 
				 var tokenArray = accessToken.split(".");
				 
				 //console.log(tokenArray)
				 
				 var finalToken = tokenArray[1]
				 
				console.log(finalToken)
				
				sessionStorage.clear();
				 
				 //���̹� ��ū���� ��û
				 $.ajax({
					 
					 crossOrigin : true,
	                 
	            	  url : "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vqx5V5ejE6mgkpcPu2vP&client_secret=YjzvVMUZRW&access_token="+finalToken+"&service_provider=NAVER",
	            	  
	            	  dataType: "json",	  
	            			  
	                  headers : {
	                      "Accept" : "application/json",
	                      "Content-Type" : "application/json"
	                    },
	                    success : function(JSONData, status){
	                    	console.log("�α׾ƿ��� �Ƕ�...");
	                    	self.location = "/";
	                        
	                    }
	              })
		              
		            
					 
					
					 /*
						var accessToken = localStorage.getItem("com.naver.nid.access_token")
					 
					 //console.log(accessToken)
					 
					 var tokenArray = accessToken.split(".");
					 
					 //console.log(tokenArray)
					 
					 var finalToken = tokenArray[1]
					 
					 console.log(finalToken)
					 //return
					 
						  $.ajax({
		                 		
							  crossOrigin : true,
							  
			            	  url : "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vqx5V5ejE6mgkpcPu2vP&client_secret=YjzvVMUZRW&service_provider=NAVER&access_token="+finalToken,
			                  
			            	  dataType: "json",
			            			  
	            			  headers : {
			                	  
			                      "Accept" : "application/json",
			                      "Content-Type" : "application/json"
			                    },
			                    success : function(JSONData, status){
			                    	console.log("���� ���->" +JSONData);
			                    },
			                    
			                    error : function(xhr, status, errorThrown){
			                    	console.log("����");
			                    	console.log(xhr);
			                    	console.log(status);
			                    	console.log(errorThrown);
			                    	
			                    } 
			                    
		              });
					 
					 
					
			            
					// debugger
					 
					 //self.location = "/"
					 /*
					 localStorage.removeItem('com.naver.nid.access_token');
					 
					 function Logout(){
						 sessionStorage.clear();
					 }
					 
					 //self.location = "/"
					 
					 */
					 
							
		              
					 
				 }else{
					 alert("�Ϲ� �α׾ƿ�");
					 self.location = "logout"
				 }
				 
				 /*
				 
				 if (!Kakao.Auth.getAccessToken()) {
					  console.log('Not logged in.');
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
				 
				 
				 
					Kakao.Auth.logout(function() {
					  console.log(Kakao.Auth.getAccessToken());
					  
					  if(Kakao.Auth.getAccessToken()){
						  alert('�α׾ƿ�����');
					  }else{
						  
					  }
					 
					});
					
					*/
			 });
		});
		 
	});
	

</script>


<!-- ���� body ���� -->
		
					<!-- �� �������� /// �������� jsp �� �ڸ� -->
		         	 <!-- DataTales Example -->
		         	 <div class="card shadow mb-4">
		               <div class="card-header py-3">
		                  <h6 class="m-0 font-weight-bold text-primary">ȸ�������ȸ</h6>
		               </div>
		              
		              <!-- ���̺� �˻� -->
		              <div class="row">
						    <div class="col-md-6 text-left">
						    	<p class="text-primary">
						    		&nbsp;&nbsp;��ü ȸ�� ${resultPage.totalCount } ��, ���� ${resultPage.currentPage}  ������
						    	</p>
						    </div>
						    
						    <div><br></br></div>
						    
						    <div class="col-md-6 text-right">
							    <form class="form-inline" name="detailForm">
							    
							     <div class="col-md-12 text-right">
							    	<p>
							    		<span><strong> ����� ���� </strong></span>
							    		<input type="checkbox" name="searchRole" value="student"> �л�
							    		<input type="checkbox" name="searchRole" value="parents"> �кθ�
							    		<input type="checkbox" name="searchRole" value="academy"> �п�
							    	</p>
							    	<p>
							    		<span><strong> ȸ�� ���� </strong></span>
							    		<input type="checkbox" name="searchAccountState" value="0"> Ȱ����
							    		<input type="checkbox" name="searchAccountState" value="1"> Ż��
							    	</p>
						   		 </div>
						   		 
								  <div class="col-md-12 text-right">
								    <select class="form-control" name="searchCondition" >
										<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>Email</option>
										<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
									</select>
									<label class="sr-only" for="searchKeyword">�˻���</label>
								    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
								    			onkeyup="enterEvent()" value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
								  
								     <button type="button" name="click" class="btn btn-default">�˻�</button>
								  </div>
								  
								  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
					    	</div>
					    	
						</div>
					  <!-- ���̺� �˻� �� -->
					  
		              <!-- Data ���̺� ���� -->
		              <div class="card-body">
		                  <div class="table-responsive">
		                      <table class="table table-hover table-striped" id="dataTable" width="100%" cellspacing="0">
		                          <thead>
		                              <tr>
		                                  <th align="center">No</th>
		                                  <th align="left">����</th>
		                                  <th align="left">ȸ����</th>
		                                  <th align="left">Email</th>
		                                  <th align="left">������</th>
		                                  <th align="left">��������</th>
		                                  <th align="left">Ż��¥</th>
		                              </tr>
		                          </thead>
		                          <tfoot>
		                              <tr>
		                                  <th align="center">No</th>
		                                  <th align="left">����</th>
		                                  <th align="left">ȸ����</th>
		                                  <th align="left">Email</th>
		                                  <th align="left">������</th>
		                                  <th align="left">��������</th>
		                                  <th align="left">Ż��¥</th>
		                              </tr>
		                          </tfoot>
		                          <tbody>
		                          
		                              <c:set var="i" value="0" />
										  <c:forEach var="user" items="${list}">
											<c:set var="i" value="${ i+1 }" />
											<tr>
											  <td align="center">${i+(resultPage.currentPage-1)*10}</td>
											  <td align="left">${user.role}</td>
											  <td align="left">${user.name}</td>
											  <td align="left">${user.email}</td>
											  <td align="left">${user.inDate}</td>
											  <td align="left">
												  <c:choose>
													  <c:when test= "${user.accountState == '0' }">
														Ȱ����
													  </c:when>
													  <c:when test= "${user.accountState == '1' }">
														Ż��
													  </c:when>
												  </c:choose>
											  </td>
											  <td align="left">${ ! empty user.outDate ? user.outDate : "-"}</td>
											</tr>
								        </c:forEach>
								      
		                           </tbody>
		                      </table>
		                  </div>
		              </div>
		          </div><!-- Data ���̺� �� -->
          
          
          <!-- �� ���� �� /////////////////////////////////// -->
     
     <!-- �������׺���̼� -->
     <jsp:include page="../common/pageNavigator_tiles.jsp"/>