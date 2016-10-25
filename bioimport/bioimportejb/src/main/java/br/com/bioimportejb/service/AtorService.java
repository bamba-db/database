package br.com.bioimportejb.service;

import java.util.Calendar;
import java.util.List;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.enumerator.PerfilEnum;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

@Local
public interface AtorService{
	
	public Ator inserirAtor(Ator ator)  throws ExcecaoGenerica;
	public Ator alterarAtor(Ator ator) throws ExcecaoGenerica;
	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica;
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica;
	public Boolean validarCodigo(String login, String codigo) throws ExcecaoGenerica;
	public Boolean validarLogin(String login, String senhaAtual) throws ExcecaoGenerica;
	public void alterarSenhaAtor(String login, String senha) throws ExcecaoGenerica;
	public void salvarCodigoEDataExpiracaoCodigo(String login, String codigo, Calendar dataExpiracaoSenha) throws ExcecaoGenerica;
	public List<Ator> buscarAtorPorPerfil(PerfilEnum ad) throws ExcecaoGenerica;;
	
}
