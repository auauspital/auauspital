package br.ufrrj.auauspital.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Animal {
	@Id
	@GeneratedValue
	private int idAnimal;
	@Column(nullable=false)
	private String tipo;
	@Column(nullable=false)
	private String cor;
	@Column(nullable=false)
	private String nome;
	@Column(nullable=false)
	private int idade;
	@ManyToOne
	private Proprietario proprietario;
	@OneToMany(mappedBy="animal")
	private List<Prontuario> prontuarios;
	
	public Animal() {
		super();
	}

	public Animal(int idAnimal, String tipo, String cor, String nome, int idade, Proprietario proprietario) {
		super();
		this.idAnimal = idAnimal;
		this.tipo = tipo;
		this.cor = cor;
		this.nome = nome;
		this.idade = idade;
		this.proprietario = proprietario;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public Proprietario getProprietario() {
		return proprietario;
	}

	public void setProprietario(Proprietario proprietario) {
		this.proprietario = proprietario;
	}

}
