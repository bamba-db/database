package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.Calendar;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import br.com.bioimportejb.dao.EventoDAO;
import br.com.bioimportejb.entidades.Evento;
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

	
	
}
