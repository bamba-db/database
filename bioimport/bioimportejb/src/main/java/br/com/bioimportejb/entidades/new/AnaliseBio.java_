package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;


/**
 * The persistent class for the analise_bio database table.
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name="analise_bio", schema="bio")
@NamedQuery(name="AnaliseBio.findAll", query="SELECT a FROM AnaliseBio a")
public class AnaliseBio implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_analise_bio",sequenceName="bio.seq_analise_bio", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_analise_bio")
	@Column(name="id_analise_bio")
	private Long idAnaliseBio;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	//bi-directional many-to-one association to Analise
	@OneToOne
	@JoinColumn(name="id_analise")
	@XmlTransient
	private Analise analise;

	//bi-directional many-to-one association to Taxon
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_taxon")
	@XmlTransient
	private Taxon taxon;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	public AnaliseBio() {
	}

	public Long getIdAnaliseBio() {
		return this.idAnaliseBio;
	}

	public void setIdAnaliseBio(Long idAnaliseBio) {
		this.idAnaliseBio = idAnaliseBio;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public Analise getAnalise() {
		return this.analise;
	}

	public void setAnalise(Analise analise) {
		this.analise = analise;
	}

	public Taxon getTaxon() {
		return this.taxon;
	}

	public void setTaxon(Taxon taxon) {
		this.taxon = taxon;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}