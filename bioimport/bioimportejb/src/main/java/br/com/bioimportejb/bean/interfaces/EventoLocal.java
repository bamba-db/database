package br.com.bioimportejb.bean.interfaces;

import java.util.List;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroEventoVO;

@Local
public interface EventoLocal {

	Evento buscarPorEventId(String eventId) throws ExcecaoIntegracao;

	Evento salvarEvento(Evento evento) throws ExcecaoIntegracao;

	List<Evento> listarEventos(FiltroEventoVO filtro) throws ExcecaoIntegracao;;

}
