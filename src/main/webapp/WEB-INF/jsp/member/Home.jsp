<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	function goto_order(prd_num){
		var link = 'ordersheetview.do?prd_num='+prd_num;
		location.href=link;
	}
	function goto_logout(){
		var link = 'logout.do';
		alert('로그아웃 되었습니다.');
		location.href=link;
	}
	function goto_login(){
		var link = 'loginview.do';
		location.href=link;
	}
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-10">
        
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
       
         
      
        <c:choose>
        	<c:when test="${empty user}">
        		<button type="button" onclick="goto_login()" class="btn btn-primary"><spring:message code="title.login" /></button>
        	</c:when>
        	<c:otherwise>
        	 <button type="button" onclick="goto_logout()" class="btn btn-default"><spring:message code="title.logout" /></button>
        	</c:otherwise>
        </c:choose>
        </div>
        <div class="col-md-9">
        
        <table class="table table-hover">
       
	 <thead>
	    <tr>
      <th><spring:message code="title.prdnum" /></th>
      <th><spring:message code="title.prdname" /></th>
      <th><spring:message code="title.prdprice" /></th>
      <th></th>
   </tr>
 </thead>
  <tbody>
	  <c:forEach var="product" items="${productList}" varStatus="status">
	 
   <tr>
      <td>${status.count}</td>
      <td>${product.prd_name}</td>
      <td>${product.prd_price}</td>
      <td><button type="button" onclick="goto_order(${product.prd_num})" class="btn btn-default"><spring:message code="title.buy" /></button></td>
      
   </tr>
  

	  </c:forEach>
 </tbody> 
 
	 </table>
	 
        </div>
    </div>
    <div class="row"><c:out value = "${user}"/></div>
    <div class="row"></div>
</div>
	  
	 

</body>
</html>