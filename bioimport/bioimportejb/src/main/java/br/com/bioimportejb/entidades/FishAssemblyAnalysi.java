package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.ForeignKey;


/**
 * The persistent class for the fish_assembly_analysis database table.
 * 
 */
@Entity
@Table(name="biotecmar.fish_assembly_analysis")
@XmlAccessorType(XmlAccessType.FIELD)
public class FishAssemblyAnalysi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id 
	@SequenceGenerator(name="pk_fish_sequence",sequenceName="biotecmar.fish_assembly_analysis_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="pk_fish_sequence")
	@Column(name="id", unique=true, nullable=false)
	private Integer id;

	private BigDecimal abundance;

	//bi-directional one-to-one association to Sample
	@ManyToOne
	@JoinColumn(name="id_sample")
	@XmlTransient
	private Sample sample;

	//bi-directional many-to-one association to Taxon
	@ManyToOne
	@JoinColumn(name="id_taxon")
	private Taxon taxon;
	
	@ManyToOne
	@JoinColumn(name="id_evento", referencedColumnName="id_evento")
	@ForeignKey(name="FK_FISH_EVENTO")
	private Evento evento;

	public FishAssemblyAnalysi() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getAbundance() {
		return this.abundance;
	}

	public void setAbundance(BigDecimal abundance) {
		this.abundance = abundance;
	}

	public Sample getSample() {
		return this.sample;
	}

	public void setSample(Sample sample) {
		this.sample = sample;
	}

	public Taxon getTaxon() {
		return this.taxon;
	}

	public void setTaxon(Taxon taxon) {
		this.taxon = taxon;
	}

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}
	
}