package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
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
import javax.persistence.MapsId;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

import org.eclipse.persistence.oxm.annotations.XmlInverseReference;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


/**
 * The persistent class for the amostra database table.
 * 
 */
@Entity
@Table(name="amostra", schema="bio")
@NamedQuery(name="Amostra.findAll", query="SELECT a FROM Amostra a")
@XmlRootElement
public class Amostra implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_amostra",sequenceName="bio.seq_amostra", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_amostra")
	@Column(name="id_amostra")
	private Long idAmostra;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_amostra")
	private Date dtAmostra;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	private BigDecimal latitude;

	private BigDecimal longitude;

	private BigDecimal profundidade;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	//bi-directional many-to-one association to Analise
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy="amostra", cascade=CascadeType.ALL)
	@XmlInverseReference(mappedBy="amostra")
	private List<Analise> analises = new ArrayList<Analise>();

	public Amostra() {
	}

	public Long getIdAmostra() {
		return this.idAmostra;
	}

	public void setIdAmostra(Long idAmostra) {
		this.idAmostra = idAmostra;
	}

	public Date getDtAmostra() {
		return this.dtAmostra;
	}

	public void setDtAmostra(Date dtAmostra) {
		this.dtAmostra = dtAmostra;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public BigDecimal getLatitude() {
		return this.latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public BigDecimal getLongitude() {
		return this.longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getProfundidade() {
		return this.profundidade;
	}

	public void setProfundidade(BigDecimal profundidade) {
		this.profundidade = profundidade;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<Analise> getAnalises() {
		return this.analises;
	}

	public void setAnalises(List<Analise> analises) {
		this.analises = analises;
	}

	public Analise addAnalis(Analise analis) {
		getAnalises().add(analis);
		analis.setAmostra(this);

		return analis;
	}

	public Analise removeAnalis(Analise analis) {
		getAnalises().remove(analis);
		analis.setAmostra(null);

		return analis;
	}

}