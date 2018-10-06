package br.com.treinaweb.gesiel.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.treinaweb.gesiel.dominios.Usuario;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long>{

	Usuario findByUsername(String username);
	
}
