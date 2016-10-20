package br.com.bioimportejb.bean.interfaces;

import java.util.List;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroMeasurementFactsVO;

@Local
public interface MeasurementFactsLocal {

	MeasurementFacts salvarMedida(MeasurementFacts m) throws ExcecaoIntegracao;

	List<MeasurementFacts> listarMeasurementFactss(FiltroMeasurementFactsVO filtro) throws ExcecaoIntegracao;

}
