package br.com.bioimportejb.bean;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.OccurrenceLocal;
import br.com.bioimportejb.dao.OccurrenceDAO;
import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroOccurrenceVO;
import br.com.bioimportejb.util.OccurrenceVO;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;
import br.com.bioimportejb.daofabrica.fabrica.DAOFabrica;
import br.com.bioimportejb.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class OccurrenceBean implements OccurrenceLocal {

	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public OccurrenceDAO getOccurrenceDAO() throws ExcecaoGenerica {
		return (OccurrenceDAO) daoFabrica.getDAO(Occurrence.class);
	}
	
	@Override
	public Occurrence salvarOccurrence(Occurrence o) throws ExcecaoIntegracao {
		try {
			if(o.getId() == null) {
				return getOccurrenceDAO().salvar(o);
			} else {
				return getOccurrenceDAO().mesclar(o);
			}
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	@Override
	public List<OccurrenceVO> listarOccurrences(FiltroOccurrenceVO filtro) throws ExcecaoIntegracao {
		try {
			return getOccurrenceDAO().listarOccurrence(filtro);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

}
