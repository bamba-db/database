package br.com.bioimportejb.bean;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.EventoLocal;
import br.com.bioimportejb.dao.EventoDAO;
import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroEventoVO;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class EventoBean implements EventoLocal, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public EventoDAO getEventoDAO() throws ExcecaoGenerica {
		return (EventoDAO) daoFabrica.getDAO(Evento.class);
	}

	@Override
	public Evento buscarPorEventId(String eventId) throws ExcecaoIntegracao {
		try {
			return getEventoDAO().buscarPorEventId(eventId);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	@Override
	public Evento salvarEvento(Evento evento) throws ExcecaoIntegracao {
		try {
			if(evento.getIdEvento() == null) {
				return getEventoDAO().salvar(evento);
			} else {
				return getEventoDAO().mesclar(evento);
			}
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	@Override
	public List<Evento> listarEventos(FiltroEventoVO filtro) throws ExcecaoIntegracao {
		try {
			return getEventoDAO().listarEventos(filtro);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	
	
}
