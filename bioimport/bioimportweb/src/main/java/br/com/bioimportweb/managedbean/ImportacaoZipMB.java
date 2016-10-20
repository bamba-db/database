package br.com.bioimportweb.managedbean;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportweb.gbif.api.utils.GbifUtils;
import br.com.bioimportweb.util.Util;

@ViewScoped
@ManagedBean(name = "importacaoZipMB")
public class ImportacaoZipMB implements Serializable {

	private static final long serialVersionUID = 1L;

	private UploadedFile file;

	private ArrayList<Evento> listaEventos = new ArrayList<Evento>();

	private Logger log = LoggerFactory.getLogger(getClass());

	public void upload(FileUploadEvent fileUploadEvent) {

		file = fileUploadEvent.getFile();
	}

	public void importar() throws ExcecaoIntegracao {
		try {
			listaEventos = new ArrayList<Evento>();
			Collection<Evento> lista = GbifUtils.getInstance().processaZip(file.getInputstream());
			listaEventos = new ArrayList<Evento>(lista);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect("Erro ao importar arquivo", null);
		}
	}

	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}

	public ArrayList<Evento> getListaEventos() {
		return listaEventos;
	}

	public void setListaEventos(ArrayList<Evento> listaEventos) {
		this.listaEventos = listaEventos;
	}
	
	

}
