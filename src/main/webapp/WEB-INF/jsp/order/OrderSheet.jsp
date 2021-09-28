<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2eebb72cbf45a61d75d2efc7638259a2"></script>
<meta charset="UTF-8">
<title><spring:message code="title.buy" /></title>
<script>
function cancel(){
	var link = '/homeview.do';
	location.href=link;
}

</script>
</head>
<body class = "container">
   <div class="jumbotron">
        <h1><spring:message code="title.buy" /></h1>
    </div>
	
<form action="/ordersheet.do" method="post">
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
		
       
        <div class="form-group">
            <label><spring:message code="title.name" /></label>
            <input name="name" type="text" class="form-control" value="${userInfo.name}"/>
        </div>
        <div class="form-group">
            <label><spring:message code="title.email" /></label>
            <input name="e_mail" type="email" class="form-control" />
        </div>
        <div class="form-group">
            <label><spring:message code="title.phone" /></label>
            <input name="phone_num" type="text" class="form-control" value="${userInfo.phone_num}" />
        </div>
        <div class="form-group">
            <label><spring:message code="title.zip" /></label>
            <input name="zip" type="text" class="form-control" value="${userInfo.zip}"/>
        </div>
        <div class="form-group">
            <label><spring:message code="title.adres" /></label>
            <input name="adres" type="text" class="form-control" value="${userInfo.adres}"/>
        </div>
        
      
        <div class="form-group">
            <label><spring:message code="title.detailadres" /></label>
            <input name="datail_adres" type="text" class="form-control" value="${userInfo.detail_adres}"/>
        </div>
        <div class="form-group">
         <label><spring:message code="title.totalprice" /></label>
        	<input name="totalprice" type="hidden" value="${userInfo.totalprice}"/>
        	<p>${userInfo.totalprice}</p>
         </div>
        <button type="submit" class="btn btn-primary"><spring:message code="title.buy" /></button>
        <button type="button" onclick=cancel() class="btn btn-default"><spring:message code="title.cancle" /></button>
  	  <div class="py-5"></div>
    </form>
</body>
</html>