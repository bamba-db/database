package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the dados_gerais database table.
 * 
 */
@Entity
@Table(name="dados_gerais", schema="bio")
@NamedQuery(name="DadosGerai.findAll", query="SELECT d FROM DadosGerai d")
public class DadosGerai implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_dados_gerais",sequenceName="bio.seq_dados_gerais", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_dados_gerais")
	@Column(name="id_dados_gerais")
	private Long idDadosGerais;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	private String valor;

	//bi-directional many-to-one association to Analise
	@ManyToOne
	@JoinColumn(name="id_analise")
	private Analise analise;

	//bi-directional many-to-one association to DescritorUnidade
	@ManyToOne
	@JoinColumn(name="id_descritor_unidade")
	private DescritorUnidade descritorUnidade;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	public DadosGerai() {
	}

	public Long getIdDadosGerais() {
		return this.idDadosGerais;
	}

	public void setIdDadosGerais(Long idDadosGerais) {
		this.idDadosGerais = idDadosGerais;
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

	public Analise getAnalise() {
		return this.analise;
	}

	public void setAnalise(Analise analise) {
		this.analise = analise;
	}

	public DescritorUnidade getDescritorUnidade() {
		return this.descritorUnidade;
	}

	public void setDescritorUnidade(DescritorUnidade descritorUnidade) {
		this.descritorUnidade = descritorUnidade;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}