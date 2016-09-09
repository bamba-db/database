/*
 * Copyright 2013 Global Biodiversity Information Facility (GBIF)
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package br.com.bioimportejb.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.gbif.api.vocabulary.ContactType;
import org.gbif.api.vocabulary.Country;

@Entity
@Table(name="biotecmar.contact")
public class Contact implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_contato")
	private Long id;
	
	@Column(name="key_")
	private Integer key;
	
	@Column(name="type_")
	private String type;
	
	@Column(name="primary_")
	private Boolean primary;
	private String firstName;
	private String lastName;
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="id_contato", referencedColumnName="id_contato")
	private List<PosicaoContato> position = new ArrayList<PosicaoContato>();
	private String description;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="id_contato", referencedColumnName="id_contato")
	private List<Email> email = new ArrayList<Email>();
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="id_contato", referencedColumnName="id_contato")
	private List<Telefone> phone = new ArrayList<Telefone>();
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="id_contato", referencedColumnName="id_contato")
	private List<PaginaContato> homepage = new ArrayList<PaginaContato>();
	private String organization;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="id_contato", referencedColumnName="id_contato")
	private List<Endereco> address = new ArrayList<Endereco>();
	
	private String city;
	private String province;
	
	private String country;
	private String postalCode;
	private String createdBy;
	private String modifiedBy;
	private Date created;
	private Date modified;
	
	@ManyToOne
	@JoinColumn(name="id_dataset", referencedColumnName="id_dataset")
	private DataSet dataSet;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getKey() {
		return key;
	}

	public void setKey(Integer key) {
		this.key = key;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getPrimary() {
		return primary;
	}

	public void setPrimary(Boolean primary) {
		this.primary = primary;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<PosicaoContato> getPosition() {
		return position;
	}

	public void setPosition(List<PosicaoContato> position) {
		this.position = position;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Email> getEmail() {
		return email;
	}

	public void setEmail(List<Email> email) {
		this.email = email;
	}

	public List<Telefone> getPhone() {
		return phone;
	}

	public void setPhone(List<Telefone> phone) {
		this.phone = phone;
	}

	public List<PaginaContato> getHomepage() {
		return homepage;
	}

	public void setHomepage(List<PaginaContato> homepage) {
		this.homepage = homepage;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public List<Endereco> getAddress() {
		return address;
	}

	public void setAddress(List<Endereco> address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
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
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((key == null) ? 0 : key.hashCode());
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
		Contact other = (Contact) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (key == null) {
			if (other.key != null)
				return false;
		} else if (!key.equals(other.key))
			return false;
		return true;
	}

}
