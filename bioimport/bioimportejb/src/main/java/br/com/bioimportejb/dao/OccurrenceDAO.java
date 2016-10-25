package br.com.bioimportejb.dao;

import java.util.List;

import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.util.FiltroOccurrenceVO;
import br.com.bioimportejb.util.OccurrenceVO;
import br.com.bioimportejb.daofabrica.dao.DAOGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public interface OccurrenceDAO extends DAOGenerico<Occurrence, Long>{

	List<OccurrenceVO> listarOccurrence(FiltroOccurrenceVO filtro) throws ExcecaoGenerica;

}
