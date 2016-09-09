package br.com.bioimportejb.bean.interfaces;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Local
public interface EventoLocal {

	Evento buscarPorEventId(String eventId) throws ExcecaoIntegracao;

	Evento salvarEvento(Evento evento) throws ExcecaoIntegracao;

}
