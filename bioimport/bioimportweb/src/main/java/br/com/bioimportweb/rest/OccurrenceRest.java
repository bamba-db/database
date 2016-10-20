package br.com.bioimportweb.rest;

import java.io.Serializable;
import java.math.BigDecimal;
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

import br.com.bioimportejb.bean.interfaces.OccurrenceLocal;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroOccurrenceVO;
import br.com.bioimportejb.util.OccurrenceVO;

@Path("/occurrences/")
@Named
@RequestScoped
public class OccurrenceRest implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Inject
	private OccurrenceLocal occurrenceLocal;
	
	private Logger log = LoggerFactory.getLogger(OccurrenceRest.class);
	
	@GET
	@Produces( { MediaType.APPLICATION_JSON })
	 public List<OccurrenceVO> procurarOccurrence(
			 @QueryParam("abundance") String abundance, 
			 @QueryParam("class") String class_, 
			 @QueryParam("family") String family,
			 @QueryParam("genus") String genus,
			 @QueryParam("id") String id,
			 @QueryParam("idTaxon") String idTaxon,
			 @QueryParam("infraspecificepithet") String infraspecificepithet,
			 @QueryParam("kingdom") String kingdom,
			 @QueryParam("order") String order,
			 @QueryParam("phylum") String phylum,
			 @QueryParam("scientificname") String scientificname,
			 @QueryParam("taxonkey") String taxonkey,
			 @QueryParam("taxonrank") String taxonrank,
			 @QueryParam("species") String species
			 
			 ) throws ExcecaoIntegracao {
		 
		try {
			List<OccurrenceVO> lista = new ArrayList<OccurrenceVO>();
			
			FiltroOccurrenceVO filtro = new FiltroOccurrenceVO();
			if(StringUtils.isNotEmpty(abundance)) {
				filtro.setAbundance(new BigDecimal(abundance));
			}
			
			if(StringUtils.isNotEmpty(class_)) {
				filtro.setClass_(class_);
			}
			
			if(StringUtils.isNotEmpty(family)) {
				filtro.setFamily(family);
			}
			
			if(StringUtils.isNotEmpty(genus)) {
				filtro.setGenus(genus);
			}
			
			if(StringUtils.isNotEmpty(id)) {
				filtro.setId(Long.valueOf(id));
			}
			
			if(StringUtils.isNotEmpty(idTaxon)) {
				filtro.setIdTaxon(Long.valueOf(idTaxon));
			}
			
			if(StringUtils.isNotEmpty(infraspecificepithet)) {
				filtro.setInfraspecificepithet(infraspecificepithet);
			}
			
			if(StringUtils.isNotEmpty(kingdom)) {
				filtro.setKingdom(kingdom);
			}
			
			if(StringUtils.isNotEmpty(order)) {
				filtro.setOrder(order);
			}
			
			if(StringUtils.isNotEmpty(phylum)) {
				filtro.setPhylum(phylum);
			}
			
			if(StringUtils.isNotEmpty(scientificname)) {
				filtro.setScientificname(scientificname);
			}
			
			if(StringUtils.isNotEmpty(taxonkey)) {
				filtro.setTaxonkey(taxonkey);
			}
			
			if(StringUtils.isNotEmpty(taxonrank)) {
				filtro.setTaxonrank(taxonrank);
			}
			
			if(StringUtils.isNotEmpty(species)) {
				filtro.setSpecies(species);
			}
			
			
			lista = occurrenceLocal.listarOccurrences(filtro);
			return lista;
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
			return null;
		}
	 }

	
}
