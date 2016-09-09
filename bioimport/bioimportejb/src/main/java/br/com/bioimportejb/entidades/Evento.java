package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="evento")
public class Evento implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_evento")
	private Long idEvento;
	
	@Column(name="event_id")
	private String eventID;
	
	@Column(name="sampling_protocol")
	private String samplingProtocol;	
	
	@Column(name="sample_size_value")
	private String sampleSizeValue;	
	
	@Column(name="sample_size_unit")
	private String sampleSizeUnit;
	
	@Column(name="event_date")
	private Calendar eventDate;	
	
	@Column(name="habitat")
	private String habitat;	
	
	@Column(name="country_code")
	private String countryCode;	
	
	@Column(name="decimal_latitude")
	private BigDecimal decimalLatitude;	
	
	@Column(name="decimal_longitude")
	private BigDecimal decimalLongitude;	
	
	@Column(name="geodetic_datum")
	private String geodeticDatum;	
	
	@Column(name="coord_uncertainty_meters")
	private Integer coordinateUncertaintyInMeters;	
	
	@Column(name="foot_print_wkt")
	private String footprintWKT;
	
	@OneToMany(mappedBy="evento")
	private List<FishAssemblyAnalysi> analysis;

	public Long getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(Long idEvento) {
		this.idEvento = idEvento;
	}

	public String getSamplingProtocol() {
		return samplingProtocol;
	}

	public void setSamplingProtocol(String samplingProtocol) {
		this.samplingProtocol = samplingProtocol;
	}

	public String getSampleSizeValue() {
		return sampleSizeValue;
	}

	public void setSampleSizeValue(String sampleSizeValue) {
		this.sampleSizeValue = sampleSizeValue;
	}

	public String getSampleSizeUnit() {
		return sampleSizeUnit;
	}

	public void setSampleSizeUnit(String sampleSizeUnit) {
		this.sampleSizeUnit = sampleSizeUnit;
	}

	public Calendar getEventDate() {
		return eventDate;
	}

	public void setEventDate(Calendar eventDate) {
		this.eventDate = eventDate;
	}

	public String getHabitat() {
		return habitat;
	}

	public void setHabitat(String habitat) {
		this.habitat = habitat;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public BigDecimal getDecimalLatitude() {
		return decimalLatitude;
	}

	public void setDecimalLatitude(BigDecimal decimalLatitude) {
		this.decimalLatitude = decimalLatitude;
	}

	public BigDecimal getDecimalLongitude() {
		return decimalLongitude;
	}

	public void setDecimalLongitude(BigDecimal decimalLongitude) {
		this.decimalLongitude = decimalLongitude;
	}

	public String getGeodeticDatum() {
		return geodeticDatum;
	}

	public void setGeodeticDatum(String geodeticDatum) {
		this.geodeticDatum = geodeticDatum;
	}

	public Integer getCoordinateUncertaintyInMeters() {
		return coordinateUncertaintyInMeters;
	}

	public void setCoordinateUncertaintyInMeters(Integer coordinateUncertaintyInMeters) {
		this.coordinateUncertaintyInMeters = coordinateUncertaintyInMeters;
	}

	public String getFootprintWKT() {
		return footprintWKT;
	}

	public void setFootprintWKT(String footprintWKT) {
		this.footprintWKT = footprintWKT;
	}
	

	public String getEventID() {
		return eventID;
	}

	public void setEventID(String eventID) {
		this.eventID = eventID;
	}
	

	public List<FishAssemblyAnalysi> getAnalysis() {
		return analysis;
	}

	public void setAnalysis(List<FishAssemblyAnalysi> analysis) {
		this.analysis = analysis;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idEvento == null) ? 0 : idEvento.hashCode());
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
		Evento other = (Evento) obj;
		if (idEvento == null) {
			if (other.idEvento != null)
				return false;
		} else if (!idEvento.equals(other.idEvento))
			return false;
		return true;
	}

}
