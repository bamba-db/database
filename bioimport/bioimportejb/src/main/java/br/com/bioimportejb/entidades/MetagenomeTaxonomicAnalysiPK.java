package br.com.bioimportejb.entidades;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the metagenome_taxonomic_analysis database table.
 * 
 */
@Embeddable
public class MetagenomeTaxonomicAnalysiPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String taxon;

	public MetagenomeTaxonomicAnalysiPK() {
	}
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTaxon() {
		return this.taxon;
	}
	public void setTaxon(String taxon) {
		this.taxon = taxon;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof MetagenomeTaxonomicAnalysiPK)) {
			return false;
		}
		MetagenomeTaxonomicAnalysiPK castOther = (MetagenomeTaxonomicAnalysiPK)other;
		return 
			this.id.equals(castOther.id)
			&& this.taxon.equals(castOther.taxon);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.id.hashCode();
		hash = hash * prime + this.taxon.hashCode();
		
		return hash;
	}
}