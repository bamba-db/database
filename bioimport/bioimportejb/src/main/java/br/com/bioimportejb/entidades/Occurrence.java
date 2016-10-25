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

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.ForeignKey;


/**
 * The persistent class for the fish_assembly_analysis database table.
 * 
 */
@Entity
@Table(name="biotecmar.occurrence")
@XmlAccessorType(XmlAccessType.FIELD)
public class Occurrence implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id 
	@SequenceGenerator(name="pk_fish_sequence",sequenceName="biotecmar.fish_assembly_analysis_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="pk_fish_sequence")
	@Column(name="id", unique=true, nullable=false)
	private Long id;

	private BigDecimal abundance;

//	//bi-directional one-to-one association to Sample
//	@ManyToOne
//	@JoinColumn(name="id_sample")
//	@XmlTransient
//	@JsonBackReference
//	private Sample sample;

	//bi-directional many-to-one association to Taxon
	@ManyToOne
	@JoinColumn(name="id_taxon")
	private Taxon taxon;
	
	@ManyToOne
	@JoinColumn(name="id_evento", referencedColumnName="id_evento")
	@ForeignKey(name="FK_FISH_EVENTO")
	@XmlTransient
	@JsonIgnore
	private Evento evento;
	
	@Column(name="occurrence_id")
	private String occurrenceId;

	public Occurrence() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getAbundance() {
		return this.abundance;
	}

	public void setAbundance(BigDecimal abundance) {
		this.abundance = abundance;
	}

//	public Sample getSample() {
//		return this.sample;
//	}
//
//	public void setSample(Sample sample) {
//		this.sample = sample;
//	}

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

	public String getOccurrenceId() {
		return occurrenceId;
	}

	public void setOccurrenceId(String occurrenceId) {
		this.occurrenceId = occurrenceId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Occurrence other = (Occurrence) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	

}