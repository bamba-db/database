package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the descritor_unidade database table.
 * 
 */
@Entity
@Table(name="descritor_unidade", schema="bio")
@NamedQuery(name="DescritorUnidade.findAll", query="SELECT d FROM DescritorUnidade d")
public class DescritorUnidade implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_descritor_unidade",sequenceName="bio.seq_descritor_unidade", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_descritor_unidade")
	@Column(name="id_descritor_unidade")
	private Long idDescritorUnidade;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	private String valor;

	//bi-directional many-to-one association to DadosGerai
	@OneToMany(mappedBy="descritorUnidade")
	private List<DadosGerai> dadosGerais;

	//bi-directional many-to-one association to Descritor
	@ManyToOne
	@JoinColumn(name="id_descritor")
	private Descritor descritor;

	//bi-directional many-to-one association to UnidadeMedida
	@ManyToOne
	@JoinColumn(name="id_unidade_medida")
	private UnidadeMedida unidadeMedida;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	public DescritorUnidade() {
	}

	public Long getIdDescritorUnidade() {
		return this.idDescritorUnidade;
	}

	public void setIdDescritorUnidade(Long idDescritorUnidade) {
		this.idDescritorUnidade = idDescritorUnidade;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public String getValor() {
		return this.valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public List<DadosGerai> getDadosGerais() {
		return this.dadosGerais;
	}

	public void setDadosGerais(List<DadosGerai> dadosGerais) {
		this.dadosGerais = dadosGerais;
	}

	public DadosGerai addDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().add(dadosGerai);
		dadosGerai.setDescritorUnidade(this);

		return dadosGerai;
	}

	public DadosGerai removeDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().remove(dadosGerai);
		dadosGerai.setDescritorUnidade(null);

		return dadosGerai;
	}

	public Descritor getDescritor() {
		return this.descritor;
	}

	public void setDescritor(Descritor descritor) {
		this.descritor = descritor;
	}

	public UnidadeMedida getUnidadeMedida() {
		return this.unidadeMedida;
	}

	public void setUnidadeMedida(UnidadeMedida unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}