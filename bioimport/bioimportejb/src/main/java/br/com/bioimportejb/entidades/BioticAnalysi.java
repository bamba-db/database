//package br.com.bioimportejb.entidades;
//
//import java.io.Serializable;
//import javax.persistence.*;
//import java.math.BigDecimal;
//
//
///**
// * The persistent class for the biotic_analysis database table.
// * 
// */
//@Entity
//@Table(name="biotecmar.biotic_analysis")
//public class BioticAnalysi implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	private Integer id;
//
//	@Column(name="bacterial_count_cellml")
//	private BigDecimal bacterialCountCellml;
//
//	@Column(name="chlorophyll_a_ugl")
//	private BigDecimal chlorophyllAUgl;
//
//	@Column(name="pheophytin_ugl")
//	private BigDecimal pheophytinUgl;
//
//	//bi-directional one-to-one association to Sample
//	@OneToOne
//	@JoinColumn(name="id_sample", referencedColumnName="id")
//	private Sample sample;
//
//	public BioticAnalysi() {
//	}
//
//	public Integer getId() {
//		return this.id;
//	}
//
//	public void setId(Integer id) {
//		this.id = id;
//	}
//
//	public BigDecimal getBacterialCountCellml() {
//		return this.bacterialCountCellml;
//	}
//
//	public void setBacterialCountCellml(BigDecimal bacterialCountCellml) {
//		this.bacterialCountCellml = bacterialCountCellml;
//	}
//
//	public BigDecimal getChlorophyllAUgl() {
//		return this.chlorophyllAUgl;
//	}
//
//	public void setChlorophyllAUgl(BigDecimal chlorophyllAUgl) {
//		this.chlorophyllAUgl = chlorophyllAUgl;
//	}
//
//	public BigDecimal getPheophytinUgl() {
//		return this.pheophytinUgl;
//	}
//
//	public void setPheophytinUgl(BigDecimal pheophytinUgl) {
//		this.pheophytinUgl = pheophytinUgl;
//	}
//
//	public Sample getSample() {
//		return this.sample;
//	}
//
//	public void setSample(Sample sample) {
//		this.sample = sample;
//	}
//
//}