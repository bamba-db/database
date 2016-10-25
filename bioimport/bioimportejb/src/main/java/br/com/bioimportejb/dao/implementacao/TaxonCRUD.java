package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import br.com.bioimportejb.dao.TaxonDAO;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.util.ChaveTaxonVO;
import br.com.bioimportejb.daofabrica.crud.CRUDGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public class TaxonCRUD extends CRUDGenerico<Taxon, Long> implements TaxonDAO, Serializable{

	private static final long serialVersionUID = 1L;

	@Override
	public Taxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select t from Taxon t where t.taxonkey = :taxonkey");
			Query query = criarQuery(hql.toString());
			query.setParameter("taxonkey", taxonkey);
			return (Taxon) query.uniqueResult();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	@Override
	public Taxon buscarPorChaveTaxon(ChaveTaxonVO chaveTaxonVO) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select t from Taxon t where ")
			.append(" t.class_ = :class_ ")
			.append(" and t.family = :family ")
			.append(" and t.genus = :genus ")
			.append(" and t.infraspecificepithet = :infraspecificepithet ")
			.append(" and t.kingdom = :kingdom ")
			.append(" and t.order = :order ")
			.append(" and t.phylum = :phylum ")
			.append(" and t.scientificname = :scientificname ")
			.append(" and t.species = :species ")
			.append(" and t.taxonrank = :taxonrank ");
			
			Query query = criarQuery(hql.toString());
			query.setParameter("class_", chaveTaxonVO.getClass_());
			query.setParameter("family", chaveTaxonVO.getFamily());
			query.setParameter("genus", chaveTaxonVO.getGenus());
			query.setParameter("infraspecificepithet", chaveTaxonVO.getInfraspecificepithet());
			query.setParameter("kingdom", chaveTaxonVO.getKingdom());
			query.setParameter("order", chaveTaxonVO.getOrder());
			query.setParameter("phylum", chaveTaxonVO.getPhylum());
			query.setParameter("scientificname", chaveTaxonVO.getScientificname());
			query.setParameter("species", chaveTaxonVO.getSpecies());
			query.setParameter("taxonrank", chaveTaxonVO.getTaxonrank());
			
			return (Taxon) query.uniqueResult();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	
}
