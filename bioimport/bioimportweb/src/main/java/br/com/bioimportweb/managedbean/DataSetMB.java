package br.com.bioimportweb.managedbean;

import java.io.Serializable;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.apache.commons.lang3.StringUtils;
import org.primefaces.event.CellEditEvent;

import br.com.bioimportejb.bean.interfaces.DataSetLocal;
import br.com.bioimportejb.entidades.DataSet;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportweb.gbif.api.utils.GbifUtils;
import br.com.bioimportweb.util.Util;

@ViewScoped
@ManagedBean(name="dataSetMB")
public class DataSetMB implements Serializable {

	private static final long serialVersionUID = 8681865857427040369L;

	private List<DataSet> lista = new ArrayList<DataSet>();
	
	@EJB
	private DataSetLocal dataSetLocal;
	
	@PostConstruct
	public void carregar() {
		try {
			lista = dataSetLocal.listarDataSet();
		} catch (ExcecaoIntegracao e) {
			
		}
	}

	public void adicionarDataSet() throws ExcecaoIntegracao {
		List<DataSet> listaAntiga = new ArrayList<DataSet>(lista);
		lista.clear();
		DataSet d = new DataSet();
		d.setDescricao("0");
		d.setUuid("0");
		d = dataSetLocal.salvar(d);
		lista.add(d);
		lista.addAll(listaAntiga);
	}
	
	public void onRowEdit(CellEditEvent event) throws ExcecaoIntegracao {
        Integer index = (Integer) event.getRowIndex();
		DataSet d = lista.get(index);
        if(StringUtils.isNotEmpty(d.getUuid())) {
        	d = dataSetLocal.salvar(d);
        } else {
        	lista.remove(index);
        	if(d.getId() != null) {
        		dataSetLocal.remover(d.getId());
        	}
        }
    }
	
	public String processarImportacao() throws ExcecaoIntegracao {
		try {
			List<DataSet> lista = dataSetLocal.listarDataSet();
			for(DataSet d : lista) {
				GbifUtils.getInstance().processarDataSet(d.getUuid());
			}
		} catch (MalformedURLException e) {
			Util.montaMensagemFlashRedirect("Erro ao formatar URL do DataSet", null);
		}
		return null;
	}
	
	public List<DataSet> getLista() {
		return lista;
	}

	public void setLista(List<DataSet> lista) {
		this.lista = lista;
	}
}
