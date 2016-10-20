package br.com.bioimportejb.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;

public class FiltroOccurrenceVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;

	private BigDecimal abundance;
	
	private Long idTaxon;

	private String class_;

	private String family;

	private String genus;

	private String infraspecificepithet;

	private String kingdom;

	private String order;

	private String phylum;

	private String scientificname;

	private String species;

	private String taxonrank;

	private String taxonkey;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getAbundance() {
		return abundance;
	}

	public void setAbundance(BigDecimal abundance) {
		this.abundance = abundance;
	}

	public Long getIdTaxon() {
		return idTaxon;
	}

	public void setIdTaxon(Long idTaxon) {
		this.idTaxon = idTaxon;
	}

	public String getClass_() {
		return class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getGenus() {
		return genus;
	}

	public void setGenus(String genus) {
		this.genus = genus;
	}

	public String getInfraspecificepithet() {
		return infraspecificepithet;
	}

	public void setInfraspecificepithet(String infraspecificepithet) {
		this.infraspecificepithet = infraspecificepithet;
	}

	public String getKingdom() {
		return kingdom;
	}

	public void setKingdom(String kingdom) {
		this.kingdom = kingdom;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getPhylum() {
		return phylum;
	}

	public void setPhylum(String phylum) {
		this.phylum = phylum;
	}

	public String getScientificname() {
		return scientificname;
	}

	public void setScientificname(String scientificname) {
		this.scientificname = scientificname;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getTaxonkey() {
		return taxonkey;
	}

	public void setTaxonkey(String taxonkey) {
		this.taxonkey = taxonkey;
	}

	public String getTaxonrank() {
		return taxonrank;
	}

	public void setTaxonrank(String taxonrank) {
		this.taxonrank = taxonrank;
	}
}
