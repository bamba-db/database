package br.com.bioimportejb.util;

import java.io.Serializable;


/**
 * Classe craida para conter as mensagens que s�o fixas do projeto
 * 
 */
public class MensagensConstantes implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//Mensagens de erro
	public static final String ERRO_RECUPERACAO_ARQUIVO_LOG = "N�o foi poss�vel recuperar o arquivo de log";
	public static final String DRIVE_JDBC_NAO_ENCONTRADO = "N�o foi poss�vel encontrar o drive de conex�o JDBC";
	public static final String NAO_FOI_POSSIVEL_MONTAR_CONEXAO = "N�o foi poss�vel montar a conex�o com o banco, reveja sua conexao e o IP, login e senha do conexao.properties";
	public static final String ERRO_NO_SQL = "Erro na chamda SQL";
	public static final String ERRO_AO_FECHAR_RESULT_SET = "Erro ao fechar ResultSet";
	public static final String ERRO_AO_FECHAR_STATEMENT = "Erro ao fechar Statement";
	public static final String ERRO_AO_FECHAR_CONNECTION = "Erro ao fechar Connection";
	public static final String ERRO_ENVIO_EMAIL = "Ocorreu erro ao enviar e-mail";
	
}
