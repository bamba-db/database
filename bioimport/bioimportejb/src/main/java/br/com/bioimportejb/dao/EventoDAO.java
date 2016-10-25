package br.com.bioimportejb.dao;

import java.util.List;

import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.util.FiltroEventoVO;
import br.com.bioimportejb.daofabrica.dao.DAOGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public interface EventoDAO extends DAOGenerico<Evento, Long>{

	Evento buscarPorEventId(String eventId) throws ExcecaoGenerica;

	List<Evento> listarEventos(FiltroEventoVO filtro) throws ExcecaoGenerica;

}
