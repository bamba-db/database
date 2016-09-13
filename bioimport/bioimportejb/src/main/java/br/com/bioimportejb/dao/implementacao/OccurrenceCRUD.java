package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;

import br.com.bioimportejb.dao.OccurrenceDAO;
import br.com.bioimportejb.entidades.Occurrence;
import br.com.daofabrica.crud.CRUDGenerico;

public class OccurrenceCRUD extends CRUDGenerico<Occurrence, Long> implements OccurrenceDAO, Serializable {

	private static final long serialVersionUID = 1L;

	
}
