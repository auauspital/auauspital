package br.ufrrj.auauspital.dao;

public interface InterfaceDao<T> {
	public void persist(T obj);
	public void remove(T obj) ;
	public T merge(T obj);
	public void refresh(T obj);
}
