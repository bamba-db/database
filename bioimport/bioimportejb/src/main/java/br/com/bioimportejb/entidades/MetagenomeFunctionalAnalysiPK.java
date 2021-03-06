package br.com.bioimportejb.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * The primary key class for the metagenome_functional_analysis database table.
 * 
 */
@Embeddable
public class MetagenomeFunctionalAnalysiPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private Integer id;

	@Column(name="reference_db_id")
	private String referenceDbId;

	private String function;

	public MetagenomeFunctionalAnalysiPK() {
	}
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReferenceDbId() {
		return this.referenceDbId;
	}
	public void setReferenceDbId(String referenceDbId) {
		this.referenceDbId = referenceDbId;
	}
	public String getFunction() {
		return this.function;
	}
	public void setFunction(String function) {
		this.function = function;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof MetagenomeFunctionalAnalysiPK)) {
			return false;
		}
		MetagenomeFunctionalAnalysiPK castOther = (MetagenomeFunctionalAnalysiPK)other;
		return 
			this.id.equals(castOther.id)
			&& this.referenceDbId.equals(castOther.referenceDbId)
			&& this.function.equals(castOther.function);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.id.hashCode();
		hash = hash * prime + this.referenceDbId.hashCode();
		hash = hash * prime + this.function.hashCode();
		
		return hash;
	}
}