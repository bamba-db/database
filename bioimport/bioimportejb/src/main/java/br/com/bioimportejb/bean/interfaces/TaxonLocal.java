package br.com.bioimportejb.bean.interfaces;

import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.ChaveTaxonVO;

public interface TaxonLocal {

	public Taxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoIntegracao;

	public Taxon salvar(Taxon dTaxon) throws ExcecaoIntegracao;

	public Taxon buscarPorChaveTaxon(ChaveTaxonVO chaveTaxonVO) throws ExcecaoIntegracao;

}
