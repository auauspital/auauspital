package br.ufrrj.auauspital.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Pessoa {
	
	@Id
	@GeneratedValue
	private int idPessoa;
	@Column(nullable=false)
	private String nome;
	@Column(length=11, nullable=false)
	private String cpf;
	@Column(nullable=false)
	private byte tipo;

	public Pessoa() {
		super();
	}
	
	public Pessoa(String cpf) {
		this.cpf = cpf;
	}
	
	public Pessoa(int idPessoa, String nome, String cpf, byte tipo) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.cpf = cpf;
		this.tipo = tipo;
	}
	
	public Pessoa(String nome, String cpf, byte tipo) {
		this.nome = nome;
		this.cpf = cpf;
		this.tipo = tipo;
	}
	
	public int getId() {
		return this.idPessoa;
	}
	
	public byte getTipo() {
		return tipo;
	}
	
	public void setTipo(byte tipo) {
		this.tipo = tipo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
}
