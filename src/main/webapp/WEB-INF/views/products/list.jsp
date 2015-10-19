<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html class="no-js" lang="pt">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<title>${product.title}</title>
	
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/style.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
  	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/layout-colors.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
	<link href="http://cdn.shopify.com/s/files/1/0155/7645/t/177/assets/responsivo-style.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
	<link href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/guia-do-programador-style.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
	<link href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/products.css?10732338795638998506" rel="stylesheet" type="text/css"  media="all"  />
</head>

<c:url value="/shopping" var="shoppingCartUrl" />
<body class="product">
	<header id="layout-header">
		<div class="clearfix container">
			<a href="/" id="logo"></a>
			<div id="header-content">
				<nav id="main-nav">
					<ul class="clearfix">
						<li>
							<a href="${shoppingCartUrl}" rel="nofollow">Seu carrinho (${shoppingCart.quantity})</a>
						</li>
						<li>
							<a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre nós</a>
						</li>
						<li>
							<a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
	<nav class="categories-nav">
		<ul class="container">
			<li class="category">
				<a href="http://www.casadocodigo.com.br">Home</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-agile">Agile</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-front-end">Front End</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-games">Games</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-java">Java</a>
			</li>
			<li class="category">
				<a href="/collections/livros-de-mobile">Mobile</a>
			</li>
			<li class="category">
				<a href="/collections/livros-desenvolvimento-web">Web</a>
			</li>
			<li class="category">
				<a href="/collections/outros">Outros</a>
			</li>
		</ul>
	</nav>
<h1>Lista de Livros</h1>
<body>

	${Sucesso}

	<table style="width: 100%" border="2">
		<tr>
			
			<th>Titulo</th>
			<th>Descriçao</th>
			<th>Páginas</th>
			<th>Data de Lançamento</th>
			<th>Endereço</th>
			<th>EBOOK</th>
			<th>PRINTED</th>
			<th>COMBO</th>
			<th>Detalhes</th>
			<th>Excluir</th>
			
		</tr>

		<c:forEach items="${products}" var="product" varStatus="status">
			<tr>
				
				<td>${product.title}</td>
				<td>${product.descricao}</td>
				<td>${product.paginas}</td>
				<td> <fmt:formatDate pattern="dd/MM/yyyy" value="${product.releaseDate.time}"/> </td>
				<td>${product.summaryPath}</td>
				
				<c:forEach items="${product.prices}" var="price">
					<td>${price.value}</td>
				</c:forEach>
				
				<td> <c:url value="/products/${product.id}" var="linkDetalhar"/> 
				<a href="${linkDetalhar}"> Detalhar</a>
				</td>
			<%-- 	
				<td> <c:url value="/products/${product.id}" var="linkExcluir"/> 
				<a href="${linkExcluir}"> Excluir</a>
				</td> --%>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>