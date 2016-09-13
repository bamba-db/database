package br.com.bioimportejb.bean.interfaces;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Local
public interface MeasurementFactsLocal {

	MeasurementFacts salvarMedida(MeasurementFacts m) throws ExcecaoIntegracao;

}
