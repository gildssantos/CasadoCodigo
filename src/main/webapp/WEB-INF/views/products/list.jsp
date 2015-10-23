<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="cdc" tagdir="/WEB-INF/tags" %>

<cdc:page title="Listagem de Produtos">


	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
	table, th, td {
		border: 1px solid black;
	}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Casa do Código: Lista de Livros</title>
</head>

<body>

	<h1>Lista de Livros</h1>
	<div>${sucesso}</div>
	<div>
		<table style="width: 100%">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Numero de Páginas</th>
				<th>Data Lançamento</th>
				<th>Sumário</th>
				<th>Preço E-Book</th>
				<th>Preço Físico</th>
				<th>Preço Ambos</th>
				<th>Detalhes</th>
			</tr>
			<c:forEach items="${products}" var="product" varStatus="status">
				<tr>
					<td>${product.title}</td>
					<td>${product.descricao}</td>
					<td>${product.paginas}</td>
					<td><fmt:formatDate value="${product.releaseDate.time}" pattern="dd/MM/yyyy"/></td>
					<td>${product.summaryPath}</td>
					<c:forEach items="${product.prices}" var="price">
						<td>${price.value}</td>
					</c:forEach>
					<td>
						<c:url value="/products/${product.id}" var="linkDetalhar"/>
						<a href="${linkDetalhar}" target="_blank">Detalhar</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</cdc:page>
</body>
</html>