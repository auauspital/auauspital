package br.ufrrj.auauspital.model;

public abstract class Pessoa {
	private int idPessoa;
	private String nome;
	private String cpf;
	private int tipo;

	public Pessoa(int idPessoa, String nome, String cpf, int tipo) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.cpf = cpf;
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
