<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>Lista de álbuns</h2>
<br>
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				Pesquisa Álbuns<br/>
				<input type="text" id="txt-pesquisa" class="form-control" />
			</div>
		</div>
		<div class="col-md-2">
		<br>
			<button class="btn btn-default" id="btn-pesquisar" >Pesquisar</button>
		</div>
	</div>

<table class="table table-hover table-striped table-bordered">
	<thead id="tbl-albuns">
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
			url: '/treinaweb-spring-mvc/albuns/porNome/'+nomeAlbum,
			success: function(data){

				$("#tbl-albuns tbody > tr").remove();
				$("#tbl-albuns tbody").append('<tr>'+
												'<td>'+data.id+'</td>'+
												'<td>'+data.nome+'</td>'+
												'<td>'+data.anoDeLancamento+'</td>'+
												'<td><div class="badge badge-secondary" style="cursor: pointer;" onclick="window.location.href=\"/treinaweb-spring-mvc/albuns/alterar/'+data.id+'}\"">Alterar</div> </td>'+
												'<td><div class="badge badge-danger" style="cursor: pointer;" onclick="window.location.href=\"/treinaweb-spring-mvc/albuns/excluir/'+data.id+'}\"">Alterar</div> </td>'+
												'</tr>');
				
			},
			error: function(){
				alert("Houve um erro na requisição.");
			}
			
		});
		
	});
	
});



</script>