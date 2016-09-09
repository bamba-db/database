package br.com.bioimportejb.dao;

import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.util.ChaveTaxonVO;
import br.com.daofabrica.dao.DAOGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public interface TaxonDAO extends DAOGenerico<Taxon, Long>{

	Taxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoGenerica;

	Taxon buscarPorChaveTaxon(ChaveTaxonVO chaveTaxonVO) throws ExcecaoGenerica;

}
