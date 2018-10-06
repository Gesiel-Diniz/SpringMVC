package br.com.treinaweb.gesiel.dominios;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "usuarios")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="username", length = 50, nullable = false)
	@Size(min=3, max=15, message="O nome de usuário deve conter entre 3 e 50 caracteres!")
	@NotEmpty(message="O nome de usuário é obrigatório!")
	private String username;
	
	@Column(name="password", length = 150, nullable = false)
	@NotEmpty(message="A senha é obrigatório!")
	private String password;
	
	@NotEmpty(message="O perfil é obrigatório!")
	@Column(name="role", length = 20, nullable = false)
	private String role;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
