package br.ufrrj.auauspital.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Prontuario {
	@Id
	@GeneratedValue
	private int idProntuario;
	@ManyToOne
	private Animal animal;
	@ManyToOne
	private Usuario professorResponsavel;
	@ManyToOne
	private Usuario aluno;
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dataAtendimento;
	@Temporal(TemporalType.DATE)
	@Column(nullable=true)
	private Date dataRetorno;
	@Column(nullable=false, columnDefinition="TEXT")
	private String motivos;
	@Column(nullable=false, columnDefinition="TEXT")
	private String prescricoes;
	@Column(nullable=false)
	private boolean isAprovado;
	

	public Prontuario() {
		super();
	}
	
	public Prontuario(int idProntuario, Animal animal, Date dataRetorno, Date dataAtendimento, Usuario professorResponsavel, Usuario aluno, boolean isAprovado) {
		super();
		this.idProntuario = idProntuario;
		this.animal = animal;
		this.dataRetorno = dataRetorno;
		this.dataAtendimento = dataAtendimento;
		this.professorResponsavel = professorResponsavel;
		this.aluno = aluno;
		this.isAprovado = isAprovado;
	}
	
	public Prontuario(Animal animal, Date dataRetorno, Date dataAtendimento, Usuario professorResponsavel, Usuario aluno, boolean isAprovado, String motivos, String prescricoes) {
		super();
		this.animal = animal;
		this.dataRetorno = dataRetorno;
		this.dataAtendimento = dataAtendimento;
		this.professorResponsavel = professorResponsavel;
		this.aluno = aluno;
		this.isAprovado = isAprovado;
		this.motivos = motivos;
		this.prescricoes = prescricoes;
	}
	
	public int getIdProntuario() {
		return idProntuario;
	}

	public void setIdProntuario(int idProntuario) {
		this.idProntuario = idProntuario;
	}

	public boolean isAprovado() {
		return this.isAprovado;
	}
	
	public void setIsAprovado(boolean isAprovado) {
		this.isAprovado = isAprovado;
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

	public String getMotivos() {
		return motivos;
	}

	public void setMotivos(String motivos) {
		this.motivos = motivos;
	}

	public String getPrescricoes() {
		return prescricoes;
	}

	public void setPrescricoes(String prescricoes) {
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
