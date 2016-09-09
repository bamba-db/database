package br.com.bioimportweb.util;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.context.Flash;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportweb.autenticacao.Autenticacao;

public class Util {
	
	public static Ator pegarAtor() {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();  
	        if(authentication instanceof Autenticacao){
	        	Autenticacao autenticacao = (Autenticacao) authentication;
	        	return autenticacao.getAtor();
	        }
	        return null;
	}
	

	 /**
    * Adiciona a mensagem de INFO para ser exibida, quando nao trocamos de tela
    * @param mensagem
    * @param titulo
   */
	public static void montaMensagemSemFlashRedirect(String mensagem, String titulo) {
			
		// MENSAGEM REDIRECIONADA PARA SER EXIBIDA EM OUTRA PAGINA
		FacesContext facesContext = FacesContext.getCurrentInstance();
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO , mensagem, titulo);
		facesContext.addMessage("mensagem", message);
	}
	 
	 /**
    * Adiciona a mensagem de ERROR para ser exibida, quando nao trocamos de tela
    * @param mensagem
    * @param titulo
    */
	 public static void montaMensagemErroSemFlashRedirect(String mensagem, String titulo) {
	
		// MENSAGEM PARA SER EXIBIDA NA MESMA PAGINA
		FacesContext facesContext = FacesContext.getCurrentInstance();
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR , mensagem, titulo);
		facesContext.addMessage("mensagem", message);
	}
	 
	/**
    * Adiciona a mensagem de INFO para ser exibida, quando trocamos de tela
    * @param mensagem
    * @param titulo
    */
	 public static void montaMensagemFlashRedirect(String mensagem, String titulo) {
	
		// MENSAGEM REDIRECIONADA PARA SER EXIBIDA EM OUTRA PAGINA
		FacesContext facesContext = FacesContext.getCurrentInstance();
		Flash flash = facesContext.getExternalContext().getFlash();
//		flash.setRedirect(true);
		flash.setKeepMessages(true);
		
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO , mensagem, titulo);
		facesContext.addMessage("mensagem", message);
	}
	 
/**
    * Adiciona a mensagem de ERROR para ser exibida, quando trocamos de tela
    * @param mensagem
    * @param titulo
    */
	 public static void montaMensagemFlashRedirectErro(String mensagem, String titulo) {
	
		// MENSAGEM REDIRECIONADA PARA SER EXIBIDA EM OUTRA PAGINA
		FacesContext facesContext = FacesContext.getCurrentInstance();
		Flash flash = facesContext.getExternalContext().getFlash();
//			flash.setRedirect(true);
		flash.setKeepMessages(true);
		
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR , mensagem, titulo);
		facesContext.addMessage("mensagem", message);
	}
	 
	public static <T> T recuperarManagedBean(String beanName) {
		
		FacesContext context = FacesContext.getCurrentInstance();
		  T bean = (T) context.getELContext().getELResolver().getValue(context.getELContext(), null, beanName);
		 return bean;
	}

		
	public static boolean isPostback() {
	    return FacesContext.getCurrentInstance().isPostback();
	}
	
	public static void validationFailed() {
	    FacesContext.getCurrentInstance().validationFailed();
	}
	
	public static HttpServletRequest getRequest() {
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		return request;
	}
	
	public static HttpSession getSession() {
		return (HttpSession) getRequest().getSession();
	}
	
}

