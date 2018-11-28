package br.ufrrj.auauspital.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Proprietario extends Pessoa {

	@Embedded
	private Endereco endereco;
	@OneToMany(mappedBy="proprietario")
	private List<Animal> animais;
	
	public Proprietario() {
		super();
	}
	
	public Proprietario(int idProprietario, String nome, String cpf, byte tipo) {
		super(idProprietario, nome, cpf, tipo);
	}
	
	public Proprietario(String nome, String cpf, byte tipo, Endereco endereco) {
		super(nome, cpf, tipo);
		this.endereco = endereco;
		this.animais = new ArrayList<Animal>();
	}
	
	public Proprietario(int idProprietario, String nome, String cpf, Endereco endereco, ArrayList<Animal> animais, byte tipo) {
		super(idProprietario, nome, cpf, tipo);
		this.endereco = endereco;
		this.animais = animais;
	}
	
	public void addAnimal(Animal animal) {
		this.animais.add(animal);
	}

	public List<Animal> getAnimais() {
		return animais;
	}

	public void setAnimais (ArrayList<Animal> animais) {
		this.animais = animais;
	}
}
