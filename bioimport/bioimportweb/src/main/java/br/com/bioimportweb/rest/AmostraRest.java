package br.com.bioimportweb.rest;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.bioimportejb.bean.SampleBean;
import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Path("/amostra/{id}")
@Named
@RequestScoped
public class AmostraRest {
	
	@Inject
	private SampleBean amostraBean;
	
	@GET
	@Produces( { MediaType.APPLICATION_XML })
	 public List<Sample> procurarSample(@PathParam("id") Long id) throws ExcecaoIntegracao {
		List<Sample> lista = new ArrayList<Sample>();
		if(id != null) {
			Sample a = amostraBean.buscarPorId(id);
			lista.add(a);
		} else {
			lista = amostraBean.listarSamplesOcorrencia();
		}
		
		return lista;
	 }

	
}
