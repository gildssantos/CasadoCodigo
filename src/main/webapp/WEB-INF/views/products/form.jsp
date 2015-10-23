<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="cdc" tagdir="/WEB-INF/tags" %>

<cdc:page title="Listagem de Produtos">

	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

	<h1>Casa do Código</h1>

		<form:form action="${spring:mvcUrl('PC#save').build()}" method="post" commandName="product" enctype="multipart/form-data">
		
		<label for="title">Título</label>
		<form:input type="text" path="title" id="title"/>
		<br/>
		<form:errors path="title" cssStyle="color:red;"/>

		<br/>
		<br/>

		<label for="descricao" >Descrição</label>
		<form:textarea rows="4" cols="50" path="descricao" id="descricao"/>
		<br/>
		<form:errors path="descricao" cssStyle="color:red;"/>
		
		<br/>
		<br/>

		<label for="paginas">Número de Páginas</label>
		<form:input type="text" path="paginas"/>
		<br/>
		<form:errors path="paginas" cssStyle="color:red;" />

		<br/>
		<br/>

		<label for="releaseDate">Data Lançamento</label>
		<form:input type="text" path="releaseDate" name="releaseDate" id="releaseDate"/>
		<br/>
		<form:errors path="releaseDate" cssStyle="color:red;"/>

		<br/>
		<br/>

		<div>
			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div>
					<label for="price_${bookType}">${bookType}</label> <form:input
						type="text" path="prices[${status.index}].value"
						id="price_${bookType}" /> <form:input type="hidden"
						path="prices[${status.index}].bookType" value="${bookType}" />
				</div>
			</c:forEach>
		</div>

		<br/>
		<br/>

		<label for="summary">Sumário</label>
		<input type="file" name="summary" id="summary"/>
		<form:errors path="summaryPath" cssStyle="color:red;"/>

		<br/>
		<br/>
		<br/>

		<input type="submit" value="Enviar">
	</form:form>
	
	<script>
	  $("#releaseDate").datepicker({dateFormat:'dd/mm/yy'});
	</script>
	
</cdc:page>
