package br.com.bioimportejb.service;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

@Local
public interface ProvedorAutenticacaoService{
	
	public Ator buscarAtorPorLoginESenha(String login, String senha) throws ExcecaoGenerica;

}
