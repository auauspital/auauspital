package br.ufrrj.auauspital.dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.ufrrj.auauspital.model.Usuario;

public class UsuarioDao extends DAO<Usuario> {
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
}
