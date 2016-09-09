package br.com.bioimportejb.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;
import br.com.bioimportejb.dao.AtorDAO;
import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.enumerator.PerfilEnum;
import br.com.bioimportejb.service.AtorService;

@Stateless
public class AtorBean implements AtorService, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public AtorDAO getAtorDAO() throws ExcecaoGenerica{
		return (AtorDAO) daoFabrica.getDAO(Ator.class);
	}
	
	public Ator inserirAtor(Ator ator) throws ExcecaoGenerica{
		ator = getAtorDAO().salvar(ator);
		try{
			em.flush();
		}catch(PersistenceException e){
			String erro = e.getMessage().split("ERRO:")[1];
			throw new ExcecaoGenerica(erro);
		}
		return ator;
	}

	public Ator alterarAtor(Ator ator) throws ExcecaoGenerica {
		ator = getAtorDAO().alterar(ator);
		return ator;
	}
	
	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica {
		return getAtorDAO().buscarEmailPorLogin(login);
	}
	
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica {
		return getAtorDAO().verificarExistenciaLogin(login, id);
	}

	@Override
	public Boolean validarCodigo(String login, String codigo) throws ExcecaoGenerica {
		return getAtorDAO().validarAtorPorLoginECodigo(login, codigo);
	}

	@Override
	public Boolean validarLogin(String login, String senhaAtual) throws ExcecaoGenerica {
		return getAtorDAO().validarAtorPorLoginESenha(login, senhaAtual);
	}

	@Override
	public void alterarSenhaAtor(String login, String senha) throws ExcecaoGenerica {
		Ator ator = getAtorDAO().buscarAtorPorLogin(login);
		ator.setSenha(senha);
		getAtorDAO().alterar(ator);
	}
	
	@Override
	public void salvarCodigoEDataExpiracaoCodigo(String login, String codigo, Calendar dataExpiracaoSenha) throws ExcecaoGenerica {
		Ator ator = getAtorDAO().buscarAtorPorLogin(login);
		//TODO acrescentar alteração de senha
//		ator.setCodigo(codigo);
//		ator.setDataExpiracaoSenha(dataExpiracaoSenha);
		getAtorDAO().alterar(ator);
	}

	@Override
	public List<Ator> buscarAtorPorPerfil(PerfilEnum ad) throws ExcecaoGenerica {
		return getAtorDAO().buscarAtorPorPerfil(ad);
	}
	
}
