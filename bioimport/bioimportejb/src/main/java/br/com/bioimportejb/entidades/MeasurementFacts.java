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

import org.hibernate.annotations.ForeignKey;

@Entity
@Table(name="biotecmar.measurement_facts")
public class MeasurementFacts implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_measurement_facts")
	private Long idMeasurementFacts;
	
	@Column(name="event_id")
	private String eventId;
	
	@Column(name="measurement_id")
	private String measurementID;
	
	@Column(name="occurrence_id")
	private String occurrenceID;
	
	@Column(name="measurement_type")
	private String measurementType;
	
	@Column(name="measurement_type_id")
	private String measurementTypeID;
	
	@Column(name="measurement_value")
	private String measurementValue;
	
	@Column(name="measurement_unit")
	private String measurementUnit;
	
	@Column(name="measurement_unit_id")
	private String measurementUnitID;
	
	@ManyToOne
	@JoinColumn(name="id_occurrence", referencedColumnName="id")
	private Occurrence occurrence;
	
	@ManyToOne
	@JoinColumn(name="id_evento", referencedColumnName="id_evento")
	@ForeignKey(name="FK_MEASUREMENT_EVENTO")
	private Evento evento;

	public Long getIdMeasurementFacts() {
		return idMeasurementFacts;
	}

	public void setIdMeasurementFacts(Long idMeasurementFacts) {
		this.idMeasurementFacts = idMeasurementFacts;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getMeasurementID() {
		return measurementID;
	}

	public void setMeasurementID(String measurementID) {
		this.measurementID = measurementID;
	}

	public String getOccurrenceID() {
		return occurrenceID;
	}

	public void setOccurrenceID(String occurrenceID) {
		this.occurrenceID = occurrenceID;
	}

	public String getMeasurementType() {
		return measurementType;
	}

	public void setMeasurementType(String measurementType) {
		this.measurementType = measurementType;
	}

	public String getMeasurementTypeID() {
		return measurementTypeID;
	}

	public void setMeasurementTypeID(String measurementTypeID) {
		this.measurementTypeID = measurementTypeID;
	}

	public String getMeasurementValue() {
		return measurementValue;
	}

	public void setMeasurementValue(String measurementValue) {
		this.measurementValue = measurementValue;
	}

	public String getMeasurementUnit() {
		return measurementUnit;
	}

	public void setMeasurementUnit(String measurementUnit) {
		this.measurementUnit = measurementUnit;
	}

	public String getMeasurementUnitID() {
		return measurementUnitID;
	}

	public void setMeasurementUnitID(String measurementUnitID) {
		this.measurementUnitID = measurementUnitID;
	}

	public Occurrence getOccurrence() {
		return occurrence;
	}

	public void setOccurrence(Occurrence occurrence) {
		this.occurrence = occurrence;
	}

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idMeasurementFacts == null) ? 0 : idMeasurementFacts.hashCode());
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
		MeasurementFacts other = (MeasurementFacts) obj;
		if (idMeasurementFacts == null) {
			if (other.idMeasurementFacts != null)
				return false;
		} else if (!idMeasurementFacts.equals(other.idMeasurementFacts))
			return false;
		return true;
	}

}
