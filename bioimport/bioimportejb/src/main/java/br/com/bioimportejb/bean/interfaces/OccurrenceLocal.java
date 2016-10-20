package br.com.bioimportejb.bean.interfaces;

import java.util.List;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.FiltroOccurrenceVO;
import br.com.bioimportejb.util.OccurrenceVO;

@Local
public interface OccurrenceLocal {

	Occurrence salvarOccurrence(Occurrence o) throws ExcecaoIntegracao;

	List<OccurrenceVO> listarOccurrences(FiltroOccurrenceVO filtro) throws ExcecaoIntegracao;

}
