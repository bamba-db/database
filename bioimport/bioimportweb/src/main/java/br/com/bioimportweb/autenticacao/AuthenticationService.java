package br.com.bioimportweb.autenticacao;

import java.io.Serializable;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import br.com.bioimportejb.entidades.Ator;

@Component
public class AuthenticationService implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
	@Qualifier("authenticationManager")
	private AuthenticationManager authenticationManager;

	public Ator login(String username, String password) {
		try {
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
			Autenticacao autenticacao = (Autenticacao) authenticationManager.authenticate(token);
			if (autenticacao.isAuthenticated()) {
			    SecurityContextHolder.getContext().setAuthentication(autenticacao);
			    return autenticacao.getAtor();
			}
		}catch (AuthenticationException e) {}
		return null;
	}

	public void logout() {
		SecurityContextHolder.getContext().setAuthentication(null);
		invalidateSession();
	}

	public User getAtorLogado() {
	    return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	private void invalidateSession() {
	    FacesContext fc = FacesContext.getCurrentInstance();
	    HttpSession session = (HttpSession) fc.getExternalContext().getSession(false);
	    session.invalidate();
	}

}

