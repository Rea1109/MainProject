<%@page import="com.buyedu.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 	<style>
		#cmtcontent{
	      width : 100%;
	      heigt : 200px;
	    }
	    
	    #commentInsert{
	      width : 100px;
	      height : 34px;
	    }
	    
	    #buttons{
	      text-align : right;
	    }
	    
	    #commentwriterpr{
	      color : #A804CD;
	    }
	    
	    #commentDate{
	      color : black;
	    }
	    
	   </style>
 </br></br>
 <body>
 	  <div class="container-fluid">
        ��� <span class="commentCount"></span>
        <form name="commentInsertForm" onsubmit="return false">
            <div class="input-group">
               <input type="hidden" name="boardNo" value="${board.boardNo}"/>
               <input type="text" class="form-control" onkeyup="enterEvent()" id="cmtcontent" name="content" placeholder="������ �Է��ϼ���." >
               <span class="input-group-btn">
                    <button id="commentInsert" class="btn btn-default" type="button" name="commentInsertBtn">���</button>
               </span>
              </div>
              </br></br>
        </form>
    </div>
    
    <div class="container-fluid">
    	
    
        <div class="commentList"></div>
    </div>
</div>

	
<script>
var boardNo = '${board.boardNo}'; //�Խñ� ��ȣ



$('[name=commentInsertBtn]').click(function(){ //��� ��� ��ư Ŭ���� 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm�� ������ ������
    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
});
 
//��� ��� 

function commentList(){
    $.ajax({
        url : '/board/json/listComment/'+boardNo,
        method : 'GET',
        dataType : "json",
        headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
        success : function(data, status){

            var a =''; 
            var cnt = data[0].commentCount;
           
			var sessionId = "<%=((User)session.getAttribute("user")).getUserNo() %>"
            
            alert(sessionId)
            $(".commentCount").html(cnt);
            console.log(cnt)
       		
            $.each(data, function(key, value){ 
            	a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
               
                a += '<div id="commentwriterpr" class="commentInfo'+value.COMMENT_NO+'">'+value.EMAIL;
                a += '&nbsp;&nbsp;&nbsp;&nbsp;'
                
                a += '<span id="commentDate" class="commentDate'+value.COMMENT_NO+'">'+value.COMMENT_DATE+'</span></div>';
                <fmt:formatDate value="${COMMENT_DATE}" var="date" pattern="yyyyMMdd" />
                a += '<div id="buttons">'
                if (sessionId == value.COMMENT_WRITER){
                a += '<a onclick="commentUpdate('+value.COMMENT_NO+',\''+value.COMMENT_CONTENT+'\');"> ���� </a>';
                a += '<a onclick="commentDelete('+value.COMMENT_NO+');"> ���� </a>';} 
                if (sessionId != value.COMMENT_WRITER){
                a += '<a onclick="commentComplain('+value.COMMENT_NO+');"> �Ű� </a>';}
        		a += '</div>'
                a += '<div class="commentContent'+value.COMMENT_NO+'"> <p> '+value.COMMENT_CONTENT+'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}

 
//��� ���
function commentInsert(insertData){
    $.ajax({
        url : '/board/json/addComment',
        type : 'post',
        data : insertData,
        success : function(data){
        	console.log(data)
            if(data == 1) {
                commentList(); //��� �ۼ� �� ��� ��� reload
                $('[name=content]').val('');
                
            }
        }
    });
}

function enterEvent(){
	if(window.event.keyCode == 13){
		var insertData = $('[name=commentInsertForm]').serialize(); 
		commentInsert(insertData);
	}
}

 
//��� ���� - ��� ���� ����� input ������ ���� 
function commentUpdate(commentNo, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" id="content" name="content_'+commentNo+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" id="commentInsert" type="button" onclick="commentUpdateProc('+commentNo+');">����</button> </span>';
    a += '</div>';
    
    $('.commentContent'+commentNo).html(a);
    
}
 
//��� ����
function commentUpdateProc(commentNo){
    var updateContent = $('[name=content_'+commentNo+']').val();
    
    $.ajax({
        url : '/board/json/updateComment',
        type : 'post',
        data : {'content' : updateContent, 'commentNo' : commentNo},
        success : function(data){
            if(data == 1) commentList(boardNo); //��� ������ ��� ��� 
        }
    });
}
 
//��� ���� 
function commentDelete(commentNo){
	if(confirm('�����Ͻðڽ��ϱ�?')){
		
	    $.ajax({
	    	
	        url : '/board/json/deleteComment/'+commentNo,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentList(boardNo);
	            location.reload();
	          //��� ������ ��� ��� 
	        }
	    });
	}else{
		return false;
	}
}
 
 
 
 
$(document).ready(function(){
    commentList(); //������ �ε��� ��� ��� ��� 
});
 
 
 
</script>


 
</body>
</html>
