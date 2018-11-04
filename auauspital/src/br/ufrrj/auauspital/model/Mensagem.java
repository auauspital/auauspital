package br.ufrrj.auauspital.model;

public class Mensagem {
	private String conteudo;
	private int tipo;
	
	public Mensagem(String conteudo, int tipo) {
		this.conteudo = conteudo;
		this.tipo = tipo;
	}
	
	public String getConteudo() {
		return this.conteudo;
	}
	
	public int getTipo() {
		return this.tipo;
	}
}
