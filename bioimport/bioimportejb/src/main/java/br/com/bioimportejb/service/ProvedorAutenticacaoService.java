package br.com.bioimportejb.service;

import javax.ejb.Local;

import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.bioimportejb.entidades.Ator;

@Local
public interface ProvedorAutenticacaoService{
	
	public Ator buscarAtorPorLoginESenha(String login, String senha) throws ExcecaoGenerica;

}
