package br.com.bioimportejb.entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the reference_db database table.
 * 
 */
@Entity
@Table(name="biotecmar.reference_db")
public class ReferenceDb implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	//bi-directional many-to-one association to MetagenomeFunctionalAnalysi
	@OneToMany(mappedBy="referenceDb")
	private List<MetagenomeFunctionalAnalysi> metagenomeFunctionalAnalysis;

	public ReferenceDb() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<MetagenomeFunctionalAnalysi> getMetagenomeFunctionalAnalysis() {
		return this.metagenomeFunctionalAnalysis;
	}

	public void setMetagenomeFunctionalAnalysis(List<MetagenomeFunctionalAnalysi> metagenomeFunctionalAnalysis) {
		this.metagenomeFunctionalAnalysis = metagenomeFunctionalAnalysis;
	}

}