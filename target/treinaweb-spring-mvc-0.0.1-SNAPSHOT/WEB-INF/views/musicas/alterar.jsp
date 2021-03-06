<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<c:url var="actionAlterar" value="/musicas/alterar" />
<h2>Altera��o de m�sica "${musica.nome}"</h2>	
<form:form action="${actionAlterar}" method="post" modelAttribute="musica">

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
					�lbum<br/>
					<form:select path="album.id" cssClass="form-control" >
						<option value="">Selecione</option>
						<form:options items="${albuns}" itemValue="id" itemLabel="nome" />
					</form:select>
					<div class="text-danger" style="font-size: 11px;"><form:errors path="album.id"></form:errors></div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Data da Cria��o<br/>
					<form:input path="dataCriacao" class="form-control" placeholder="" id="dataCriacao" type="text" />
					<div class="text-danger" style="font-size: 11px;"><form:errors path="dataCriacao"></form:errors></div>
				</div>
			</div>
		</div>
	<form:hidden path="id" />
	<button type="submit" class="btn btn-success">Salvar</button>
</form:form>
