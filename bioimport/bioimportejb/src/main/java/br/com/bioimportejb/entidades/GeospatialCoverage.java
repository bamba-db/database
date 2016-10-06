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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name="biotecmar.geospatial_coverage")
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class GeospatialCoverage implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_geospatial_coverage")
	private Long id;
	
	@Column(name="min_latitude")
	private Double minLatitude;
	
	@Column(name="max_latitude")
	private Double maxLatitude;
	
	@Column(name="min_longitude")
	private Double minLongitude;
	
	@Column(name="max_longitude")
	private Double maxLongitude;
	
	@Column(name="global_coverage")
	private Boolean globalCoverage;
	
	@ManyToOne
	@JoinColumn(name="id_dataset", referencedColumnName="id_dataset")
	@XmlTransient
	private DataSet dataSet;
	

	public Double getMinLatitude() {
		return minLatitude;
	}

	public void setMinLatitude(Double minLatitude) {
		this.minLatitude = minLatitude;
	}

	public Double getMaxLatitude() {
		return maxLatitude;
	}

	public void setMaxLatitude(Double maxLatitude) {
		this.maxLatitude = maxLatitude;
	}

	public Double getMinLongitude() {
		return minLongitude;
	}

	public void setMinLongitude(Double minLongitude) {
		this.minLongitude = minLongitude;
	}

	public Double getMaxLongitude() {
		return maxLongitude;
	}

	public void setMaxLongitude(Double maxLongitude) {
		this.maxLongitude = maxLongitude;
	}

	public Boolean getGlobalCoverage() {
		return globalCoverage;
	}

	public void setGlobalCoverage(Boolean globalCoverage) {
		this.globalCoverage = globalCoverage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
		result = prime * result + ((globalCoverage == null) ? 0 : globalCoverage.hashCode());
		result = prime * result + ((maxLatitude == null) ? 0 : maxLatitude.hashCode());
		result = prime * result + ((maxLongitude == null) ? 0 : maxLongitude.hashCode());
		result = prime * result + ((minLatitude == null) ? 0 : minLatitude.hashCode());
		result = prime * result + ((minLongitude == null) ? 0 : minLongitude.hashCode());
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
		GeospatialCoverage other = (GeospatialCoverage) obj;
		if (globalCoverage == null) {
			if (other.globalCoverage != null)
				return false;
		} else if (!globalCoverage.equals(other.globalCoverage))
			return false;
		if (maxLatitude == null) {
			if (other.maxLatitude != null)
				return false;
		} else if (!maxLatitude.equals(other.maxLatitude))
			return false;
		if (maxLongitude == null) {
			if (other.maxLongitude != null)
				return false;
		} else if (!maxLongitude.equals(other.maxLongitude))
			return false;
		if (minLatitude == null) {
			if (other.minLatitude != null)
				return false;
		} else if (!minLatitude.equals(other.minLatitude))
			return false;
		if (minLongitude == null) {
			if (other.minLongitude != null)
				return false;
		} else if (!minLongitude.equals(other.minLongitude))
			return false;
		return true;
	}

}
