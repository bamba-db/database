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
 * The persistent class for the descritor database table.
 * 
 */
@Entity
@Table(name="descritor", schema="bio")
@NamedQuery(name="Descritor.findAll", query="SELECT d FROM Descritor d")
public class Descritor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="seq_descritor",sequenceName="bio.seq_descritor", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_descritor")
	@Column(name="id_descritor")
	private Long idDescritor;

	@Column(name="dsc_descritor")
	private String dscDescritor;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	@Column(name="tipo_descritor")
	private String tipoDescritor;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	//bi-directional many-to-one association to DescritorUnidade
	@OneToMany(mappedBy="descritor")
	private List<DescritorUnidade> descritorUnidades;

	public Descritor() {
	}

	public Long getIdDescritor() {
		return this.idDescritor;
	}

	public void setIdDescritor(Long idDescritor) {
		this.idDescritor = idDescritor;
	}

	public String getDscDescritor() {
		return this.dscDescritor;
	}

	public void setDscDescritor(String dscDescritor) {
		this.dscDescritor = dscDescritor;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public String getTipoDescritor() {
		return this.tipoDescritor;
	}

	public void setTipoDescritor(String tipoDescritor) {
		this.tipoDescritor = tipoDescritor;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<DescritorUnidade> getDescritorUnidades() {
		return this.descritorUnidades;
	}

	public void setDescritorUnidades(List<DescritorUnidade> descritorUnidades) {
		this.descritorUnidades = descritorUnidades;
	}

	public DescritorUnidade addDescritorUnidade(DescritorUnidade descritorUnidade) {
		getDescritorUnidades().add(descritorUnidade);
		descritorUnidade.setDescritor(this);

		return descritorUnidade;
	}

	public DescritorUnidade removeDescritorUnidade(DescritorUnidade descritorUnidade) {
		getDescritorUnidades().remove(descritorUnidade);
		descritorUnidade.setDescritor(null);

		return descritorUnidade;
	}

}