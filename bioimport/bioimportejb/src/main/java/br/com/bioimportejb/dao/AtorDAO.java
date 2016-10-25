package br.com.bioimportejb.dao;


import java.util.List;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.enumerator.PerfilEnum;
import br.com.bioimportejb.daofabrica.dao.DAOGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public interface AtorDAO extends DAOGenerico<Ator, Long>{

	public Ator buscarAtorPorLoginESenha(String login, String senha);

	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica;
	
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica;

	public boolean validarAtorPorLoginECodigo(String login, String codigo) throws ExcecaoGenerica;

	public boolean validarAtorPorLoginESenha(String login, String senhaAtual) throws ExcecaoGenerica;

	public Ator buscarAtorPorLogin(String login) throws ExcecaoGenerica;

	public List<String> buscarPorPerfil(PerfilEnum ad) throws ExcecaoGenerica;

	public List<Ator> buscarAtorPorPerfil(PerfilEnum ad) throws ExcecaoGenerica;

	List<Ator> buscarAtorPorPerfil(List<String> perfisSiglas)
			throws ExcecaoGenerica;

//	public void alterarSenhaPorLogin(String login, String senha) throws ExcecaoGenerica;
//	public void salvarCodigoEDataExpiracaoCodigo(String login, String codigo, Calendar dataExpiracaoSenha) throws ExcecaoGenerica;

}
