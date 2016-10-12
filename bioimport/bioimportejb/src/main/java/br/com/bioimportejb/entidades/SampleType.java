package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonManagedReference;


/**
 * The persistent class for the sample_type database table.
 * 
 */
@Entity
@Table(name="biotecmar.sample_type")
public class SampleType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String type;

	//bi-directional many-to-one association to Sample
	@OneToMany(mappedBy="sampleType")
	@JsonManagedReference
	private List<Sample> samples;

	public SampleType() {
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Sample> getSamples() {
		return this.samples;
	}

	public void setSamples(List<Sample> samples) {
		this.samples = samples;
	}

}