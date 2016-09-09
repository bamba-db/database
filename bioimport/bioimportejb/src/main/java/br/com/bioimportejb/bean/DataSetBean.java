package br.com.bioimportejb.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.DataSetLocal;
import br.com.bioimportejb.dao.DataSetDAO;
import br.com.bioimportejb.entidades.DataSet;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class DataSetBean implements DataSetLocal, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public DataSetDAO getDataSetDAO() throws ExcecaoGenerica {
		return (DataSetDAO) daoFabrica.getDAO(DataSet.class);
	}

	@Override
	public List<DataSet> listarDataSet() throws ExcecaoIntegracao {
		try {
			return getDataSetDAO().listar();
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}
	
	@Override
	public List<DataSet> salvar(List<DataSet> lista) throws ExcecaoIntegracao {
		try {
			for(DataSet d : lista) {
				getDataSetDAO().mesclar(d);
			}
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
		
		return lista;
	}
	
	@Override
	public DataSet salvar(DataSet d) throws ExcecaoIntegracao {
		try {
			d = getDataSetDAO().mesclar(d);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
		
		return d;
	}

	@Override
	public boolean verificarAtualizacao(String uuid, Calendar data) throws ExcecaoIntegracao {
		try {
			Calendar dataDataSet = getDataSetDAO().buscarDataPorUuid(uuid);
			if(dataDataSet == null) {
				return true;
			} else if(dataDataSet.before(data)) {
				return true;
			}
			
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
		return false;
	}

	@Override
	public DataSet buscarPorUuid(String uuid) throws ExcecaoIntegracao {
		try {
			return getDataSetDAO().buscarPorUuid(uuid);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	@Override
	public void remover(Long id) throws ExcecaoIntegracao {
		try {
			getDataSetDAO().excluirPorId(id);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}
}