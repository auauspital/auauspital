package br.ufrrj.auauspital.dao;

import java.util.List;

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
}
