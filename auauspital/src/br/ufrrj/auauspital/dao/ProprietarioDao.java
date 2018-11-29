package br.ufrrj.auauspital.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Proprietario;

public class ProprietarioDao extends DAO<Proprietario> {

	public List<Proprietario> findAll() {
		Query q = getManager().createQuery("SELECT p FROM Proprietario p");
		try {
			List<Proprietario> proprietarios = q.getResultList();
			return proprietarios;
		} catch(NoResultException e) {
			return null;
		}
	}

	public Proprietario findById(int id) {
		Query q = getManager().createQuery("SELECT p FROM Proprietario p WHERE p.idPessoa = :id");
		q.setParameter("id", id);
		Proprietario proprietario = (Proprietario)q.getSingleResult();
		return proprietario;
	}
	
}
