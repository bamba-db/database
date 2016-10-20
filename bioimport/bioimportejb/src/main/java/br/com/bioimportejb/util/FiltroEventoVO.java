package br.com.bioimportejb.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;

public class FiltroEventoVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long idEvento;
	
	private Calendar eventDate;	
	
	private BigDecimal decimalLatitude;	
	
	private BigDecimal decimalLongitude;
	
	private BigDecimal depth;

	public Long getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(Long idEvento) {
		this.idEvento = idEvento;
	}

	public Calendar getEventDate() {
		return eventDate;
	}

	public void setEventDate(Calendar eventDate) {
		this.eventDate = eventDate;
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

	public BigDecimal getDepth() {
		return depth;
	}

	public void setDepth(BigDecimal depth) {
		this.depth = depth;
	}
	
}
