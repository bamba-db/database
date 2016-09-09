package br.com.bioimportejb.entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the area database table.
 * 
 */
@Entity
@Table(name="biotecmar.area")
public class Area implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;

	private String name;

	@Column(name="nw_latitude")
	private BigDecimal nwLatitude;

	@Column(name="nw_longitude")
	private BigDecimal nwLongitude;

	@Column(name="se_latitude")
	private BigDecimal seLatitude;

	@Column(name="se_longitude")
	private BigDecimal seLongitude;

	public Area() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getNwLatitude() {
		return this.nwLatitude;
	}

	public void setNwLatitude(BigDecimal nwLatitude) {
		this.nwLatitude = nwLatitude;
	}

	public BigDecimal getNwLongitude() {
		return this.nwLongitude;
	}

	public void setNwLongitude(BigDecimal nwLongitude) {
		this.nwLongitude = nwLongitude;
	}

	public BigDecimal getSeLatitude() {
		return this.seLatitude;
	}

	public void setSeLatitude(BigDecimal seLatitude) {
		this.seLatitude = seLatitude;
	}

	public BigDecimal getSeLongitude() {
		return this.seLongitude;
	}

	public void setSeLongitude(BigDecimal seLongitude) {
		this.seLongitude = seLongitude;
	}

}