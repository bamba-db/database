package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;

import br.com.bioimportejb.dao.MeasurementFactsDAO;
import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.daofabrica.crud.CRUDGenerico;

public class MeasurementFactsCRUD extends CRUDGenerico<MeasurementFacts, Long> implements MeasurementFactsDAO, Serializable {

	private static final long serialVersionUID = 1L;
	
}
