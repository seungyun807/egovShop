<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>로그인</title>
</head>
<script type="text/javascript">
	function gojoin(){
		var link = '/joinview.do';
		location.href=link;
	}
</script>
<body class = "container">
   <div class="jumbotron">
        <h1><spring:message code="title.login" /></h1>
        <p></p>
    </div>

	<form action="/login.do" method="post">
        <div class="form-group">
            <label><spring:message code="title.id" /></label>
            <input name="user_id" type="text" class="form-control" />
        </div>
        <div class="form-group">
            <label><spring:message code="title.password" /></label>
            <input name="password" type="password" class="form-control" />
        </div>
        <button type="submit" class="btn btn-primary"><spring:message code="title.login" /></button>
        <button type="button" onclick=gojoin() class="btn btn-default"><spring:message code="title.join" /></button>
    	<c:if test="${map.msg == 'failure'}">
    		<script type="text/javascript">
    			alert('아이디 또는 비밀번호가 일치하지 않습니다.');
    		</script>
    	</c:if>
    </form>

    
</body>
</html>