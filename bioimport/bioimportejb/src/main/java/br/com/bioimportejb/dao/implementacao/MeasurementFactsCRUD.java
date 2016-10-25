package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;

import br.com.bioimportejb.dao.MeasurementFactsDAO;
import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.util.FiltroMeasurementFactsVO;
import br.com.bioimportejb.daofabrica.crud.CRUDGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public class MeasurementFactsCRUD extends CRUDGenerico<MeasurementFacts, Long> implements MeasurementFactsDAO, Serializable {

	private static final long serialVersionUID = 1L;

	@Override
	public List<MeasurementFacts> listar(FiltroMeasurementFactsVO filtro) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select distinct m.idMeasurementFacts as idMeasurementFacts, m.measurementID as measurementID, m.measurementType as measurementType, ");
			hql.append(" m.measurementTypeID as measurementTypeID, m.measurementValue as measurementValue, m.measurementUnit as measurementUnit, m.measurementUnitID as measurementUnitID");
			hql.append(" from MeasurementFacts as m ");
			
			hql.append(" where 1 = 1 ");
			if(filtro.getIdMeasurementFacts() != null) {
				hql.append(" and m.idMeasurementFacts = :idMeasurementFacts ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementType())) {
				hql.append(" and m.measurementType = :measurementType ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementTypeID())) {
				hql.append(" and m.measurementTypeID = :measurementTypeID ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementUnit())) {
				hql.append(" and m.measurementUnit = :measurementUnit ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementUnitID())) {
				hql.append(" and m.measurementUnitID = :measurementUnitID ");
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementValue())) {
				hql.append(" and m.measurementValue = :measurementValue ");
			}
			
			Query query = criarQuery(hql.toString());
			
			if(filtro.getIdMeasurementFacts() != null) {
				query.setParameter("idMeasurementFacts", filtro.getIdMeasurementFacts());
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementType())) {
				query.setParameter("measurementType", filtro.getMeasurementType());
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementTypeID())) {
				query.setParameter("measurementTypeID", filtro.getMeasurementTypeID());
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementUnit())) {
				query.setParameter("measurementUnit", filtro.getMeasurementUnit());
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementUnitID())) {
				query.setParameter("measurementUnitID", filtro.getMeasurementUnitID());
			}
			
			if(StringUtils.isNotEmpty(filtro.getMeasurementValue())) {
				query.setParameter("measurementValue", filtro.getMeasurementValue());
			}
			
			query.setResultTransformer(Transformers.aliasToBean(MeasurementFacts.class));
			
			return (List<MeasurementFacts>) query.list();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}
	
}
