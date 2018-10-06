<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h2>Lista de músicas</h2>
<table class="table table-hover table-striped table-bordered">
	<thead>
		<tr>
			<th>ID</th>
			<th>NOME DA MÚSICA</th>
			<th>NOME DO ÁLBUM</th>
			<th>DATA DA CRIAÇÃO</th>
			<th>AÇÕES</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty musicas}">
			<c:forEach items="${musicas}" var="musica">
				<tr>
					<td>${musica.id}</td>
					<td>${musica.nome}</td>
					<td>${musica.album.nome}</td>
					<td>
						<fmt:formatDate value="${musica.dataCriacao}" pattern="dd/MM/yyyy" timeZone="UTC" />
					</td>
					<td>
						<div class="badge badge-secondary" style="cursor: pointer;" onclick="window.location.href='/treinaweb-spring-mvc/musicas/alterar/${musica.id}'">Alterar</div> 
						<div class="badge badge-danger" style="cursor: pointer;" onclick="window.location.href='/treinaweb-spring-mvc/musicas/excluir/${musica.id}'">Excluir</div>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>