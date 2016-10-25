package br.com.bioimportejb.bean;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.TaxonLocal;
import br.com.bioimportejb.dao.TaxonDAO;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.ChaveTaxonVO;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;
import br.com.bioimportejb.daofabrica.fabrica.DAOFabrica;
import br.com.bioimportejb.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class TaxonBean implements TaxonLocal, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public TaxonDAO getTaxonDAO() throws ExcecaoGenerica {
		return (TaxonDAO) daoFabrica.getDAO(Taxon.class);
	}

	@Override
	public Taxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoIntegracao {
		try {
			return getTaxonDAO().buscarPorTaxonKey(taxonkey);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	@Override
	public Taxon salvar(Taxon dTaxon) throws ExcecaoIntegracao {
		try {
			return getTaxonDAO().salvar(dTaxon);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	@Override
	public Taxon buscarPorChaveTaxon(ChaveTaxonVO chaveTaxonVO) throws ExcecaoIntegracao {
		try {
			return getTaxonDAO().buscarPorChaveTaxon(chaveTaxonVO);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}
	
}
