package br.ufrrj.auauspital.model;

import java.util.ArrayList;

public class Proprietario extends Pessoa {

	private int idProprietario;
	private Endereco endereco;
	private ArrayList<Animal> animais;
	
	public Proprietario(String nome, String cpf) {
		super(nome, cpf);
	}
	
	public Proprietario(int idProprietario, String nome, String cpf, Endereco endereco, ArrayList<Animal> animais) {
		super(nome, cpf);
		this.endereco = endereco;
		this.animais = animais;
		this.idProprietario = idProprietario;
	}
	
	public void addAnimal(Animal animal) {
		this.animais.add(animal);
	}

	public ArrayList<Animal> getAnimais() {
		return animais;
	}

	public void setAnimais(ArrayList<Animal> animais) {
		this.animais = animais;
	}
}
