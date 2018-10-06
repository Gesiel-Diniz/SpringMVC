<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">TreinaWeb Spring MVC</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user"/>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Álbuns
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/treinaweb-spring-mvc/albuns/listar">Listar</a>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a class="dropdown-item" href="/treinaweb-spring-mvc/albuns/adicionar">Adicionar</a>
	          </sec:authorize>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Músicas
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/treinaweb-spring-mvc/musicas/listar">Listar</a>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a class="dropdown-item" href="/treinaweb-spring-mvc/musicas/adicionar">Adicionar</a>
	          </sec:authorize>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Usuários
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/treinaweb-spring-mvc/usuarios/listar">Listar</a>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a class="dropdown-item" href="/treinaweb-spring-mvc/usuarios/adicionar">Adicionar</a>
	          </sec:authorize>
	        </div>
	      </li>
	    </ul>
	  </div>
	  <div class="form-inline my-2 my-lg-0">
	  <ul class="navbar-nav mr-auto">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         ${user.username}
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	         <a class="dropdown-item" href="/treinaweb-spring-mvc/logout">Sair</a>
	        </div>
	      </li>
	  </ul>
	  </div>
  </sec:authorize>
</nav>