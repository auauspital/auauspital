package br.ufrrj.auauspital.model;

public class Usuario extends Pessoa {

	private String matricula;
	private String senha;

	public Usuario(int idUsuario, String nome, String cpf, int tipo) {
		super(idUsuario, nome, cpf, tipo);
	}
	
	public Usuario(int idUsuario, String nome, String cpf, String matricula, int tipo) {
		super(idUsuario, nome, cpf, tipo);
		this.matricula = matricula;
	}
	
	public Usuario(int idUsuario, String nome, String cpf, String matricula, String senha, int tipo) {
		super(idUsuario, nome, cpf, tipo);
		this.matricula = matricula;
		this.senha = senha;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}