<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title><spring:message code="title.join" /></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2eebb72cbf45a61d75d2efc7638259a2"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
	    //idck 버튼을 클릭했을 때 
	    $("#userid").keyup(function() {
	        //userid 를 param.
	        var userid =  $("#userid").val();
	        $.ajax({
	            type : 'GET',
	            data : {
	    			"checkId": $("#userid").val()			
	    		},
	            url : "<c:url value='idcheck.do'/>",
	            dataType : 'json',
	            contentType: "application/json; charset=UTF-8",
	            success : function(returnData, status) {
	            	console.log(returnData);
	            	if(status == "success") {
	    				if(returnData.usedCnt > 0 ){
	    					$("#id_check").css("color", "red");
	    					$("#id_check").text("사용할수 없는 아이디입니다.");
	    				}else{
	    					$("#id_check").css("color", "blue");
	    					$("#id_check").text("사용가능한 아이디입니다.");
	    				}
	    			}else{ alert("ERROR!" + error);return;} 
	            }
	        });
	    });
	});

	function cancel(){
		var link = '/loginview.do';
		location.href=link;
	}
	
	 function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
      
	 $(function() {
		 $("#pwconfirm").keyup(function() {
			 var pw =  $("#pw").val();
			 var pwconfirm =  $("#pwconfirm").val();
		 	if(pw != pwconfirm){
		 		$("#pw_confirm").css("color", "red");
		 		$("#pw_confirm").text("비밀번호가 일치하지 않습니다.");		
		 	} else{
		 		$("#pw_confirm").css("color", "blue");
		 		$("#pw_confirm").text("비밀번호가 일치합니다.");
		 	}
		 });
		 $("#pw").keyup(function() {
			 var pw =  $("#pw").val();
			 var pwconfirm =  $("#pwconfirm").val();
		 	if(pw != pwconfirm){
		 		$("#pw_confirm").css("color", "red");
		 		$("#pw_confirm").text("비밀번호가 일치하지 않습니다.");		
		 	} else{
		 		$("#pw_confirm").css("color", "blue");
		 		$("#pw_confirm").text("비밀번호가 일치합니다.");
		 	}
		 });
	 });
	 
	 function checkId() {
		 const idcheck = document.getElementById('id_check')
		 console.log(idcheck.innerText);
		 if(idcheck.innerText == "사용가능한 아이디입니다."){
			 return true;
		 } else {
			 alert('사용할수 없는 아이디입니다.')
			 return false;
		 }
	 }
	 
	 function checkPw() {
		 const pwconfirm = document.getElementById('pw_confirm')
		 console.log(pwconfirm.innerText);
		 if(pwconfirm.innerText == "비밀번호가 일치합니다."){
			 return true;
		 } else {
			 alert('비밀번호가 일치하지 않습니다.')
			 return false;
		 }
	 }
	 
	 function checkIdPw(){
		 console.log(checkIdPw);
		 if(checkId()&&checkPw()){
			 console.log(true);
			 return true;
		 }else{
			 console.log(false);
			 return false;
		 }
	 }
</script>
</head>
<body class = "container">
   <div class="jumbotron">
        <h1><spring:message code="title.join" /></h1>
    </div>
	<form action="/join.do" onsubmit="return checkIdPw()" method="post" >
        <div class="form-group">
         	<label><spring:message code="title.id" /> *</label>
            	<input name="user_id" type="text" class="form-control" id="userid"/>
            	<div class="check_font" id ="id_check"></div>
        </div>
		
        <div class="form-group">
            <label><spring:message code="title.password" /></label>
            <input name="password" type="password" class="form-control" id="pw"/>
        </div>
        <div class="form-group">
            <label><spring:message code="title.passwordconfirm" /></label>
            <input name="passwordcheck" type="password" class="form-control" id="pwconfirm"/>
            <div class="check_font" id ="pw_confirm"></div>
        </div>
        <div class="form-group">
            <label><spring:message code="title.name" /></label>
            <input name="name" type="text" class="form-control" />
        </div>
        <div class="form-group">
            <label><spring:message code="title.email" /></label>
            <input name="e_mail" type="email" class="form-control" />
        </div>
        <div class="form-group">
            <label><spring:message code="title.phone" /></label>
            <input name="phone_num" type="text" class="form-control" />

        </div>

       	<div class="form-group">
       	<label><spring:message code="title.zip" /></label>
            	<input type="text" id="sample6_postcode" name="zip" class="form-control" ><br>
        	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
        </div>
       
        <div class="form-group">
            <label><spring:message code="title.adres" /></label>
            <input type="text" name="adres" id="sample6_address" placeholder="<spring:message code="title.adres" />" class="form-control">
            <input type="text" name="datail_adres" id="sample6_detailAddress" placeholder="<spring:message code="title.detailadres" />" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary"><spring:message code="title.join" /></button>
        <button type="button" onclick=cancel() class="btn btn-default"><spring:message code="title.cancle" /></button>
        <br>
  		<c:if test="${joinmsg == 'success'}">
    		<script type="text/javascript">
    			alert('가입되었습니다.');
    			location.href="/loginview.do";
    		</script>
    	</c:if>

    </form>
</body>
</html>