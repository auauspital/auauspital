package br.ufrrj.auauspital.model;

public class Usuario extends Pessoa {

	private int idUsuario;
	private String matricula;
	private String senha;
	private int tipo;

	public Usuario(String nome, String cpf) {
		super(nome, cpf);
	}
	
	public Usuario(String nome, String cpf, String matricula) {
		super(nome, cpf);
		this.matricula = matricula;
	}
	
	public Usuario(int idUsuario, String nome, String cpf, String matricula, String senha, int tipo) {
		super(nome, cpf);
		this.matricula = matricula;
		this.idUsuario = idUsuario;
		this.senha = senha;
		this.tipo = tipo;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

}