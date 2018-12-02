package br.ufrrj.auauspital.dao;

import java.util.List;
import java.util.ArrayList;

import javax.persistence.NoResultException;
import javax.persistence.Query;


import br.ufrrj.auauspital.model.Prontuario;
import br.ufrrj.auauspital.model.Usuario;

public class ProntuarioDao extends DAO<Prontuario> {
	public List<Prontuario> findPendentesAprovacao(Usuario professor) {
		Query q = getManager().createQuery("SELECT p FROM Prontuario p WHERE p.isAprovado = false AND p.professorResponsavel = :professor");
		q.setParameter("professor", professor);
		try {
			List<Prontuario> prontuarios = q.getResultList();
			return prontuarios;
		} catch(NoResultException e) {
			return null;
		}
	}

	public Prontuario findById(int idProntuario) {
		Query q = getManager().createQuery("SELECT p FROM Prontuario p WHERE p.idProntuario = :idProntuario");
		q.setParameter("idProntuario", idProntuario);
		Prontuario prontuario = (Prontuario) q.getSingleResult();
		return prontuario;
	}

	public ArrayList<Prontuario> findAllByProfessor() {
		Query q = getManager().createQuery("SELECT p FROM Prontuario p WHERE p.isAprovado = true ORDER BY p.professorResponsavel");
		try {
			ArrayList<Prontuario> prontuarios = (ArrayList<Prontuario>) q.getResultList();
			return prontuarios;
		} catch(NoResultException e) {
			return null;
		}
		
	}

	public ArrayList<Prontuario> findAllByAluno() {
		Query q = getManager().createQuery("SELECT p FROM Prontuario p WHERE p.isAprovado = true ORDER BY p.aluno ");
		try {
			ArrayList<Prontuario> prontuarios = (ArrayList<Prontuario>) q.getResultList();
			return prontuarios;
		} catch(NoResultException e) {
			return null;
		}
	}

	public ArrayList<Prontuario> findAllByAnimal() {
		Query q = getManager().createQuery("SELECT p FROM Prontuario p WHERE p.isAprovado = true ORDER BY p.animal ");
		try {
			ArrayList<Prontuario> prontuarios = (ArrayList<Prontuario>) q.getResultList();
			return prontuarios;
		} catch(NoResultException e) {
			return null;
		}
	}
	
	public ArrayList<Prontuario> findAllByAnimalData() {
		Query q = getManager().createQuery("SELECT p FROM Prontuario p WHERE p.isAprovado = true AND CURRENT_DATE - p.dataRetorno < 10 ORDER BY p.animal ");
		try {
			ArrayList<Prontuario> prontuarios = (ArrayList<Prontuario>) q.getResultList();
			return prontuarios;
		} catch(NoResultException e) {
			return null;
		}
	}
}