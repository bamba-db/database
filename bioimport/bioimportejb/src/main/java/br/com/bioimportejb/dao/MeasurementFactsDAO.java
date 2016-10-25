package br.com.bioimportejb.dao;

import java.util.List;

import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.util.FiltroMeasurementFactsVO;
import br.com.bioimportejb.daofabrica.dao.DAOGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public interface MeasurementFactsDAO extends DAOGenerico<MeasurementFacts, Long>{

	List<MeasurementFacts> listar(FiltroMeasurementFactsVO filtro) throws ExcecaoGenerica;

}
