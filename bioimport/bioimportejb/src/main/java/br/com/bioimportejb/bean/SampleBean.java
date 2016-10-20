//package br.com.bioimportejb.bean;
//
//import java.io.Serializable;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.annotation.PostConstruct;
//import javax.ejb.Stateless;
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//
//import org.gbif.api.vocabulary.DatasetType;
//
//import br.com.bioimportejb.dao.SampleDAO;
//import br.com.bioimportejb.entidades.Occurrence;
//import br.com.bioimportejb.entidades.Sample;
//import br.com.bioimportejb.exception.ExcecaoIntegracao;
//import br.com.bioimportejb.util.FiltroSampleVO;
//import br.com.daofabrica.excecoes.ExcecaoGenerica;
//import br.com.daofabrica.fabrica.DAOFabrica;
//import br.com.daofabrica.fabrica.DAOFabricaImpl;
//
//@Stateless
//public class SampleBean implements Serializable {
//
//	private static final long serialVersionUID = -813410451887480286L;
//
//	@PersistenceContext(unitName="bioimportejb")
//	private EntityManager em;
//	
//	private DAOFabrica daoFabrica;
//	
//	@PostConstruct
//	public void instanciarFabrica() {
//		daoFabrica = new DAOFabricaImpl(em);
//	}
//	
//	private SampleDAO getSampleDAO() throws ExcecaoGenerica {
//		return (SampleDAO) daoFabrica.getDAO(Sample.class);
//	}
//	
//	public List<Sample> salvar(List<Sample> lista) throws ExcecaoIntegracao {
//		try {
//			List<Sample> samplesGravados = new ArrayList<Sample>();
//			for(Sample s : lista) {
//				for(Occurrence f: s.getOccurrences()) {
//					f.setSample(s);
//				}
//				samplesGravados.add(getSampleDAO().mesclar(s));
//			}
//			return samplesGravados;
//		} catch (ExcecaoGenerica e) {
//			throw new ExcecaoIntegracao(e);
//		}
//	}
//
//	public List<Sample> listarSamples(FiltroSampleVO filtro) throws ExcecaoIntegracao {
//		try {
//			return getSampleDAO().listarTodos(filtro);
//		} catch (Exception e) {
//			throw new ExcecaoIntegracao(e);
//		}
//	}
//	
//	public List<Sample> listarSamplesOcorrencia() throws ExcecaoIntegracao {
//		try {
//			return getSampleDAO().listarSamplesOcorrencia(DatasetType.OCCURRENCE.name());
//		} catch (Exception e) {
//			throw new ExcecaoIntegracao(e);
//		}
//	}
//
//	public List<Sample> listarSamplesEvent() throws ExcecaoIntegracao {
//		try {
//			List<Sample> lista = getSampleDAO().listarSamplesEvent(DatasetType.SAMPLING_EVENT.name());
//			
//			return lista;
//		} catch (Exception e) {
//			throw new ExcecaoIntegracao(e);
//		}
//	}
//	
//	public Sample buscarPorId(Long id) throws ExcecaoIntegracao {
//		try {
//			return getSampleDAO().buscarPorId(id);
//		} catch (ExcecaoGenerica e) {
//			throw new ExcecaoIntegracao(e);
//		}
//	}
//
//	public Sample salvar(Sample sample) throws ExcecaoIntegracao {
//		try {
//			return getSampleDAO().mesclar(sample);
//		} catch (ExcecaoGenerica e) {
//			throw new ExcecaoIntegracao(e);
//		}
//	}
//
//	
//}
