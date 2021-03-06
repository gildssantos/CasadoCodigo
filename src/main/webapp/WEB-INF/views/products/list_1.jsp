<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sce" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Casa do codigo</title>
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
	<h1>Casa do Código</h1>
	<div>${sucesso}</div>
	<div>
		<table style="width: 100%">
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Descrição</th>
				<th>Numer de Páginas</th>
				<th>Data de Lançamento</th>
				<th>Caminho do sumário</th>
				<th>Preço Ebook</th>
				<th>Preço Printed</th>
				<th>Preço Combo</th>
				<th>Detalhes</th>
			</tr>
			<c:forEach items="${products}" var="product" varStatus="status">
				<tr>
					<td>${product.id}</td>
					<td>${product.title}</td>
					<td>${product.descricao}</td>
					<td>${product.paginas}</td>
					<td>${product.summaryPath}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy"
							value="${product.releaseDate.time}" /></td>
					<c:forEach items="${product.prices}" var="price">
						<td>${price.value}</td>
					</c:forEach>
					<td><c:url value="/products/${product.id}" var="linkDetalhar" />
						<a href="${linkDetalhar}">Detalhar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>