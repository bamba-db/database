package br.com.bioimportejb.entidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name="biotecmar.ator")
public class Ator implements Serializable{

	private static final long serialVersionUID = -1L;
	
	@Id
	@GenericGenerator(name="generatorAtor", strategy="increment")
	@GeneratedValue(generator="generatorAtor")
	@Column(name="id", nullable=false)
	private Long id;
	@Column(name="login", nullable=false)
	private String login;
	@Column(name="senha", nullable=false)
	private String senha;
	@Column(name="nome", nullable=false)
	private String nome;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

}
