package br.ufrrj.auauspital.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
	@ElementCollection
	@Column(nullable=false)
	private List<String> motivos;
	@ElementCollection
	@Column(nullable=false)
	private List<String> prescricoes;
	

	public Prontuario() {
		super();
	}
	
	public Prontuario(int idProntuario, Animal animal, Date dataRetorno, Date dataAtendimento, List<String> motivos,
			List<String> prescricoes, Usuario professorResponsavel, Usuario aluno) {
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

	public List<String> getMotivos() {
		return motivos;
	}

	public void setMotivos(List<String> motivos) {
		this.motivos = motivos;
	}

	public List<String> getPrescricoes() {
		return prescricoes;
	}

	public void setPrescricoes(List<String> prescricoes) {
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
