package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import br.com.bioimportejb.dao.SampleDAO;
import br.com.bioimportejb.entidades.Sample;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class SampleCRUD extends CRUDGenerico<Sample, Long> implements SampleDAO, Serializable{

	private static final long serialVersionUID = 1L;
	
	public List<Sample> listarAscOuDesc(String ordemAscCampo, boolean buscarAsc) throws ExcecaoGenerica {
		
		logger.info("::::Acionou o mï¿½todo listarAscOuDesc em GenericCRUD::::");
		
		List<Sample> lista = null;
		
		try {
			Criteria criteria = null;
			Session session = null;
			criteria = ((Session) getEntityManager().getDelegate()).createCriteria(getClassePersistente());
			 
			if(buscarAsc){
				criteria.addOrder(Order.asc(ordemAscCampo));
			}else{
				criteria.addOrder(Order.desc(ordemAscCampo));
			}
			
			lista = criteria.list();
			for(Sample s : lista) {
				s.getFishAssemblyAnalysi().size();
			}
			return lista;
		} catch (HibernateException e) {
			logger.info(e.getMessage());
			throw new ExcecaoGenerica(e);
		}
		
	}

	@Override
	public List<Sample> listarSamplesOcorrencia(String tipoDataSet) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select s from Sample s where s.dataSet.type = :tipoDataSet order by s.dt ");
			Query query = criarQuery(hql.toString());
			query.setParameter("tipoDataSet", tipoDataSet);
			return query.list();
		} catch (HibernateException e) {
			logger.error(e.getMessage());
			throw new ExcecaoGenerica(e);
		}
	}

	@Override
	public List<Sample> listarSamplesEvent(String tipoDataSet) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select distinct s from Sample as s ");
			hql.append(" inner join fetch s.dataSet as dataSet ");
			hql.append(" left join fetch dataSet.geographicCoverages as geographicCoverages ");
			hql.append(" where dataSet.type = :tipoDataSet order by s.dt ");
			Query query = criarQuery(hql.toString());
			query.setParameter("tipoDataSet", tipoDataSet);
			return query.list();
		} catch (HibernateException e) {
			logger.error(e.getMessage());
			throw new ExcecaoGenerica(e);
		}
	}
	
}
