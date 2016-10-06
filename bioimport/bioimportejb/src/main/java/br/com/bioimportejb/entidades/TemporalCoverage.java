package br.com.bioimportejb.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name="biotecmar.temporal_coverage")
@XmlAccessorType(XmlAccessType.FIELD)
public class TemporalCoverage implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_temporal_coverage")
	private Long id;
	
	@Column(name="temporal_format")
	private String temporalFormat;
	
	@ManyToOne
	@JoinColumn(name="id_dataset", referencedColumnName="id_dataset")
	@XmlTransient
	private DataSet dataSet;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTemporalFormat() {
		return temporalFormat;
	}

	public void setTemporalFormat(String temporalFormat) {
		this.temporalFormat = temporalFormat;
	}

	public DataSet getDataSet() {
		return dataSet;
	}

	public void setDataSet(DataSet dataSet) {
		this.dataSet = dataSet;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dataSet == null) ? 0 : dataSet.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((temporalFormat == null) ? 0 : temporalFormat.hashCode());
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
		TemporalCoverage other = (TemporalCoverage) obj;
		if (dataSet == null) {
			if (other.dataSet != null)
				return false;
		} else if (!dataSet.equals(other.dataSet))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (temporalFormat == null) {
			if (other.temporalFormat != null)
				return false;
		} else if (!temporalFormat.equals(other.temporalFormat))
			return false;
		return true;
	}
	
}
