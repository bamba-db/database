package br.com.bioimportejb.dao;

import java.util.Calendar;

import br.com.bioimportejb.entidades.DataSet;
import br.com.daofabrica.dao.DAOGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public interface DataSetDAO extends DAOGenerico<DataSet, String>{

	Calendar buscarDataPorUuid(String uuid) throws ExcecaoGenerica;

	DataSet buscarPorUuid(String uuid) throws ExcecaoGenerica;

	void excluirPorId(Long id) throws ExcecaoGenerica;

}
