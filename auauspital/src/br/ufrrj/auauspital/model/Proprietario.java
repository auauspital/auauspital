package br.ufrrj.auauspital.model;

import java.util.ArrayList;

public class Proprietario extends Pessoa {

	private Endereco endereco;
	private ArrayList<Animal> animais;
	
	public Proprietario(int idProprietario, String nome, String cpf, int tipo) {
		super(idProprietario, nome, cpf, tipo);
	}
	
	public Proprietario(int idProprietario, String nome, String cpf, Endereco endereco, ArrayList<Animal> animais, int tipo) {
		super(idProprietario, nome, cpf, tipo);
		this.endereco = endereco;
		this.animais = animais;
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
