package br.com.bioimportweb.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.entidades.Sample;

public class SampleOcorrenceVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Collection<Sample> samples = new ArrayList<Sample>();

	private Map<String, Occurrence> ocorrencias = new HashMap<String, Occurrence>();

	public Collection<Sample> getSamples() {
		return samples;
	}

	public void setSamples(Collection<Sample> samples) {
		this.samples = samples;
	}

	public Map<String, Occurrence> getOcorrencias() {
		return ocorrencias;
	}

	public void setOcorrencias(Map<String, Occurrence> ocorrencias) {
		this.ocorrencias = ocorrencias;
	}
	
	
	
}
