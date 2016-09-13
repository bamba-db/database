package br.com.bioimportejb.bean;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.MeasurementFactsLocal;
import br.com.bioimportejb.dao.MeasurementFactsDAO;
import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class MeasurementFactsBean implements MeasurementFactsLocal{

	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public MeasurementFactsDAO getMeasurementFactsDAO() throws ExcecaoGenerica {
		return (MeasurementFactsDAO) daoFabrica.getDAO(MeasurementFacts.class);
	}
	
	@Override
	public MeasurementFacts salvarMedida(MeasurementFacts m) throws ExcecaoIntegracao {
		try {
			if(m.getIdMeasurementFacts() == null) {
				return getMeasurementFactsDAO().salvar(m);
			} else {
				return getMeasurementFactsDAO().mesclar(m);
			}
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

}
