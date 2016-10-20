//package br.com.bioimportejb.entidades;
//
//import java.io.Serializable;
//import javax.persistence.*;
//
//
///**
// * The persistent class for the metagenome_functional_analysis database table.
// * 
// */
//@Entity
//@Table(name="biotecmar.metagenome_functional_analysis")
//public class MetagenomeFunctionalAnalysi implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@EmbeddedId
//	private MetagenomeFunctionalAnalysiPK id;
//
//	//bi-directional many-to-one association to MetagenomicAnalysi
//	@ManyToOne
//	@JoinColumn(name="id_meta_analysis")
//	private MetagenomicAnalysi metagenomicAnalysi;
//
//	//bi-directional many-to-one association to ReferenceDb
//	@ManyToOne
//	@JoinColumn(name="reference_db_id", updatable=false, insertable=false)
//	private ReferenceDb referenceDb;
//
//	public MetagenomeFunctionalAnalysi() {
//	}
//
//	public MetagenomeFunctionalAnalysiPK getId() {
//		return this.id;
//	}
//
//	public void setId(MetagenomeFunctionalAnalysiPK id) {
//		this.id = id;
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
//	public ReferenceDb getReferenceDb() {
//		return this.referenceDb;
//	}
//
//	public void setReferenceDb(ReferenceDb referenceDb) {
//		this.referenceDb = referenceDb;
//	}
//
//}