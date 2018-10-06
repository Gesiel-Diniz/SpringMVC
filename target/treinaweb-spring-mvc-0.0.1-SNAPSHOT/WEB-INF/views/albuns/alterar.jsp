<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<c:url var="actionAlterar" value="/albuns/alterar" />
<h2>Alteração do álbum "${album.nome}"</h2>	
<form:form action="${actionAlterar}" method="post" modelAttribute="album">

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				Nome<br/>
				<form:input path="nome" class="form-control" placeholder="" id="nome" type="text" />
				<div class="text-danger" style="font-size: 11px;"><form:errors path="nome"></form:errors></div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				Ano de Lançamento<br/>
				<form:input path="anoDeLancamento" class="form-control" placeholder="" id="anoDeLancamento" type="text" />
				<div class="text-danger" style="font-size: 11px;"><form:errors path="anoDeLancamento"></form:errors></div>
			</div>
		</div>
	</div>
	<form:hidden path="id" />
	<button type="submit" class="btn btn-success">Salvar</button>
</form:form>
