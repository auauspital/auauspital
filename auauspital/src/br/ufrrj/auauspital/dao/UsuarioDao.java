package br.ufrrj.auauspital.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.ufrrj.auauspital.model.Usuario;

public class UsuarioDao extends DAO<Usuario> {
	
	public List<Usuario> findByTipo(byte tipo) {
		Query q = getManager().createQuery("SELECT u FROM Usuario u WHERE u.tipo = :tipo");
		q.setParameter("tipo", tipo);
		try {
			List<Usuario> usuarios = q.getResultList();
			return usuarios;
		} catch(NoResultException e) {
			return null;
		}
	}
	
	public Usuario findById(int idPessoa) {
		Query q = getManager().createQuery("SELECT u FROM Usuario u WHERE u.id = :idPessoa");
		q.setParameter("idPessoa", idPessoa);
		Usuario usuarioRes = (Usuario)q.getSingleResult();
		return usuarioRes;
	}
	
	public Usuario findLogin(Usuario usuario) {
		Query q = getManager().createQuery("SELECT u FROM Usuario u WHERE u.cpf = :cpf AND u.senha = :senha");
		q.setParameter("cpf", usuario.getCpf());
		q.setParameter("senha", usuario.getSenha());
		try {
			Usuario usuarioRes = (Usuario)q.getSingleResult();
			return usuarioRes;
		} catch(NoResultException e) {
			return null;
		}
	}

	public ArrayList<Usuario> findAllAlunos() {
		Query q = getManager().createQuery("SELECT u FROM Usuario u WHERE u.tipo=1");
		try {
			ArrayList<Usuario> alunos = (ArrayList<Usuario>)q.getResultList();
			return alunos;
		} catch(NoResultException e) {
			return null;
		}
	}
	
	public ArrayList<Usuario> findAllProfessor() {
		Query q = getManager().createQuery("SELECT u FROM Usuario u WHERE u.tipo = 0");
		try {
			ArrayList<Usuario> professores = (ArrayList<Usuario>)q.getResultList();
			return professores;
		} catch(NoResultException e) {
			return null;
		}
	}
}
