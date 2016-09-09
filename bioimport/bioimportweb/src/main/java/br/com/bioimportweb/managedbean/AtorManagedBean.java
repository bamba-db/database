package br.com.bioimportweb.managedbean;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.service.AtorService;
import br.com.bioimportejb.util.EncriptarMD5;
import br.com.bioimportweb.autenticacao.AuthenticationService;
import br.com.bioimportweb.util.Util;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
    
@ManagedBean(name="atorMB")
@ViewScoped
public class AtorManagedBean implements Serializable {  
    
	private static final long serialVersionUID = 1L;
	private Ator ator = new Ator();
	
	@EJB
	private AtorService atorBean;
	@ManagedProperty(value = "#{authenticationService}")
	private AuthenticationService authenticationService;
	
	
	private String sufixoEmail;
	
	private Integer quantidadeDigitos;
	
	@PostConstruct
	public void carregarTela() {
		ator = Util.pegarAtor();
		if(ator == null){
			ator = new Ator();
		}
	}

	/**
	 * Responsavel por salvar o ator
	 * @return
	 */
    public String salvaraAtor(){
    	String senha;
    	try {
    		//guarda a senha nao encriptada para logar no sistema(authentication encriptara a senha)
    		senha = ator.getSenha();
    		
    		//salva o usuario com a senha encriptada
    		ator.setSenha(EncriptarMD5.encriptar(ator.getSenha()));
			atorBean.inserirAtor(ator);
		} catch (ExcecaoGenerica e) {
			FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "Erro na persistencia");  
	        FacesContext.getCurrentInstance().addMessage(null, msg);
	        return null;
		}
    	
    	//Autentica o usuario (coloca o usuario que acabou de criar logado no sistema)
		Ator atorLogado = authenticationService.login(ator.getLogin(), senha);
   		if (atorLogado == null) {
   			FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Erro", "Login ou Senha inválidos");  
	        FacesContext.getCurrentInstance().addMessage("mensagemFalhaLogin", msg);
	        return null;
   	    }

   		Util.montaMensagemFlashRedirect("Cadastro realizado com sucesso !","Sucesso!");
		return "home";
    }
    
    /**
     * Metodo respons�vel pela edi��o do ator
     * @return
     */
	public String editarAtor(){
    	
    	try {
			atorBean.alterarAtor(ator);
		} catch (ExcecaoGenerica e) {
			FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "Erro na persistencia");  
	        FacesContext.getCurrentInstance().addMessage("mensagemFalhaLogin", msg);
	        return null;
		}
		
    	Util.montaMensagemFlashRedirect("Alteração realizada com sucesso !","Sucesso!");
    	
    	return "home";
    }

    /**
     * Metodo responsavel por enviar um email ao login que esqueceu a senha
     * @return
     */
    public String esqueciMinhaSenhaNovoCodigo(){
    	
		try {
			boolean existe = atorBean.verificarExistenciaLogin(ator.getLogin(), null);
			if( ! existe){
				FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR,"Login inválido", "Login inválido");  
		        FacesContext.getCurrentInstance().addMessage("mensagemFalhaLogin", msg);
		        return null;
			}
		} catch (ExcecaoGenerica e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	Util.montaMensagemFlashRedirect("O e-mail foi enviado com sucesso !","Sucesso!");
    	return "alterarSenha";
    }
    
    
	public void setAuthenticationService(AuthenticationService authenticationService) {
	    this.authenticationService = authenticationService;
	}
    
	public Ator getAtor() {
		return ator;
	}
	public void setAtor(Ator ator) {
		this.ator = ator;
	}

	public String getSufixoEmail() {
		return sufixoEmail;
	}

	public void setSufixoEmail(String sufixoEmail) {
		this.sufixoEmail = sufixoEmail;
	}

	public Integer getQuantidadeDigitos() {
		return quantidadeDigitos;
	}

	public void setQuantidadeDigitos(Integer quantidadeDigitos) {
		this.quantidadeDigitos = quantidadeDigitos;
	}
}  