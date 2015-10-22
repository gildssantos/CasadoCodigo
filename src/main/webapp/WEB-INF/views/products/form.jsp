<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@taglib prefix="sce" uri="http://www.springframework.org/security/tags" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro: Casa do Código</title>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

</head>
<body>
<sce:authorize access="isAuthenticated()"> 
 <sce:authentication property="principal" var="user"/>
   <div>Hello ${user.name}
   </div>
   
   <div>
    <c:url value= "/logout" var="logoutUrl"/>
	<a href="${logoutUrl}"> Logout </a>
	</div>
</sce:authorize>




	<h1>Cadastro Casa do Código</h1>
	<c:url value="/products" var="url" />
	
	
	<form:form action="${spring:mvcUrl('PC#save').build()}" method="post" commandName="product" enctype="multipart/form-data">
		
		<label for="title"> Título </label> 
		<form:input path="title" name="title" type="text"/> 
		<form:errors path="title"/>
		
		<br> 
		
		<label for="desc"> Descricao </label>
		<form:textarea name="descricao" rows="5" cols="140" path="descricao" /> 
		<form:errors path="descricao"/>
		<br> 
		
		<label for="paginas"> Número de paginas </label> 
		<form:input path="paginas" name="paginas" type="text"/>
		<form:errors path="paginas"/> 
		<br>

		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label> 
				<input type="text" name="prices[${status.index}].value" id="prices_${bookType }" /> 
				<input type="hidden" name="prices[${status.index}].bookType" value="${bookType }" />
			</div>
		</c:forEach>
		
		<label for="releaseDate"> Data </label> 
		<form:input path="releaseDate" name="releaseDate" type="text" id="releaseDate"/>
		<form:errors path="releaseDate"/> 
		<br>
		
		<label for="summary"> Súmario </label> 
		<input type="file" name="summary" id="summary"/>

		<br> <input type="submit" value="Gravar" />


	</form:form>
<script>
$('#releaseDate').datepicker({dateFormat : 'dd/mm/yy'});
</script>

</body>
</html>