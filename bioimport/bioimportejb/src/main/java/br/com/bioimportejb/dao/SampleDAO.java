package br.com.bioimportejb.dao;

import java.util.List;

import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.util.FiltroSampleVO;
import br.com.daofabrica.dao.DAOGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public interface SampleDAO extends DAOGenerico<Sample, Long>{

	List<Sample> listarSamplesOcorrencia(String string) throws ExcecaoGenerica;

	List<Sample> listarSamplesEvent(String name) throws ExcecaoGenerica;

	List<Sample> listarTodos(FiltroSampleVO filtro) throws ExcecaoGenerica;
	
}
