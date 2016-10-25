package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.bioimportejb.dao.AtorDAO;
import br.com.bioimportejb.entidades.Ator;
import br.com.bioimportejb.enumerator.PerfilEnum;
import br.com.bioimportejb.daofabrica.crud.CRUDGenerico;
import br.com.bioimportejb.daofabrica.excecoes.ExcecaoGenerica;

public class AtorCRUD extends CRUDGenerico<Ator, Long> implements AtorDAO, Serializable{

	private static final long serialVersionUID = 1L;

	public Ator buscarAtorPorLoginESenha(String login, String senha){
		
		Criteria criteria = ((Session)getEntityManager().getDelegate()).createCriteria(getClassePersistente());
		criteria.add(Restrictions.eq("login", login));
		criteria.add(Restrictions.eq("senha", senha));
		
		Ator ator = (Ator) criteria.uniqueResult();
	
		return ator;
	}

	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica{

		StringBuffer hql = new StringBuffer("select c.login FROM Ator c where c.login = :login ");
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		query.setString("login", login);
		return (String) query.uniqueResult();
	}
	
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica{

		StringBuffer hql = new StringBuffer("select count(c.id) FROM Ator c where c.login = :login ");
		if(null != id){
			hql.append(" and c.id != :id");
		}
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		
		query.setString("login", login);
		if(null != id){
			query.setLong("id", id);
		}
		return ( (Long) query.uniqueResult() > 0);
	}

	@Override
	public boolean validarAtorPorLoginECodigo(String login, String codigo) {
		StringBuffer hql = new StringBuffer("select count(c.id) FROM Ator c where c.login = :login and c.codigo = :codigo and c.dataHoraValidadeCodigo > :agora");
		
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		query.setString("login", login);
		query.setString("codigo", codigo);
		query.setCalendar("agora", Calendar.getInstance());
		
		return ( (Long) query.uniqueResult() > 0);
	}

	@Override
	public boolean validarAtorPorLoginESenha(String login, String senhaAtual) {
		StringBuffer hql = new StringBuffer("select count(c.id) FROM Ator c where c.login = :login and c.senha = :senhaAtual");
		
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		query.setString("login", login);
		query.setString("senhaAtual", senhaAtual);

		return ( (Long) query.uniqueResult() > 0);
	}

	@Override
	public Ator buscarAtorPorLogin(String login) throws ExcecaoGenerica {
		Criteria criteria = ((Session)getEntityManager().getDelegate()).createCriteria(getClassePersistente());
		criteria.add(Restrictions.eq("login", login));
		
		Ator ator = (Ator) criteria.uniqueResult();
		return ator;
	}

	@Override
	public List<String> buscarPorPerfil(PerfilEnum ad) throws ExcecaoGenerica {
		try{
			StringBuilder hql = new StringBuilder();
			hql.append("select ator.login from Ator ator left outer join ator.perfils as perfil ");
			hql.append(" where perfil.sigla = :sigla ");
			Query query = criarQuery(hql.toString());
			query.setParameter("sigla", ad.toString());
			return query.list();
		} catch(HibernateException e){
			throw new ExcecaoGenerica(e.getMessage());
		}
	}

	@Override
	public List<Ator> buscarAtorPorPerfil(PerfilEnum ad) throws ExcecaoGenerica {
		try{
			StringBuilder hql = new StringBuilder();
			hql.append("select ator from Ator ator left outer join ator.perfils as perfil ");
			hql.append(" where perfil.sigla = :sigla");
			Query query = criarQuery(hql.toString());
			query.setParameter("sigla", ad.getSigla());
			return query.list();
		} catch(HibernateException e){
			throw new ExcecaoGenerica(e.getMessage());
		}
	}

	@Override
	public List<Ator> buscarAtorPorPerfil(List<String> perfisSiglas)
			throws ExcecaoGenerica {
		try{
			StringBuilder hql = new StringBuilder();
			hql.append("select ator from Ator ator left outer join ator.perfils as perfil ");
			hql.append(" where perfil.sigla in :perfisSiglas");
			Query query = criarQuery(hql.toString());
			query.setParameterList("perfisSiglas", perfisSiglas);
			return query.list();
		} catch(HibernateException e){
			throw new ExcecaoGenerica(e.getMessage());
		}
	}
	
	
}
