package br.com.bioimportejb.util;

import java.io.Serializable;

public class FiltroMeasurementFactsVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long idMeasurementFacts;
	
	private String measurementType;
	
	private String measurementTypeID;
	
	private String measurementValue;
	
	private String measurementUnit;
	
	private String measurementUnitID;

	public Long getIdMeasurementFacts() {
		return idMeasurementFacts;
	}

	public void setIdMeasurementFacts(Long idMeasurementFacts) {
		this.idMeasurementFacts = idMeasurementFacts;
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
	
}
