package br.com.bioimportweb.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import br.com.bioimportejb.bean.SampleBean;
import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Path("/amostras/")
@Named
@RequestScoped
public class AmostrasRest {
	
	@Inject
	private SampleBean amostraBean;
	
	@GET
	@Produces( { MediaType.APPLICATION_JSON })
	 public List<Sample> procurarAmostra() throws ExcecaoIntegracao {
		List<Sample> lista = new ArrayList<Sample>();
		lista = amostraBean.listarSamples();
		ObjectMapper m = new ObjectMapper();
		String writeValueAsString = null;
		try {
			writeValueAsString = m.writeValueAsString(lista);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(writeValueAsString);
		return lista;
	 }

	
}
