package br.com.bioimportejb.bean;

import java.io.Serializable;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;
import br.com.bioimportejb.dao.AtorDAO;
import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.service.ProvedorAutenticacaoService;

@Stateless
public class ProvedorAutenticacaoBean implements ProvedorAutenticacaoService, Serializable{
	
	private static final long serialVersionUID = 1L;

	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	public AtorDAO getAtorDAO(EntityManager em) throws ExcecaoGenerica{
		daoFabrica = new DAOFabricaImpl(em);
		return (AtorDAO) daoFabrica.getDAO(Ator.class);
	}

	@Override
	public Ator buscarAtorPorLoginESenha(String login, String senha) throws ExcecaoGenerica {
		Ator ator = getAtorDAO(em).buscarAtorPorLoginESenha(login, senha);
		
		return ator;
	}
	
}
