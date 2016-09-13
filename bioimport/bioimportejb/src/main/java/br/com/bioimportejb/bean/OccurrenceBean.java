package br.com.bioimportejb.bean;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.OccurrenceLocal;
import br.com.bioimportejb.dao.OccurrenceDAO;
import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

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

}
