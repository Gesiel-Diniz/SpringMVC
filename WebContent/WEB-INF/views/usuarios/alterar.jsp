<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<c:url var="actionAdicionar" value="/usuarios/alterar" />
	<h2>Alterar usuário</h2>
	<form:form action="${actionAdicionar}" method="post" modelAttribute="usuario">

		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Nome de usuário<br/>
					<form:input path="username" class="form-control" id="username" />
					<div class="text-danger" style="font-size: 11px;"><form:errors path="username"></form:errors></div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Senha<br/>
					<form:password path="password" class="form-control" placeholder="*************" id="password" />
					<div class="text-danger" style="font-size: 11px;"><form:errors path="password"></form:errors></div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Perfil<br/>
					<form:select path="role" cssClass="form-control" >
						<form:option value="">Selecione</form:option>
						<form:option value="ROLE_ADMIN">Administrador</form:option>
						<form:option value="ROLE_USER">Usuário comum</form:option>
					</form:select>
					<div class="text-danger" style="font-size: 11px;"><form:errors path="role"></form:errors></div>
				</div>
			</div>
		</div>
		<form:hidden path="id"/>
		<button type="submit" class="btn btn-success">Salvar</button>		
	
	</form:form>

