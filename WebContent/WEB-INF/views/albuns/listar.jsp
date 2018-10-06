<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>Lista de álbuns</h2>
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


<table id="tbl-albuns" class="table table-hover table-striped table-bordered">
	<thead>
		<tr>
			<th>ID</th>
			<th>NOME DO ÁLBUM</th>
			<th>ANO DO LANÇAMENTO</th>
			<th>AÇÕES</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty albuns}">
			<c:forEach items="${albuns}" var="album">
				<tr>
					<td>${album.id}</td>
					<td>${album.nome}</td>
					<td>${album.anoDeLancamento}</td>
					<td>
						<div class="badge badge-secondary" style="cursor: pointer;" onclick="window.location.href='/treinaweb-spring-mvc/albuns/alterar/${album.id}'">Alterar</div> 
						<div class="badge badge-danger" style="cursor: pointer;" onclick="window.location.href='/treinaweb-spring-mvc/albuns/excluir/${album.id}'">Excluir</div>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<script type="text/javascript">

$(document).ready(function(){

	$("#btn-pesquisar").click(function(){
		
		var nomeAlbum = $("#txt-pesquisa").val();

		$.ajax({
			method: 'GET',
			url: '/treinaweb-spring-mvc/albuns/porNome?nome='+nomeAlbum,
			success: function(data){
				
				$("#tbl-albuns tbody tr").remove();
				
				$.each(data, function(index, album){
				
					$("#tbl-albuns tbody").append('<tr>'+
													'<td>'+album.id+'</td>'+
													'<td>'+album.nome+'</td>'+
													'<td>'+album.anoDeLancamento+'</td>'+
													'<td>'+
														'<div class="badge badge-secondary" style="cursor: pointer;" onclick="window.location.href=\"/treinaweb-spring-mvc/albuns/alterar/'+album.id+'\"">Alterar</div> '+
														'<div class="badge badge-danger" style="cursor: pointer;" onclick="window.location.href=\"/treinaweb-spring-mvc/albuns/excluir/'+album.id+'\"">Excluir</div>'+
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