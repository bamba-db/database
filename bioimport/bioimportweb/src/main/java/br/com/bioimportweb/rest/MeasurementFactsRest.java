package br.com.bioimportweb.rest;

import java.io.Serializable;
import java.util.ArrayList;
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

import br.com.bioimportejb.bean.interfaces.MeasurementFactsLocal;
import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroMeasurementFactsVO;

@Path("/measurements/")
@Named
@RequestScoped
public class MeasurementFactsRest implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Inject
	private MeasurementFactsLocal medidaLocal;
	
	private Logger log = LoggerFactory.getLogger(MeasurementFactsRest.class);
	
	@GET
	@Produces( { MediaType.APPLICATION_JSON })
	 public List<MeasurementFacts> procurarMeasurementFacts(
			 @QueryParam("idMeasurementFacts") String idMeasurementFacts, 
			 @QueryParam("measurementType") String measurementType, 
			 @QueryParam("measurementTypeID") String measurementTypeID,
			 @QueryParam("measurementUnit") String measurementUnit,
			 @QueryParam("measurementUnitID") String measurementUnitID,
			 @QueryParam("measurementValue") String measurementValue
			 ) throws ExcecaoIntegracao {
		 
		try {
			List<MeasurementFacts> lista = new ArrayList<MeasurementFacts>();
			
			FiltroMeasurementFactsVO filtro = new FiltroMeasurementFactsVO();
			if(StringUtils.isNotEmpty(idMeasurementFacts)) {
				filtro.setIdMeasurementFacts(Long.valueOf(idMeasurementFacts));
			}
			
			if(StringUtils.isNotEmpty(measurementType)) {
				filtro.setMeasurementType(measurementType);
			}
			
			if(StringUtils.isNotEmpty(measurementTypeID)) {
				filtro.setMeasurementTypeID(measurementTypeID);
			}
			
			if(StringUtils.isNotEmpty(measurementUnit)) {
				filtro.setMeasurementUnit(measurementUnit);
			}
			
			if(StringUtils.isNotEmpty(measurementUnitID)) {
				filtro.setMeasurementUnitID(measurementUnitID);
			}
			
			if(StringUtils.isNotEmpty(measurementValue)) {
				filtro.setMeasurementValue(measurementValue);
			}
			
			lista = medidaLocal.listarMeasurementFactss(filtro);
			return lista;
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
			return null;
		}
	 }

	
}
