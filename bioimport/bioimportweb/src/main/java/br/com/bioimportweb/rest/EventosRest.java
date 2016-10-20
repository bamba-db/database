package br.com.bioimportweb.rest;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.bioimportejb.bean.interfaces.EventoLocal;
import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroEventoVO;

@Path("/eventos/")
@Named
@RequestScoped
public class EventosRest implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Inject
	private EventoLocal eventoLocal;
	
	private Logger log = LoggerFactory.getLogger(EventosRest.class);
	
	@GET
	@Produces( { MediaType.APPLICATION_JSON })
	 public List<Evento> procurarEvento(
			 @QueryParam("idEvento") String idEvento, 
			 @QueryParam("decimalLatitude") String decimalLatitude, 
			 @QueryParam("decimalLongitude") String decimalLongitude,
			 @QueryParam("eventDate") String eventDate,
			 @QueryParam("depth") String depth
			 ) throws ExcecaoIntegracao {
		 
		try {
			List<Evento> lista = new ArrayList<Evento>();
			
			FiltroEventoVO filtro = new FiltroEventoVO();
			if(StringUtils.isNotEmpty(idEvento)) {
				filtro.setIdEvento(Long.valueOf(idEvento));
			}
			
			if(StringUtils.isNotEmpty(decimalLatitude)) {
				filtro.setDecimalLatitude(new BigDecimal(decimalLatitude));
			}
			
			if(StringUtils.isNotEmpty(decimalLongitude)) {
				filtro.setDecimalLongitude(new BigDecimal(decimalLongitude));
			}
			
			if(StringUtils.isNotEmpty(depth)) {
				filtro.setDepth(new BigDecimal(depth));
			}
			
			if(StringUtils.isNotEmpty(eventDate)) {
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date data = sdf.parse(eventDate);
				Calendar c = Calendar.getInstance();
				c.setTime(data);
				filtro.setEventDate(c);
			}
			
			lista = eventoLocal.listarEventos(filtro);
			return lista;
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
			return null;
		} catch (ParseException e) {
			log.error(e.getMessage(), e);
			return null;
		}
	 }

	
}
