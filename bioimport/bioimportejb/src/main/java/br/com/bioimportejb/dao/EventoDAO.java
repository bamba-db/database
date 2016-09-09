package br.com.bioimportejb.dao;

import br.com.bioimportejb.entidades.Evento;
import br.com.daofabrica.dao.DAOGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public interface EventoDAO extends DAOGenerico<Evento, Long>{

	Evento buscarPorEventId(String eventId) throws ExcecaoGenerica;

}
