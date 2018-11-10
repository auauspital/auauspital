package br.ufrrj.auauspital.model;

public class Animal {
	private int idAnimal;
	private String tipo;
	private String cor;
	private String nome;
	private int idade;
	private Proprietario proprietario;

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
