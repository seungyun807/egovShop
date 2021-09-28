<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title><spring:message code="title.paysuccess" /></title>
</head>
<script>

function gohome(){
	var link = '/homeview.do';
	location.href=link;
}

</script>
<body class = "container">
   <div class="jumbotron">
        <h1><spring:message code="title.paysuccess" /></h1>
    </div>
	

 <table class="table table-hover">
       
	 <thead>
	    <tr>
      <th><spring:message code="title.prdnum" /></th>
      <th><spring:message code="title.prdname" /></th>
      <th><spring:message code="title.prdprice" /></th>
      
   </tr>
 </thead>
  <tbody>
	  <c:forEach var="buylist" items="${buyList}" varStatus="status">
   <tr>
      <td>${status.count}</td>
      <td>${buylist.prd_name}</td>
      <td>${buylist.prd_price}</td>
   </tr>
	  </c:forEach>
 </tbody> 
	 </table>	
		
       <dl class="dl-horizontal">
  		<dt><spring:message code="title.name" /></dt>
  		<dd>${userInfo.name}</dd>
  		
  		<dt><spring:message code="title.email" /></dt>
  		<dd>${userInfo.name}</dd>
  		
  		<dt><spring:message code="title.phone" /></dt>
  		<dd>${userInfo.phone_num}</dd>
		
		
		<dt><spring:message code="title.zip" /></dt>
  		<dd>${userInfo.zip}</dd>
		
		
		<dt><spring:message code="title.adres" /></dt>
  		<dd>${userInfo.adres}</dd>
  		<dd>${userInfo.detail_adres}</dd>
		
		<dt><spring:message code="title.totalprice" /></dt>
  		<dd>${userInfo.totalprice}</dd>
		</dl>
		
        
        <button type="submit" class="btn btn-primary"><spring:message code="title.orderlist" /></button>
        <button type="button" onclick=gohome() class="btn btn-default"><spring:message code="title.gohome" /></button>
  	  <div class="py-5"></div>

</body>
</html>