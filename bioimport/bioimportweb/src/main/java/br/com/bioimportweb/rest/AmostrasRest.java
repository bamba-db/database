//package br.com.bioimportweb.rest;
//
//import java.io.Serializable;
//import java.math.BigDecimal;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import javax.enterprise.context.RequestScoped;
//import javax.inject.Inject;
//import javax.inject.Named;
//import javax.ws.rs.GET;
//import javax.ws.rs.Path;
//import javax.ws.rs.Produces;
//import javax.ws.rs.QueryParam;
//import javax.ws.rs.core.MediaType;
//
//import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import br.com.bioimportejb.bean.SampleBean;
//import br.com.bioimportejb.entidades.Sample;
//import br.com.bioimportejb.exception.ExcecaoIntegracao;
//import br.com.bioimportejb.util.FiltroSampleVO;
//
//@Path("/amostras/")
//@Named
//@RequestScoped
//public class AmostrasRest implements Serializable {
//	
//	private static final long serialVersionUID = 1L;
//
//	@Inject
//	private SampleBean amostraBean;
//	
//	private Logger log = LoggerFactory.getLogger(AmostrasRest.class);
//	
//	@GET
//	@Produces( { MediaType.APPLICATION_JSON })
//	 public List<Sample> procurarAmostra(
//			 @QueryParam("id") String id, 
//			 @QueryParam("depth") String depth, 
//			 @QueryParam("dt") String dt,
//			 @QueryParam("latitude") String latitude,
//			 @QueryParam("longitude") String longitude
//			 ) throws ExcecaoIntegracao {
//		 
//		try {
//			List<Sample> lista = new ArrayList<Sample>();
//			
//			FiltroSampleVO filtro = new FiltroSampleVO();
//			if(StringUtils.isNotEmpty(id)) {
//				filtro.setId(Long.valueOf(id));
//			}
//			
//			if(StringUtils.isNotEmpty(depth)) {
//				filtro.setDepth(new BigDecimal(depth));
//			}
//			
//			if(StringUtils.isNotEmpty(dt)) {
//				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//				Date data = sdf.parse(dt);
//				filtro.setDt(data);
//			}
//
//			if(StringUtils.isNotEmpty(latitude)) {
//				filtro.setLatitude(new BigDecimal(latitude));
//			}
//			
//			if(StringUtils.isNotEmpty(longitude)) {
//				filtro.setLongitude(new BigDecimal(longitude));
//			}
//			
//			lista = amostraBean.listarSamples(filtro);
//			return lista;
//		} catch (NumberFormatException e) {
//			log.error(e.getMessage(), e);
//			return null;
//		} catch (ParseException e) {
//			log.error(e.getMessage(), e);
//			return null;
//		}
//	 }
//
//	
//}
