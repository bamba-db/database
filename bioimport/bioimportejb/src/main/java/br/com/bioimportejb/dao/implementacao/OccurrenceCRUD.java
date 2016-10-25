package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;

import br.com.bioimportejb.dao.OccurrenceDAO;
import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.util.FiltroOccurrenceVO;
import br.com.bioimportejb.util.OccurrenceVO;
import br.com.bioimportejb.daofabrica.crud.CRUDGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public class OccurrenceCRUD extends CRUDGenerico<Occurrence, Long> implements OccurrenceDAO, Serializable {

	private static final long serialVersionUID = 1L;

	@Override
	public List<OccurrenceVO> listarOccurrence(FiltroOccurrenceVO filtro) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append(" select distinct o.id as id, o.abundance as abundance, o.occurrenceId as occurrenceId, ");
			hql.append(" taxon.class_ as class_, ");
			hql.append(" taxon.family as family, ");
			hql.append(" taxon.genus as genus, ");
			hql.append(" taxon.infraspecificepithet as infraspecificepithet, ");
			hql.append(" taxon.kingdom as kingdom, ");
			hql.append(" taxon.order as order, ");
			hql.append(" taxon.phylum as phylum, ");
			hql.append(" taxon.scientificname as scientificname, ");
			hql.append(" taxon.species as species, ");
			hql.append(" taxon.taxonkey as taxonkey, ");
			hql.append(" taxon.taxonrank as taxonrank, ");
			hql.append(" taxon.idTaxon as idTaxon ");
			
			hql.append(" from Occurrence as o , Taxon as taxon ");
//			hql.append(" left join fetch o.taxon as taxon ");
//			hql.append(" left join fetch o.evento as evento ");
			
			
			hql.append(" where o.taxon.idTaxon = taxon.idTaxon ");
			if(filtro.getId() != null) {
				hql.append(" and o.id = :id ");
			}
			
			if(filtro.getAbundance() != null) {
				hql.append(" and o.abundance = :abundance ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getClass_())) {
				hql.append(" and taxon.class_ = :class_ ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getFamily())) {
				hql.append(" and taxon.family = :family ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getGenus())) {
				hql.append(" and taxon.genus = :genus ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getInfraspecificepithet())) {
				hql.append(" and taxon.infraspecificepithet = :infraspecificepithet ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getKingdom())) {
				hql.append(" and taxon.kingdom = :kingdom ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getOrder())) {
				hql.append(" and taxon.order = :order ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getPhylum())) {
				hql.append(" and taxon.phylum = :phylum ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getScientificname())) {
				hql.append(" and taxon.scientificname = :scientificname ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getSpecies())) {
				hql.append(" and taxon.species = :species ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getTaxonkey())) {
				hql.append(" and taxon.taxonkey = :taxonkey ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getTaxonrank())) {
				hql.append(" and taxon.taxonrank = :taxonrank ");
			}
			
			if(filtro.getIdTaxon() != null) {
				hql.append(" and taxon.idTaxon = :idTaxon ");
			}
			
			
			Query query = criarQuery(hql.toString());
			
			if(filtro.getId() != null) {
				query.setParameter("id", filtro.getId());
			}
			
			if(filtro.getAbundance() != null) {
				query.setParameter("abundance", filtro.getAbundance());
			}
			
			if(StringUtils.isNotEmpty(filtro.getClass_())) {
				query.setParameter("class_", filtro.getClass_());
			}
			
			if(StringUtils.isNotEmpty(filtro.getFamily())) {
				query.setParameter("family", filtro.getFamily());
			}
			
			if(StringUtils.isNotEmpty(filtro.getGenus())) {
				query.setParameter("genus", filtro.getGenus());
			}
			
			if(StringUtils.isNotEmpty(filtro.getInfraspecificepithet())) {
				query.setParameter("infraspecificepithet", filtro.getInfraspecificepithet());
			}
			
			if(StringUtils.isNotEmpty(filtro.getKingdom())) {
				query.setParameter("kingdom", filtro.getKingdom());
			}
			
			if(StringUtils.isNotEmpty(filtro.getOrder())) {
				query.setParameter("order", filtro.getOrder());
			}
			
			if(StringUtils.isNotEmpty(filtro.getPhylum())) {
				query.setParameter("phylum", filtro.getPhylum());
			}
			
			if(StringUtils.isNotEmpty(filtro.getScientificname())) {
				query.setParameter("scientificname", filtro.getScientificname());
			}
			
			if(StringUtils.isNotEmpty(filtro.getSpecies())) {
				query.setParameter("species", filtro.getSpecies());
			}
			
			if(StringUtils.isNotEmpty(filtro.getTaxonkey())) {
				query.setParameter("taxonkey", filtro.getTaxonkey());
			}
			
			if(StringUtils.isNotEmpty(filtro.getTaxonrank())) {
				query.setParameter("taxonrank", filtro.getTaxonrank());
			}
			
			if(filtro.getIdTaxon() != null) {
				hql.append(" and taxon.idTaxon = :idTaxon ");
				query.setParameter("idTaxon", filtro.getIdTaxon());
			}			
			
			query.setResultTransformer(Transformers.aliasToBean(OccurrenceVO.class));
			return query.list();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	
}
