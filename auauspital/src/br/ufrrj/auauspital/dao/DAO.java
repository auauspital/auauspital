package br.ufrrj.auauspital.dao;

import java.lang.reflect.ParameterizedType;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DAO<T> implements InterfaceDao<T> {
	protected static EntityManager manager;
	
	/*
	 * As operações de inicialização do DAO ficam aqui, como
	 * o open, o close, o getManager() e seu construtor, vazio.
	 */
	
	public DAO() {
		
	}
	
	protected static EntityManager getManager(){
		if(manager==null){
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("auauspital");
			manager = factory.createEntityManager();
		}
		return manager;
	}
	
	public static void open(){
		getManager();
	}
	
	public static void close(){
		if(manager != null) {
			manager = null;
		}
	}
	
	/*
	 * As operações responsáveis por manipular as transações
	 * ficam aqui.
	 */
	
	public static void begin() {
		if(!manager.getTransaction().isActive()) {
			manager.getTransaction().begin();
		}
	}
	
	public static void commit() {
		if(manager.getTransaction().isActive()){
			manager.getTransaction().commit();
			manager.clear();
		}
	}
	
	public static void flush() {
		manager.flush();
	}
	
	public static void rollback() {
		if(manager.getTransaction().isActive()) {
			manager.getTransaction().rollback();
		}
	}
	
	/*
	 * Os métodos da InterfaceDao são implementados aqui
	 */
	
	@Override
	public void persist(T obj) {
		manager.persist(obj);
	}

	@Override
	public void remove(T obj) {
		manager.persist(obj);
	}

	@Override
	public T merge(T obj) {
		return manager.merge(obj);
	}

	@Override
	public void refresh(T obj) {
		manager.refresh(obj);
	}
	
	@SuppressWarnings("unchecked")
	public T find(Object chave){
		Class<T> type = (Class<T>) ((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		return manager.find(type, chave);
	}

}
