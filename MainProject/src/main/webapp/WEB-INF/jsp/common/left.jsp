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
					<a href="#">�п� ���</a>
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
	          
	          <li>
	              <a href="/user/getUser?email=${user.email}">�� ����</a>
	          </li>
	          
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
                    <a href="#">��Ȳ ��Ʈ</a>
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
	        	<a href="/user/logout">�α׾ƿ�</a>
	        </div>

	      </div>
    	</nav>

</body>
</html>

