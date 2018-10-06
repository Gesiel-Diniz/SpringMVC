package br.com.treinaweb.gesiel.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hello")
public class HelloController {
	
	
	@RequestMapping("/receberMensagem2")
	public String receberMensagem2(Model model, @RequestParam(value="mensagem", required = false, defaultValue="Mensagem Padrão") String mens){
		
		model.addAttribute("mensagem", mens);
		
		return "mensagemServidor";
		
	}
	
	
	@RequestMapping("/receberMensagem/{mensagem}")
	public String receberMensagem(Model model, @PathVariable("mensagem") String mens){
		
		model.addAttribute("mensagem", mens);
		
		return "mensagemServidor";
		
	}
	
	
	@RequestMapping("/message")
	public String message(){
		
		return "control/hello";
		
	}
	
	@RequestMapping("/mensagemServidor")
	public String mensagenServidor(Model model){
		
		Calendar data = Calendar.getInstance();   
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        String h=format.format(data.getTime());
		
		model.addAttribute("mensagem", h);
		
		return "mensagemServidor";
		
	}
	
	
	@RequestMapping("/mensagemServidor2")
	public ModelAndView mensagemServidor2(){
		
		return new ModelAndView("mensagemServidor", "mensagem", new Date().toString());
		
	}
	
	
}