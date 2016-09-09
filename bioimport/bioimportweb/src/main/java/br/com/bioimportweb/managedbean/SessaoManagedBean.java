package br.com.bioimportweb.managedbean;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportweb.util.Util;
    
@ManagedBean(name="sessaoMB")
@SessionScoped
public class SessaoManagedBean implements Serializable {  
      
	private static final long serialVersionUID = 1L;
	private Ator ator;
	
	public Ator getAtor() {
		if(null == ator){
    		ator = Util.pegarAtor();
    	}
		return ator;
	}
	public void setAtor(Ator ator) {
		this.ator = ator;
	}
	
}  