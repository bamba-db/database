package br.com.bioimportweb.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.entidades.Evento;

public class EventoOcorrenceVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Collection<Evento> eventos = new ArrayList<Evento>();

	private Map<String, Occurrence> ocorrencias = new HashMap<String, Occurrence>();

	public Collection<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(Collection<Evento> eventos) {
		this.eventos = eventos;
	}

	public Map<String, Occurrence> getOcorrencias() {
		return ocorrencias;
	}

	public void setOcorrencias(Map<String, Occurrence> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}
	
	
	
}
