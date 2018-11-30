package br.ufrrj.auauspital.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufrrj.auauspital.dao.AnimalDao;
import br.ufrrj.auauspital.dao.DAO;
import br.ufrrj.auauspital.dao.ProntuarioDao;
import br.ufrrj.auauspital.dao.ProprietarioDao;
import br.ufrrj.auauspital.dao.UsuarioDao;
import br.ufrrj.auauspital.model.Animal;
import br.ufrrj.auauspital.model.Endereco;
import br.ufrrj.auauspital.model.Prontuario;
import br.ufrrj.auauspital.model.Proprietario;
import br.ufrrj.auauspital.model.Usuario;


@WebServlet("/main/cadastraanimal")
public class CadastraAnimal extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		boolean isEditarCadastrado = Boolean.parseBoolean(request.getParameter("isEditarCadastrado"));
		
		String logradouro = request.getParameter("logradouro");
		String complemento = request.getParameter("complemento");
		String cidade = request.getParameter("cidade");
		String uf = request.getParameter("uf");
		String cep = request.getParameter("cep");
		Endereco endereco = null;
		
		int idProprietario = Integer.parseInt(request.getParameter("idProprietario"));
		String nomeDono = request.getParameter("nomeDono");
		String cpf = request.getParameter("cpf");
		Proprietario proprietario = null;
		
		String nomePet = request.getParameter("nomePet");
		String tipo = request.getParameter("especie");
		int idade = Integer.parseInt(request.getParameter("idadePet"));
		String cor = request.getParameter("corPet");
		Animal animal = null;
		
		
		AnimalDao animalDao = new AnimalDao();
		ProprietarioDao proprietarioDao = new ProprietarioDao();
		ProntuarioDao prontuarioDao = new ProntuarioDao();
		
		/*
		 * Pega o membro (professor ou aluno) que fez o atendimento junto
		 * ao usuario que esta logado
		 */
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuarioLogado = (Usuario)request.getSession(false).getAttribute("usuario");
		int idMembro = Integer.parseInt(request.getParameter("idMembro"));
		Usuario membro = usuarioDao.findById(idMembro);
		
		/*
		 * Pega os dados relativos ao prontuario em si
		 */
		String motivo = request.getParameter("motivo");
		String prescricoes = request.getParameter("prescricoes");
		Date dataAtendimento = new Date();
		Date dataRetorno = null;
		String possuiDataRetorno = request.getParameter("yesno");
		
		if(possuiDataRetorno.equals("y")) {
			String dataRetornoParam = request.getParameter("dataRetorno");
			DateFormat format = new SimpleDateFormat("dd/MM/yyyy", new Locale("pt", "BR"));
			try {
				dataRetorno = format.parse(dataRetornoParam);
			} catch (ParseException e) {
				dataRetorno = null;
			}
		}
		
		Prontuario prontuario = null;
		
		boolean isProprietarioEditado = Boolean.parseBoolean(request.getParameter("isProprietarioEditado"));
		boolean isProprietarioNovoCadastrado = Boolean.parseBoolean(request.getParameter("isProprietarioNovoCadastrado"));
		boolean isProprietarioNovoAssociado = Boolean.parseBoolean(request.getParameter("isProprietarioNovoAssociado"));
		endereco = new Endereco(logradouro, cep, uf, cidade, complemento);
		
		DAO.begin();
		
		if(isProprietarioEditado) {
			proprietario = proprietarioDao.findById(idProprietario);
			proprietario.setCpf(cpf);
			proprietario.setNome(nomeDono);
			proprietario.setEndereco(endereco);
		}
		
		if(isProprietarioNovoCadastrado) {
			proprietario = new Proprietario(nomeDono, cpf, (byte)3, endereco);
			proprietarioDao.persist(proprietario);
		}
		
		if(isProprietarioNovoAssociado) {
			proprietario = proprietarioDao.findById(idProprietario);
		}
		
		/*
		 * Esta parte do IF realiza o cadastramento de um novo animal,
		 * senao, o else ativa para um animal que ja exista (operacao
		 * de update)
		 */		
		if(!isEditarCadastrado) {		
			animal = new Animal(nomePet, tipo, idade, cor, proprietario);
			animalDao.persist(animal);
		} else {
			int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
			animal = animalDao.findById(idAnimal);
			
			animal.setProprietario(proprietario);
			animal.setCor(cor);
			animal.setTipo(tipo);
			animal.setIdade(idade);
			animal.setNome(nomePet);
		}
		
		if(usuarioLogado.getTipo()==0) {
			/*
			 * define o professor como responsavel, e o membro e um aluno e,
			 * como foi o professor quem cadastrou, ja aprova o prontuario
			 * imediatamente.
			 */
			prontuario = new Prontuario(animal, dataRetorno, dataAtendimento, usuarioLogado, membro, true, motivo, prescricoes);
		} else {
			/*
			 * define o aluno como responsavel, e o membro e um professor e,
			 * como foi o aluno quem cadastrou, coloca o prontuario ainda como
			 * nao-aprovado
			 */
			prontuario = new Prontuario(animal, dataRetorno, dataAtendimento, membro, usuarioLogado, false, motivo, prescricoes);
		}
		
		prontuarioDao.persist(prontuario);
		DAO.commit();
		
		response.sendRedirect(request.getContextPath() + "/main/home.jsp");
		return;
	}


}
