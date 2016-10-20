package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import br.com.bioimportejb.dao.EventoDAO;
import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.util.FiltroEventoVO;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class EventoCRUD extends CRUDGenerico<Evento, Long> implements EventoDAO, Serializable {

	private static final long serialVersionUID = 7031312855202624550L;

	@Override
	public Evento buscarPorEventId(String eventId) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select e from Evento e where e.eventID = :eventID");
			Query query = criarQuery(hql.toString());
			query.setParameter("eventID", eventId);
			return (Evento) query.uniqueResult();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	@Override
	public List<Evento> listarEventos(FiltroEventoVO filtro) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select distinct evento from Evento as evento ");
//			hql.append(" left join fetch evento.occurrences as occurrences ");
//			hql.append(" left join fetch occurrences.taxon as taxon ");
//			hql.append(" left join fetch occurrences.sample s ");
//			hql.append(" left join fetch s.abioticAnalysi as abioticAnalysi ");
//			hql.append(" left join fetch s.benthicAnalysi as benthicAnalysi ");
//			hql.append(" left join fetch s.bioticAnalysi as bioticAnalysi ");
//			hql.append(" left join fetch s.metagenomicAnalysi as metagenomicAnalysi ");
//			hql.append(" left join fetch s.sampleType as sampleType ");
//			hql.append(" left join fetch s.dataSet as dataSet ");
//			hql.append(" left join fetch s.occurrences as occurrences_sample ");
//			hql.append(" left join fetch occurrences_sample.taxon as taxon ");
//			hql.append(" left join fetch dataSet.geographicCoverages as geographicCoverages ");
//			hql.append(" left join fetch dataSet.contatos as contatos ");
//			hql.append(" left join fetch dataSet.temporalCoverages as temporalCoverages ");
//			hql.append(" left join fetch contatos.position as position ");
//			hql.append(" left join fetch contatos.email as email ");
//			hql.append(" left join fetch contatos.phone as phone");
//			hql.append(" left join fetch contatos.homepage as homepage ");
//			hql.append(" left join fetch contatos.address as address ");
			
			hql.append(" where 1 = 1 ");
			if(filtro.getIdEvento() != null) {
				hql.append(" and evento.idEvento = :idEvento ");
			}
			
			if(filtro.getDecimalLatitude() != null) {
				hql.append(" and evento.decimalLatitude = :decimalLatitude ");
			}
			
			if(filtro.getDecimalLongitude() != null) {
				hql.append(" and evento.decimalLongitude = :decimalLongitude ");
			}
			
			if(filtro.getDepth() != null) {
				hql.append(" and evento.depth = :depth ");
			}
			
			if(filtro.getEventDate() != null) {
				hql.append(" and evento.eventDate = :eventDate ");
			}
			
			hql.append(" order by evento.eventDate ");
			Query query = criarQuery(hql.toString());
			
			if(filtro.getIdEvento() != null) {
				query.setParameter("idEvento", filtro.getIdEvento());
			}
			
			if(filtro.getDecimalLatitude() != null) {
				query.setParameter("decimalLatitude", filtro.getDecimalLatitude());
			}
			
			if(filtro.getDecimalLongitude() != null) {
				query.setParameter("decimalLongitude", filtro.getDecimalLongitude());
			}
			
			if(filtro.getDepth() != null) {
				query.setParameter("depth", filtro.getDepth());
			}
			
			if(filtro.getEventDate() != null) {
				query.setParameter("eventDate", filtro.getEventDate());
			}
			
			return query.list();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	
	
}
