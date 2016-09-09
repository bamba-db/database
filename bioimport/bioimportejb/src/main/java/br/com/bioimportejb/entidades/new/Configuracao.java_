package br.com.bioimportejb.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the configuracao database table.
 * 
 */
@Entity
@Table(name="configuracao", schema="bio")
@NamedQuery(name="Configuracao.findAll", query="SELECT c FROM Configuracao c")
public class Configuracao implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="nom_configuracao")
	private String nomConfiguracao;

	private String valor;

	public Configuracao() {
	}

	public String getNomConfiguracao() {
		return this.nomConfiguracao;
	}

	public void setNomConfiguracao(String nomConfiguracao) {
		this.nomConfiguracao = nomConfiguracao;
	}

	public String getValor() {
		return this.valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}