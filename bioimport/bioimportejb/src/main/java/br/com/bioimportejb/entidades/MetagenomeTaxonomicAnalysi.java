//package br.com.bioimportejb.entidades;
//
//import java.io.Serializable;
//import javax.persistence.*;
//import java.math.BigDecimal;
//
//
///**
// * The persistent class for the metagenome_taxonomic_analysis database table.
// * 
// */
//@Entity
//@Table(name="biotecmar.metagenome_taxonomic_analysis")
//public class MetagenomeTaxonomicAnalysi implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@EmbeddedId
//	private MetagenomeTaxonomicAnalysiPK id;
//
//	private BigDecimal abundance;
//
//	//bi-directional many-to-one association to MetagenomicAnalysi
//	@ManyToOne
//	@JoinColumn(name="id_meta_analysis")
//	private MetagenomicAnalysi metagenomicAnalysi;
//
//	public MetagenomeTaxonomicAnalysi() {
//	}
//
//	public MetagenomeTaxonomicAnalysiPK getId() {
//		return this.id;
//	}
//
//	public void setId(MetagenomeTaxonomicAnalysiPK id) {
//		this.id = id;
//	}
//
//	public BigDecimal getAbundance() {
//		return this.abundance;
//	}
//
//	public void setAbundance(BigDecimal abundance) {
//		this.abundance = abundance;
//	}
//
//	public MetagenomicAnalysi getMetagenomicAnalysi() {
//		return this.metagenomicAnalysi;
//	}
//
//	public void setMetagenomicAnalysi(MetagenomicAnalysi metagenomicAnalysi) {
//		this.metagenomicAnalysi = metagenomicAnalysi;
//	}
//
//}