<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h2>Lista de músicas</h2>
<div class="row">
	<div class="col-md-4">
		<div class="form-group">
			<div class="input-group">
				<input class="form-control" id="txt-pesquisa" type="text">
				<div class="input-group-append">
					<div id="btn-pesquisar" style="cursor:pointer;" class="input-group-text">Pesquisar</div>
				</div>
			</div>
		</div>
	</div>
</div>
<table id="tbl-musicas" class="table table-hover table-striped table-bordered">
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
<script type="text/javascript">

$(document).ready(function(){

	$("#btn-pesquisar").click(function(){
		
		var nomeMusica = $("#txt-pesquisa").val();

		$.ajax({
			method: 'GET',
			url: '/treinaweb-spring-mvc/musicas/porNome?nome='+nomeMusica,
			success: function(data){

				$("#tbl-musicas tbody tr").remove();
				
				$.each(data, function(index, musica){

					var arr = musica.dataCriacao.split("-");
				
					$("#tbl-musicas tbody").append('<tr>'+
													'<td>'+musica.id+'</td>'+
													'<td>'+musica.nome+'</td>'+
													'<td>'+musica.album.nome+'</td>'+
													'<td>'+arr[2]+"/"+arr[1]+"/"+arr[0]+'</td>'+
													'<td>'+
														'<div class="badge badge-secondary" style="cursor: pointer;" onclick="window.location.href=\'/treinaweb-spring-mvc/musicas/alterar/'+musica.id+'\'">Alterar</div> '+
														'<div class="badge badge-danger" style="cursor: pointer;" onclick="window.location.href=\'/treinaweb-spring-mvc/musicas/excluir/'+musica.id+'\'">Excluir</div>'+
													'</td>'+
													'</tr>');
	
					});
				
			},
			error: function(){
				alert("Houve um erro na requisição.");
			}
			
		});
		
	});
	
});




</script>