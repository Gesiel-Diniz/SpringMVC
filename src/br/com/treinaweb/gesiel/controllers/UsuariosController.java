package br.com.treinaweb.gesiel.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.treinaweb.gesiel.dominios.Usuario;
import br.com.treinaweb.gesiel.repositorios.RepositorioUsuario;

@Controller
@RequestMapping("/usuarios")
public class UsuariosController {
	
	@Autowired
	private RepositorioUsuario repositorioUsuario;
	
	@RequestMapping(value="/listar", method=RequestMethod.GET)
	public String lista(Model model){
		
		List<Usuario> usuarios = repositorioUsuario.findAll();
		model.addAttribute("usuarios", usuarios);
		
		return "usuario.listar.tiles";
	}
	
	@RequestMapping(value="/adicionar", method=RequestMethod.GET)
	public String adicionar(Model model){
		
		model.addAttribute("usuario", new Usuario());
		return "usuario.adicionar.tiles";
		
	}
	
	@RequestMapping(value="/adicionar", method=RequestMethod.POST)
	public String adicionar(@ModelAttribute("usuario") @Valid Usuario novoUsuario, BindingResult result){
		
		if(result.hasErrors()){
			return "usuario.adicionar.tiles";
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); 
		novoUsuario.setPassword(encoder.encode(novoUsuario.getPassword()));
		
		repositorioUsuario.save(novoUsuario);
		return "redirect:/usuarios/listar";
		
	}
	
	@RequestMapping(value="/alterar/{id}", method=RequestMethod.GET)
	public String alterar(@PathVariable("id") Long id , Model model){
		
		Usuario usuarioASerAlterado = repositorioUsuario.findOne(id);
		model.addAttribute("usuario", usuarioASerAlterado);

		return "usuario.alterar.tiles";
		
	}
	
	@RequestMapping(value="/alterar", method=RequestMethod.POST)
	public String alterar(@ModelAttribute("usuario") @Valid Usuario usuarioAlterado, BindingResult result){

		if(result.hasFieldErrors("username") || result.hasFieldErrors("role")){
			return "usuario.alterar.tiles";
		}
		
		if(result.hasFieldErrors("senha")){

			Usuario usuario = repositorioUsuario.findOne(usuarioAlterado.getId());
			usuarioAlterado.setPassword(usuario.getPassword());
			
		}else{
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); 
			usuarioAlterado.setPassword(encoder.encode(usuarioAlterado.getPassword()));
			
		}
		

		repositorioUsuario.save(usuarioAlterado);
		return "redirect:/usuarios/listar";
		
	}
	
	@RequestMapping(value="/excluir/{id}", method=RequestMethod.GET)
	public String escluir(@PathVariable("id") Long id){
		
		Usuario usuario = repositorioUsuario.findOne(id);

		repositorioUsuario.delete(usuario);
		return "redirect:/usuarios/listar";
		
	}

}
