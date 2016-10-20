package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.eclipse.persistence.oxm.annotations.XmlInverseReference;

@Entity
@Table(name="biotecmar.dataset")
@XmlRootElement
public class DataSet implements Serializable{

	private static final long serialVersionUID = 9001669138067445925L;

	@Id
	@SequenceGenerator(name="pk_dataset_sequence",sequenceName="biotecmar.id_dataset_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="pk_dataset_sequence")
	@Column(name="id_dataset")
	private Long id;	
	
	private String uuid;
	
	private String descricao;
	
	@OneToMany(mappedBy="dataSet", cascade=CascadeType.ALL)
	@JsonIgnore
	private Set<Contact> contatos;
	
	@Column(name="data_alt")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar dataAlt;
	
	@Column(name="pub_date")
	private Date pubDate;
	
	@Column(name="parent_dataset_key")
	private String parentDatasetKey;
	
	@Column(name="duplicate_of_dataset_key")
	private String duplicateOfDatasetKey;
	@Column(name="installation_key")
	private String installationKey;
	@Column(name="publishing_organization_key")
	private String publishingOrganizationKey;
	
	@Column(name="external_")
	private Boolean external;
	
	@Column(name="num_constituents")
	private Integer numConstituents;
	
	@Column(name="type_")
	private String type;
	
	@Column(name="sub_type")
	private String subtype;
	
	@Column(name="title", columnDefinition="text")
	private String title;
	
	@Column(name="alias", columnDefinition="text")
	private String alias;
	
	@Column(name="abbreviation", columnDefinition="text")
	private String abbreviation;
	
	@Column(name="description", columnDefinition="text")
	private String description;
	
	@Column(name="language_")
	private String language;
		
	@Column(name="homepage")
	private String homepage;
	
	@Column(name="rights")
	private String rights;
	
	@Column(name="create_by")
	private String createdBy;
	
	@Column(name="modified_by")
	private String modifiedBy;
	
	@Column(name="created")
	private Date created;
	
	@Column(name="modified")
	private Date modified;
	
	@Column(name="deleted")
	private Date deleted;

	@Column(name="geographic_coverage_desc")
	private String geographicCoverageDescription;
	
	@Column(name="project")
	private String project;
	
	@Column(name="purpose", columnDefinition="text")
	private String purpose;
	
	@Column(name="additionalInfo", columnDefinition="text")
	private String additionalInfo;

	@OneToMany(mappedBy="dataSet", cascade=CascadeType.ALL)
	private Set<GeospatialCoverage> geographicCoverages = new LinkedHashSet<GeospatialCoverage>();
	
	@OneToMany(mappedBy="dataSet", cascade=CascadeType.ALL)
	private Set<TemporalCoverage> temporalCoverages = new LinkedHashSet<TemporalCoverage>();
	
	public String getUuid() {
		
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Calendar getDataAlt() {
		return dataAlt;
	}

	public void setDataAlt(Calendar dataAlt) {
		this.dataAlt = dataAlt;
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
		DataSet other = (DataSet) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public Set<Contact> getContatos() {
		return contatos;
	}

	public void setContatos(Set<Contact> contatos) {
		this.contatos = contatos;
	}

	public Date getPubDate() {
		return pubDate;
	}

	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}

	public String getParentDatasetKey() {
		return parentDatasetKey;
	}

	public void setParentDatasetKey(String parentDatasetKey) {
		this.parentDatasetKey = parentDatasetKey;
	}

	public String getDuplicateOfDatasetKey() {
		return duplicateOfDatasetKey;
	}

	public void setDuplicateOfDatasetKey(String duplicateOfDatasetKey) {
		this.duplicateOfDatasetKey = duplicateOfDatasetKey;
	}

	public String getInstallationKey() {
		return installationKey;
	}

	public void setInstallationKey(String installationKey) {
		this.installationKey = installationKey;
	}

	public String getPublishingOrganizationKey() {
		return publishingOrganizationKey;
	}

	public void setPublishingOrganizationKey(String publishingOrganizationKey) {
		this.publishingOrganizationKey = publishingOrganizationKey;
	}

	public Boolean getExternal() {
		return external;
	}

	public void setExternal(Boolean external) {
		this.external = external;
	}

	public Integer getNumConstituents() {
		return numConstituents;
	}

	public void setNumConstituents(Integer numConstituents) {
		this.numConstituents = numConstituents;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSubtype() {
		return subtype;
	}

	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getRights() {
		return rights;
	}

	public void setRights(String rights) {
		this.rights = rights;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	public Date getDeleted() {
		return deleted;
	}

	public void setDeleted(Date deleted) {
		this.deleted = deleted;
	}

	public String getGeographicCoverageDescription() {
		return geographicCoverageDescription;
	}

	public void setGeographicCoverageDescription(String geographicCoverageDescription) {
		this.geographicCoverageDescription = geographicCoverageDescription;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	public Set<GeospatialCoverage> getGeographicCoverages() {
		return geographicCoverages;
	}

	public void setGeographicCoverages(Set<GeospatialCoverage> geographicCoverages) {
		this.geographicCoverages = geographicCoverages;
	}

	public Set<TemporalCoverage> getTemporalCoverages() {
		return temporalCoverages;
	}

	public void setTemporalCoverages(Set<TemporalCoverage> temporalCoverages) {
		this.temporalCoverages = temporalCoverages;
	}
	
}
