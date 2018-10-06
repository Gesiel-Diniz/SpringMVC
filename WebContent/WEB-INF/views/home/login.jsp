<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<h2>Login</h2>
	<form action="/treinaweb-spring-mvc/login" method="post">

		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Nome de usuário<br/>
					<input type="text" name="username" class="form-control" id="username" />
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					Senha<br/>
					<input type="password" name="password" class="form-control" id="password" />
				</div>
			</div>
		</div>
		
		<button type="submit" class="btn btn-success">Login</button>		
	
	</form>
