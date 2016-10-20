//package br.com.bioimportejb.entidades;
//
//import java.io.Serializable;
//import javax.persistence.*;
//import java.util.List;
//
//
///**
// * The persistent class for the metagenomic_analysis database table.
// * 
// */
//@Entity
//@Table(name="biotecmar.metagenomic_analysis")
//public class MetagenomicAnalysi implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	private Integer id;
//
//	@Column(name="external_id")
//	private String externalId;
//
//	@Column(name="fasta_file_url")
//	private String fastaFileUrl;
//
//	//bi-directional many-to-one association to MetagenomeFunctionalAnalysi
//	@OneToMany(mappedBy="metagenomicAnalysi")
//	private List<MetagenomeFunctionalAnalysi> metagenomeFunctionalAnalysis;
//
//	//bi-directional many-to-one association to MetagenomeTaxonomicAnalysi
//	@OneToMany(mappedBy="metagenomicAnalysi")
//	private List<MetagenomeTaxonomicAnalysi> metagenomeTaxonomicAnalysis;
//
//	//bi-directional one-to-one association to Sample
//	@OneToOne
//	@JoinColumn(name="id_sample", referencedColumnName="id")
//	private Sample sample;
//
//	public MetagenomicAnalysi() {
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
//	public String getExternalId() {
//		return this.externalId;
//	}
//
//	public void setExternalId(String externalId) {
//		this.externalId = externalId;
//	}
//
//	public String getFastaFileUrl() {
//		return this.fastaFileUrl;
//	}
//
//	public void setFastaFileUrl(String fastaFileUrl) {
//		this.fastaFileUrl = fastaFileUrl;
//	}
//
//	public List<MetagenomeFunctionalAnalysi> getMetagenomeFunctionalAnalysis() {
//		return this.metagenomeFunctionalAnalysis;
//	}
//
//	public void setMetagenomeFunctionalAnalysis(List<MetagenomeFunctionalAnalysi> metagenomeFunctionalAnalysis) {
//		this.metagenomeFunctionalAnalysis = metagenomeFunctionalAnalysis;
//	}
//
//	public List<MetagenomeTaxonomicAnalysi> getMetagenomeTaxonomicAnalysis() {
//		return this.metagenomeTaxonomicAnalysis;
//	}
//
//	public void setMetagenomeTaxonomicAnalysis(List<MetagenomeTaxonomicAnalysi> metagenomeTaxonomicAnalysis) {
//		this.metagenomeTaxonomicAnalysis = metagenomeTaxonomicAnalysis;
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