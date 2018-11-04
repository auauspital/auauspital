package br.ufrrj.auauspital.model;

public class Endereco {
	private String logradouro;
	private String cep;
	private String uf;
	private String cidade;
	private String complemento;

	public Endereco(String logradouro, String cep, String uf, String cidade, String complemento) {
		super();
		this.logradouro = logradouro;
		this.cep = cep;
		this.uf = uf;
		this.cidade = cidade;
		this.complemento = complemento;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

}
