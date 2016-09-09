package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.Calendar;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import br.com.bioimportejb.dao.DataSetDAO;
import br.com.bioimportejb.entidades.DataSet;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class DataSetCRUD extends CRUDGenerico<DataSet, String> implements DataSetDAO, Serializable{

	private static final long serialVersionUID = 7031312855202624550L;

	@Override
	public Calendar buscarDataPorUuid(String uuid) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select d.dataAlt from DataSet d where d.uuid = :uuid");
			Query query = criarQuery(hql.toString());
			query.setParameter("uuid", uuid);
			return (Calendar) query.uniqueResult();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}
	
	@Override
	public DataSet buscarPorUuid(String uuid) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select d from DataSet d where d.uuid = :uuid");
			Query query = criarQuery(hql.toString());
			query.setParameter("uuid", uuid);
			return (DataSet) query.uniqueResult();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	@Override
	public void excluirPorId(Long id) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("delete from DataSet where id= :id");
			Query query = criarQuery(hql.toString());
			query.setParameter("id", id);
			query.executeUpdate();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}
	
	
}
