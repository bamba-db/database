package br.com.bioimportejb.bean.interfaces;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Local
public interface OccurrenceLocal {

	Occurrence salvarOccurrence(Occurrence o) throws ExcecaoIntegracao;

}
