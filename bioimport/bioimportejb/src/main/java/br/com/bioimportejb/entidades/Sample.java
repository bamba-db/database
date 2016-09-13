package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.eclipse.persistence.oxm.annotations.XmlInverseReference;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


/**
 * The persistent class for the sample database table.
 * 
 */
@Entity
@Table(name="biotecmar.sample")
@XmlRootElement
public class Sample implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id 
	@SequenceGenerator(name="pk_sample_sequence",sequenceName="biotecmar.sample_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="pk_sample_sequence")
	@Column(name="id", unique=true, nullable=false)
	private Long id;

	private BigDecimal depth;

	@Temporal(TemporalType.DATE)
	private Date dt;

	private String environment;

	private BigDecimal latitude;

	private BigDecimal longitude;

	private String name;

	//bi-directional one-to-one association to AbioticAnalysi
	@OneToOne(mappedBy="sample")
	@XmlInverseReference(mappedBy="sample")
	private AbioticAnalysi abioticAnalysi;

	//bi-directional one-to-one association to BenthicAnalysi
	@OneToOne(mappedBy="sample")
	@XmlTransient
	private BenthicAnalysi benthicAnalysi;

	//bi-directional one-to-one association to BioticAnalysi
	@OneToOne(mappedBy="sample")
	@XmlTransient
	private BioticAnalysi bioticAnalysi;

	//bi-directional one-to-one association to FishAssemblyAnalysi
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy="sample", cascade=CascadeType.ALL)
	private List<Occurrence> fishAssemblyAnalysi = new ArrayList<Occurrence>();

	public boolean addFishAssemblyAnalysi(Occurrence arg0) {
		return fishAssemblyAnalysi.add(arg0);
	}

	public boolean removeFishAssemblyAnalysi(Object arg0) {
		return fishAssemblyAnalysi.remove(arg0);
	}

	//bi-directional one-to-one association to MetagenomicAnalysi
	@OneToOne(mappedBy="sample")
	private MetagenomicAnalysi metagenomicAnalysi;

	//bi-directional many-to-one association to SampleType
	@ManyToOne
	@JoinColumn(name="type", referencedColumnName="type")
	private SampleType sampleType;
	
	@ManyToOne
	@JoinColumn(name="id_dataset", referencedColumnName="id_dataset")
	private DataSet dataSet;

	public Sample() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getDepth() {
		return this.depth;
	}

	public void setDepth(BigDecimal depth) {
		this.depth = depth;
	}

	public Date getDt() {
		return this.dt;
	}

	public void setDt(Date dt) {
		this.dt = dt;
	}

	public String getEnvironment() {
		return this.environment;
	}

	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	public BigDecimal getLatitude() {
		return this.latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public BigDecimal getLongitude() {
		return this.longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AbioticAnalysi getAbioticAnalysi() {
		return this.abioticAnalysi;
	}

	public void setAbioticAnalysi(AbioticAnalysi abioticAnalysi) {
		this.abioticAnalysi = abioticAnalysi;
	}

	public BenthicAnalysi getBenthicAnalysi() {
		return this.benthicAnalysi;
	}

	public void setBenthicAnalysi(BenthicAnalysi benthicAnalysi) {
		this.benthicAnalysi = benthicAnalysi;
	}

	public BioticAnalysi getBioticAnalysi() {
		return this.bioticAnalysi;
	}

	public void setBioticAnalysi(BioticAnalysi bioticAnalysi) {
		this.bioticAnalysi = bioticAnalysi;
	}

	public List<Occurrence> getFishAssemblyAnalysi() {
		return fishAssemblyAnalysi;
	}

	public void setFishAssemblyAnalysi(List<Occurrence> fishAssemblyAnalysi) {
		this.fishAssemblyAnalysi = fishAssemblyAnalysi;
	}

	public MetagenomicAnalysi getMetagenomicAnalysi() {
		return this.metagenomicAnalysi;
	}

	public void setMetagenomicAnalysi(MetagenomicAnalysi metagenomicAnalysi) {
		this.metagenomicAnalysi = metagenomicAnalysi;
	}

	public SampleType getSampleType() {
		return this.sampleType;
	}

	public void setSampleType(SampleType sampleType) {
		this.sampleType = sampleType;
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
		result = prime * result + ((depth == null) ? 0 : depth.hashCode());
		result = prime * result + ((dt == null) ? 0 : dt.hashCode());
		result = prime * result
				+ ((latitude == null) ? 0 : latitude.hashCode());
		result = prime * result
				+ ((longitude == null) ? 0 : longitude.hashCode());
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
		Sample other = (Sample) obj;
		if (depth == null) {
			if (other.depth != null)
				return false;
		} else if (!depth.equals(other.depth))
			return false;
		if (dt == null) {
			if (other.dt != null)
				return false;
		} else if (!dt.equals(other.dt))
			return false;
		if (latitude == null) {
			if (other.latitude != null)
				return false;
		} else if (!latitude.equals(other.latitude))
			return false;
		if (longitude == null) {
			if (other.longitude != null)
				return false;
		} else if (!longitude.equals(other.longitude))
			return false;
		return true;
	}
	
	

}