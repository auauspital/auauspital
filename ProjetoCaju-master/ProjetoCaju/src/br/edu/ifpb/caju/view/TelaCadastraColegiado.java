package br.edu.ifpb.caju.view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.toedter.calendar.JDateChooser;

import br.edu.ifpb.caju.controller.Sistema;
import br.edu.ifpb.caju.model.Colegiado;



@SuppressWarnings("serial")
public class TelaCadastraColegiado extends JDialog{
	private Sistema sys = new Sistema();
	private final JPanel contentPanel = new JPanel();
	@SuppressWarnings("unused")
	private Colegiado colegiado;
	private JDateChooser dateChooser;
	
	/**
	 * Launch the application.
	 **/
	
	public static void main(String[] args) {
		try {
			TelaCadastraColegiado dialog = new TelaCadastraColegiado(null);
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Create the dialog.
	 * @wbp.parser.constructor
	 **/
	
	public TelaCadastraColegiado(TelaMenu tela,Colegiado colegiado){//verificar tipos
		super(tela,"Cadastro de Colegiado",true);
		this.colegiado = colegiado;
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(null);
		contentPanel.setBounds(0, 0, 434, 262);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel);
		contentPanel.setLayout(null);
		
		//Falta ver os outros atributos
		//--
		JLabel lbldataIni = new JLabel("DataInicio:");
		lbldataIni.setBounds(143, 90, 71, 14);
		contentPanel.add(lbldataIni);
		//---
		JButton btnCadastrar = new JButton("Atualizar");
		btnCadastrar.setBounds(143, 225, 98, 26);
		btnCadastrar.addActionListener(new AtualizarListener());
		contentPanel.add(btnCadastrar);
		
		JButton btnConcluir = new JButton("Concluir");
		btnConcluir.setBounds(277, 225, 98, 26);
		btnConcluir.addActionListener(new ConcluidoListener());
		contentPanel.add(btnConcluir);
		
		dateChooser = new JDateChooser();
		dateChooser.getCalendarButton().addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		dateChooser.setBounds(201, 84, 87, 20);
		contentPanel.add(dateChooser);
	}
	
	public TelaCadastraColegiado(JFrame tela) { //verificar tipos
		super(tela,"Cadastro de Colegiado",true);
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(null);
		contentPanel.setBounds(0, 0, 434, 262);
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel);
		contentPanel.setLayout(null);
		
		//Falta ver os outros atributos
		//--
		JLabel lbldataIni = new JLabel("DataInicio:");
		lbldataIni.setBounds(143, 90, 71, 14);
		contentPanel.add(lbldataIni);
		//---
		JButton btnCadastrar = new JButton("Cadastrar");
		btnCadastrar.setBounds(143, 225, 98, 26);
		btnCadastrar.addActionListener(new CadastrarListener());
		contentPanel.add(btnCadastrar);
		
		JButton btnConcluir = new JButton("Concluir");
		btnConcluir.setBounds(277, 225, 98, 26);
		btnConcluir.addActionListener(new ConcluidoListener());
		contentPanel.add(btnConcluir);
		
		dateChooser = new JDateChooser();
		dateChooser.getCalendarButton().addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		dateChooser.setBounds(201, 84, 87, 20);
		contentPanel.add(dateChooser);
		
	}
	
	public TelaCadastraColegiado classe() {
		return this;
	}
	
	private class AtualizarListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			try{
//				SistemaColegiado sys = new SistemaColegiado(); //verificar tipos
			/*	colegiado.setDataIni(dataIni.getText());
				colegiado.setDataFim(dataFim.getText());
				colegiado.setAtivo(ativo.getText());*/
//				sys.editaColegiado(colegiado);
//				JOptionPane.showMessageDialog(classe(), "Colegiado Atualizado com Sucesso!");
//				dispose();
			}catch(Exception ex){
//				JOptionPane.showMessageDialog(classe(), "Erro ao Atualizar o Colegiado!");
			}
			
		}
		
	}
	
	private class CadastrarListener implements ActionListener{//verificar tipos.

		@Override
		public void actionPerformed(ActionEvent e) {
			try{
//				
				sys.cadastraColegiado(dateChooser.getDate());
				JOptionPane.showMessageDialog(classe(), "Colegiado Cadastrado com Sucesso!");
				dispose();
			}catch(Exception ex){
				JOptionPane.showMessageDialog(classe(), "Erro ao cadastrar o Colegiado!");
			}
			
			
		}
		
	}
	private class ConcluidoListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			dispose();
		}
		
	}
}
