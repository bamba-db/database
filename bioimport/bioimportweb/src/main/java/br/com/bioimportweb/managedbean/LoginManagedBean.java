package br.com.bioimportweb.managedbean;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportweb.autenticacao.AuthenticationService;
import br.com.bioimportweb.util.Util;
    
@ManagedBean(name="loginMB")
@ViewScoped
public class LoginManagedBean implements Serializable {  
      
	private static final long serialVersionUID = 1L;
	private Ator ator; 
	private String username;
	private String password;
	
	@ManagedProperty(value="#{sessaoMB}")
	private SessaoManagedBean sessaoMB;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@ManagedProperty(value = "#{authenticationService}")
	private AuthenticationService authenticationService;
	
      
    @PostConstruct
    public void iniciar(){
        ator = Util.pegarAtor();
    }
    

    public String login(){
    	ator = authenticationService.login(username, password);
   		if (ator == null) {
   			FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR,"Login ou Senha inválidos.", "Login ou Senha inválidos.");  
	        FacesContext.getCurrentInstance().addMessage("messages", msg);
   	    }
		sessaoMB.setAtor(ator);
		
   	    return "home";
    }
    
    public String logout() {
    	SecurityContextHolder.getContext().setAuthentication(null);
    	invalidateSession();
    	return "home";
    }
    
    private void invalidateSession() {
    	FacesContext fc = FacesContext.getCurrentInstance ();
    	HttpSession session = (HttpSession) fc.getExternalContext().getSession(false);
    	session.invalidate();
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
    
	public void setAuthenticationService(AuthenticationService authenticationService) {
	    this.authenticationService = authenticationService;
	}

	public Ator getAtor() {
		return ator;
	}
	public void setAtor(Ator ator) {
		this.ator = ator;
	}


	public SessaoManagedBean getSessaoMB() {
		return sessaoMB;
	}


	public void setSessaoMB(SessaoManagedBean sessaoMB) {
		this.sessaoMB = sessaoMB;
	}
	
	
}  