package br.ufrrj.auauspital.model;

import java.util.ArrayList;
import java.util.Date;

public class Prontuario {
	private int idProntuario;
	private Animal animal;
	private Date dataRetorno;
	private Date dataAtendimento;
	private ArrayList<String> motivos;
	private ArrayList<String> prescricoes;
	private Usuario professorResponsavel;
	private Usuario aluno;

	public Prontuario(int idProntuario, Animal animal, Date dataRetorno, Date dataAtendimento, ArrayList<String> motivos,
			ArrayList<String> prescricoes, Usuario professorResponsavel, Usuario aluno) {
		super();
		this.idProntuario = idProntuario;
		this.animal = animal;
		this.dataRetorno = dataRetorno;
		this.dataAtendimento = dataAtendimento;
		this.motivos = motivos;
		this.prescricoes = prescricoes;
		this.professorResponsavel = professorResponsavel;
		this.aluno = aluno;
	}

	public Animal getAnimal() {
		return animal;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}

	public Date getDataRetorno() {
		return dataRetorno;
	}

	public void setDataRetorno(Date dataRetorno) {
		this.dataRetorno = dataRetorno;
	}

	public Date getDataAtendimento() {
		return dataAtendimento;
	}

	public void setDataAtendimento(Date dataAtendimento) {
		this.dataAtendimento = dataAtendimento;
	}

	public ArrayList<String> getMotivos() {
		return motivos;
	}

	public void setMotivos(ArrayList<String> motivos) {
		this.motivos = motivos;
	}

	public ArrayList<String> getPrescricoes() {
		return prescricoes;
	}

	public void setPrescricoes(ArrayList<String> prescricoes) {
		this.prescricoes = prescricoes;
	}

	public Usuario getProfessorResponsavel() {
		return professorResponsavel;
	}

	public void setProfessorResponsavel(Usuario professorResponsavel) {
		this.professorResponsavel = professorResponsavel;
	}

	public Usuario getAluno() {
		return aluno;
	}

	public void setAluno(Usuario aluno) {
		this.aluno = aluno;
	}

}
