package br.com.bioimportejb.entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the benthic_analysis database table.
 * 
 */
@Entity
@Table(name="biotecmar.benthic_analysis")
public class BenthicAnalysi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	@Column(name="relative_abundance")
	private BigDecimal relativeAbundance;

	private String taxon;

	//bi-directional one-to-one association to Sample
	@OneToOne
	@JoinColumn(name="id_sample", referencedColumnName="id")
	private Sample sample;

	public BenthicAnalysi() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getRelativeAbundance() {
		return this.relativeAbundance;
	}

	public void setRelativeAbundance(BigDecimal relativeAbundance) {
		this.relativeAbundance = relativeAbundance;
	}

	public String getTaxon() {
		return this.taxon;
	}

	public void setTaxon(String taxon) {
		this.taxon = taxon;
	}

	public Sample getSample() {
		return this.sample;
	}

	public void setSample(Sample sample) {
		this.sample = sample;
	}

}