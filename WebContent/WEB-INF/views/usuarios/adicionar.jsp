<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


	<c:url var="actionAdicionar" value="/usuarios/adicionar" />
	<h2>Adição de usuário</h2>
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
					<form:password path="password" class="form-control" id="password" />
					<div class="text-danger" style="font-size: 11px;"><form:errors path="password"></form:errors></div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Perfil<br/>
					<select name="role" class="form-control" >
						<option value="">Selecione</option>
						<option value="ROLE_ADMIN">Administrador</option>
						<option value="ROLE_USER">Usuário comum</option>
					</select>
					<div class="text-danger" style="font-size: 11px;"><form:errors path="role"></form:errors></div>
				</div>
			</div>
		</div>
		
		<button type="submit" class="btn btn-success">Salvar</button>		
	
	</form:form>
