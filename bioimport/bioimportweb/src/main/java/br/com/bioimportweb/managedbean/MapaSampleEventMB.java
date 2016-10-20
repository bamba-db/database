//package br.com.bioimportweb.managedbean;
//
//import java.io.Serializable;
//import java.text.SimpleDateFormat;
//import java.util.List;
//
//import javax.annotation.PostConstruct;
//import javax.ejb.EJB;
//import javax.faces.bean.ManagedBean;
//import javax.faces.bean.ViewScoped;
//import javax.faces.context.FacesContext;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;
//
//import br.com.bioimportejb.bean.SampleBean;
//import br.com.bioimportejb.entidades.Occurrence;
//import br.com.bioimportejb.entidades.GeospatialCoverage;
//import br.com.bioimportejb.entidades.Sample;
//import br.com.bioimportejb.exception.ExcecaoIntegracao;
//
//@ViewScoped
//@ManagedBean(name="mapaSampleEventMB")
//public class MapaSampleEventMB implements Serializable {
//
//	/**
//	 * 
//	 */
//	private static final long serialVersionUID = -5904601591548693570L;
//
//	private List<Sample> samples;
//	
//	@EJB
//	private SampleBean sampleBean;
//	
//	private Logger log = LoggerFactory.getLogger(getClass());
//
//	private JsonArray listaJson;
//	
//	private List<Occurrence> fishes;
//	
//	private Double latInicial;
//
//	private Double longInicial; 
//	
//	public JsonArray getListaJson() {
//		return listaJson;
//	}
//
//	public void setListaJson(JsonArray listaJson) {
//		this.listaJson = listaJson;
//	}
//
//	@PostConstruct
//	private void iniciar() throws ExcecaoIntegracao {
//		setSamples(sampleBean.listarSamplesEvent());
//		listaJson = new JsonArray();
//		for(Sample s : samples) {
//			for(GeospatialCoverage g : s.getDataSet().getGeographicCoverages()) {
//				JsonObject j = new JsonObject();
//				j.addProperty("index", samples.indexOf(s));
//				setLatInicial(g.getMaxLatitude());
//				setLongInicial(g.getMaxLongitude());
//				j.addProperty("latitude", g.getMaxLatitude());
//				j.addProperty("longitude", g.getMaxLongitude());
//				j.addProperty("depth", "");
//				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//				j.addProperty("data", sdf.format(s.getDt()));
//				JsonArray array = new JsonArray();
//				for(Occurrence f: s.getOccurrences()) {
//					JsonObject fo = new JsonObject();
//					fo.addProperty("family", f.getTaxon().getFamily());
//					fo.addProperty("genus", f.getTaxon().getGenus());
//					fo.addProperty("kingdom", f.getTaxon().getKingdom());
//					fo.addProperty("order", f.getTaxon().getOrder());
//					fo.addProperty("phylum", f.getTaxon().getPhylum());
//					fo.addProperty("scientificname", f.getTaxon().getScientificname());
//					fo.addProperty("species", f.getTaxon().getSpecies());
//					fo.addProperty("taxonrank", f.getTaxon().getTaxonrank());
//					array.add(fo);	
//				}
//				j.add("fishes", array);
//				
//				listaJson.add(j);
//			}
//		}
//		
//		log.info(""+listaJson.size());
//	}
//	
//	public void converterJsonParaFish() {
//		String index = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("index");
//		if (index != null && !"".equals(index)) {
//			Sample sample = samples.get(Integer.valueOf(index));
//			fishes = sample.getOccurrences();
//		}
//	}
//
//	public List<Sample> getSamples() {
//		return samples;
//	}
//
//	public void setSamples(List<Sample> samples) {
//		this.samples = samples;
//	}
//	
//	public List<Occurrence> getFishes() {
//		return fishes;
//	}
//
//	public void setFishes(List<Occurrence> fishes) {
//		this.fishes = fishes;
//	}
//
//	public Double getLatInicial() {
//		return latInicial;
//	}
//
//	public void setLatInicial(Double latInicial) {
//		this.latInicial = latInicial;
//	}
//
//	public Double getLongInicial() {
//		return longInicial;
//	}
//
//	public void setLongInicial(Double longInicial) {
//		this.longInicial = longInicial;
//	}
//	
//}
