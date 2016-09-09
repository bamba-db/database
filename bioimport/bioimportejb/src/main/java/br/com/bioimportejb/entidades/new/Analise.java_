package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;

import org.eclipse.persistence.oxm.annotations.XmlInverseReference;


/**
 * The persistent class for the analise database table.
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name="analise", schema="bio")
@NamedQuery(name="Analise.findAll", query="SELECT a FROM Analise a")
public class Analise implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_analise",sequenceName="bio.seq_analise", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_analise")
	@Column(name="id_analise")
	private Long idAnalise;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_analise")
	private Date dtAnalise;

	//bi-directional many-to-one association to Amostra
	@ManyToOne
	@JoinColumn(name="id_amostra")
	@XmlTransient
	private Amostra amostra;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	//bi-directional many-to-one association to AnaliseBio
	@OneToOne(mappedBy="analise", cascade=CascadeType.ALL)
	@XmlInverseReference(mappedBy="analise")
	private AnaliseBio analiseBio;

	//bi-directional many-to-one association to DadosGerai
	@OneToMany(mappedBy="analise")
	@XmlTransient
	private List<DadosGerai> dadosGerais;

	public Analise() {
	}

	public Long getIdAnalise() {
		return this.idAnalise;
	}

	public void setIdAnalise(Long idAnalise) {
		this.idAnalise = idAnalise;
	}

	public Date getDtAnalise() {
		return this.dtAnalise;
	}

	public void setDtAnalise(Date dtAnalise) {
		this.dtAnalise = dtAnalise;
	}

	//@XmlInverseReference(mappedBy="analises")
	public Amostra getAmostra() {
		return this.amostra;
	}

	public void setAmostra(Amostra amostra) {
		this.amostra = amostra;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public AnaliseBio getAnaliseBio() {
		return analiseBio;
	}

	public void setAnaliseBio(AnaliseBio analiseBio) {
		this.analiseBio = analiseBio;
	}

	public List<DadosGerai> getDadosGerais() {
		return this.dadosGerais;
	}

	public void setDadosGerais(List<DadosGerai> dadosGerais) {
		this.dadosGerais = dadosGerais;
	}

	public DadosGerai addDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().add(dadosGerai);
		dadosGerai.setAnalise(this);

		return dadosGerai;
	}

	public DadosGerai removeDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().remove(dadosGerai);
		dadosGerai.setAnalise(null);

		return dadosGerai;
	}

}