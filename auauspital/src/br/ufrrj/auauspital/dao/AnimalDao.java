package br.ufrrj.auauspital.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Prontuario;
import br.ufrrj.auauspital.model.Usuario;

public class AnimalDao extends DAO<Animal> {
	
	public Animal findById(int idAnimal) {
		Query q = getManager().createQuery("SELECT a FROM Animal a WHERE a.idAnimal = :idAnimal");
		q.setParameter("idAnimal", idAnimal);
		Animal animal = (Animal)q.getSingleResult();
		return animal;
	}
	
	public List<Animal> findAll() {
		Query q = getManager().createQuery("SELECT a FROM Animal a");
		try {
			List<Animal> animais = q.getResultList();
			return animais;
		} catch(NoResultException e) {
			return null;
		}
	}

	public ArrayList<Animal> findAllAnimal() {
		Query q = getManager().createQuery("SELECT a FROM Animal a");
		try {
			ArrayList<Animal> animais = (ArrayList<Animal>)q.getResultList();
			return animais;
		} catch(NoResultException e) {
			return null;
		}
	}

	
}
