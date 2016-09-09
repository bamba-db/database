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
 * The persistent class for the unidade_medida database table.
 * 
 */
@Entity
@Table(name="unidade_medida", schema="bio")
@NamedQuery(name="UnidadeMedida.findAll", query="SELECT u FROM UnidadeMedida u")
public class UnidadeMedida implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_unidade_medida",sequenceName="bio.seq_unidade_medida", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_unidade_medida")
	@Column(name="id_unidade_medida")
	private Long idUnidadeMedida;

	@Column(name="dsc_unidade_medida")
	private String dscUnidadeMedida;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	//bi-directional many-to-one association to DescritorUnidade
	@OneToMany(mappedBy="unidadeMedida")
	private List<DescritorUnidade> descritorUnidades;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	public UnidadeMedida() {
	}

	public Long getIdUnidadeMedida() {
		return this.idUnidadeMedida;
	}

	public void setIdUnidadeMedida(Long idUnidadeMedida) {
		this.idUnidadeMedida = idUnidadeMedida;
	}

	public String getDscUnidadeMedida() {
		return this.dscUnidadeMedida;
	}

	public void setDscUnidadeMedida(String dscUnidadeMedida) {
		this.dscUnidadeMedida = dscUnidadeMedida;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public List<DescritorUnidade> getDescritorUnidades() {
		return this.descritorUnidades;
	}

	public void setDescritorUnidades(List<DescritorUnidade> descritorUnidades) {
		this.descritorUnidades = descritorUnidades;
	}

	public DescritorUnidade addDescritorUnidade(DescritorUnidade descritorUnidade) {
		getDescritorUnidades().add(descritorUnidade);
		descritorUnidade.setUnidadeMedida(this);

		return descritorUnidade;
	}

	public DescritorUnidade removeDescritorUnidade(DescritorUnidade descritorUnidade) {
		getDescritorUnidades().remove(descritorUnidade);
		descritorUnidade.setUnidadeMedida(null);

		return descritorUnidade;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}