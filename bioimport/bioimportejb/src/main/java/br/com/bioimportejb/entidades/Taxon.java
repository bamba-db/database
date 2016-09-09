package br.com.bioimportejb.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;


/**
 * The persistent class for the taxon database table.
 * 
 */
@Entity
@Table(name="biotecmar.taxon")
@XmlAccessorType(XmlAccessType.FIELD)
public class Taxon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id 
	@SequenceGenerator(name="pk_taxon_sequence",sequenceName="biotecmar.taxon_id_taxon_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="pk_taxon_sequence")
	@Column(name="id_taxon", unique=true, nullable=false)
	private Long idTaxon;

	@Column(name="class")
	private String class_;

	private String family;

	private String genus;

	private String infraspecificepithet;

	private String kingdom;

	@Column(name="ord")
	private String order;

	private String phylum;

	private String scientificname;

	private String species;

	private String taxonrank;

	private String taxonkey;	
	
	public Taxon() {
	}

	public Long getIdTaxon() {
		return this.idTaxon;
	}

	public void setIdTaxon(Long idTaxon) {
		this.idTaxon = idTaxon;
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getFamily() {
		return this.family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getGenus() {
		return this.genus;
	}

	public void setGenus(String genus) {
		this.genus = genus;
	}

	public String getInfraspecificepithet() {
		return this.infraspecificepithet;
	}

	public void setInfraspecificepithet(String infraspecificepithet) {
		this.infraspecificepithet = infraspecificepithet;
	}

	public String getKingdom() {
		return this.kingdom;
	}

	public void setKingdom(String kingdom) {
		this.kingdom = kingdom;
	}

	public String getOrder() {
		return this.order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getPhylum() {
		return this.phylum;
	}

	public void setPhylum(String phylum) {
		this.phylum = phylum;
	}

	public String getScientificname() {
		return this.scientificname;
	}

	public void setScientificname(String scientificname) {
		this.scientificname = scientificname;
	}

	public String getSpecies() {
		return this.species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getTaxonrank() {
		return this.taxonrank;
	}

	public void setTaxonrank(String taxonrank) {
		this.taxonrank = taxonrank;
	}
	
	public String getTaxonkey() {
		return taxonkey;
	}

	public void setTaxonkey(String taxonkey) {
		this.taxonkey = taxonkey;
	}

}