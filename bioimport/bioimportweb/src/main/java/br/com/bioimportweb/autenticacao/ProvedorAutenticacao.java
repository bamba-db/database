package br.com.bioimportweb.autenticacao;


import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.service.ProvedorAutenticacaoService;
import br.com.bioimportejb.util.EncriptarMD5;
import br.com.bioimportweb.managedbean.SessaoManagedBean;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public class ProvedorAutenticacao implements AuthenticationProvider{
	
	private Logger log = LoggerFactory.getLogger(getClass());

//	@EJB
	private ProvedorAutenticacaoService provedorAutenticacaoService;
	
	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		log.info("*******************Autenticação********************");
		
		Ator ator = null;
		try {
			provedorAutenticacaoService = (ProvedorAutenticacaoService) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/ProvedorAutenticacaoBean");
			
			ator = provedorAutenticacaoService.buscarAtorPorLoginESenha(authentication.getName(), EncriptarMD5.encriptar(authentication.getCredentials().toString()));
			
		} catch (ExcecaoGenerica e) {
			log.error(e.getMessage(), e);
		} catch (NamingException e) {
			log.error(e.getMessage(), e);
		}
	
		if(ator == null){
			throw new UsernameNotFoundException("Usuário não encontrado!");
		}
		
		
		
		Autenticacao autenticacao = null;
		
		autenticacao = new Autenticacao("ROLE_USER", authentication);
		
		autenticacao.setAtor(ator);
		autenticacao.setAuthenticated(true);
		
		SessaoManagedBean sessaoManagedBean = new SessaoManagedBean();
		sessaoManagedBean.setAtor(ator);
		
		return autenticacao;
	}

	@Override
	public boolean supports(Class<? extends Object> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
}
