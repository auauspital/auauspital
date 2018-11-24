package br.ufrrj.auauspital.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Usuario extends Pessoa {

	@Column(nullable=false)
	private String matricula;
	@Column(length=16, nullable=false)
	private String senha;
	@OneToMany(mappedBy="professorResponsavel")
	private List<Prontuario> prontuariosProfessor;
	@OneToMany(mappedBy="aluno")
	private List<Prontuario> prontuariosAluno;
	
	public Usuario() {
		super();
	}

	public Usuario(int idUsuario, String nome, String cpf, byte tipo) {
		super(idUsuario, nome, cpf, tipo);
	}
	
	public Usuario(int idUsuario, String nome, String cpf, String matricula, byte tipo) {
		super(idUsuario, nome, cpf, tipo);
		this.matricula = matricula;
	}
	
	public Usuario(int idUsuario, String nome, String cpf, String matricula, String senha, byte tipo) {
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