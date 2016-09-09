package br.com.bioimportejb.util;

import java.io.File;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utilitario {

	private static Logger log = LoggerFactory.getLogger(Utilitario.class);
	
	public static final String DATE_PATTERN = "yyyyMMdd_hhmmss";
	
	public static String formatarData(Date data, String padrao){
		SimpleDateFormat df = new SimpleDateFormat(padrao);
		return df.format(data.getTime()).toString();
	}
	
	public static Date formatarStringParaData(String data, String padrao){
		SimpleDateFormat df = new SimpleDateFormat(padrao);
		try {
			return df.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date zerarHorario(Date date){
		Calendar calendar = Calendar.getInstance();  
	    calendar.setTime(date); //colocando o objeto Date no Calendar  
	    calendar.set(Calendar.HOUR_OF_DAY, 0); //zerando as horas, minuots e segundos..  
	    calendar.set(Calendar.MINUTE, 0);  
	    calendar.set(Calendar.SECOND, 0); 
	    date = calendar.getTime();
		return date;
	}
	
	public static Double formataNumeroDecimal(Double valor, int precisaoAposVirgula){
		
		String stringPrecisao = "0.";
		for(int i = 0; i < precisaoAposVirgula; i++){
			stringPrecisao += "0";
		}
		DecimalFormat decimalFormat = new DecimalFormat(stringPrecisao);
		return Double.parseDouble(decimalFormat.format(valor).replace(",","."));
	}
	
	public static String gerarSenha(Integer numeroCaracteres){
		String[] carcteresSenha ={"0","1","2","3","4","5","6","7","8","9",
					"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
					"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}; 
		String senha=""; 
		int posicaoCaracterSenha;
		while (senha.length() < numeroCaracteres){
			posicaoCaracterSenha = (int) (Math.random()*carcteresSenha.length); 
			senha += carcteresSenha[posicaoCaracterSenha]; 
		}
		
		return senha;
	}
	
	public static Calendar gerarDataExpiracaoSenha(){
		Calendar dataExpiracaoSenha = Calendar.getInstance();
		dataExpiracaoSenha.add(Calendar.HOUR_OF_DAY, 4);
		return dataExpiracaoSenha;
	}
	
	public static String acrescentarZeroAFrente(Integer quantidadeDigitos, String valorOriginal) {
		if(quantidadeDigitos > valorOriginal.length()) {
			try {
				return String.format("%0"+quantidadeDigitos+"d", Integer.parseInt(valorOriginal));
			} catch (NumberFormatException e) {
				log.error(e.getMessage(), e);
				return valorOriginal;
			}
		} else {
			return valorOriginal;
		}
	}
	
	public static String formatadarDataBR(Date data) {
    	String dataFormatada = "";
    	SimpleDateFormat lSimpleDateFormat = new SimpleDateFormat(DATE_PATTERN);    	
    	dataFormatada = lSimpleDateFormat.format(data); 
    	
    	return dataFormatada;
    }
	
	public static String obterExtensaoArquivo(File file){
		String nomeArquivo[] = file.getName().split("\\.");
		if(nomeArquivo.length > 0){
			return nomeArquivo[nomeArquivo.length-1];
		}
		return "";
	}
	
	public static void criarDiretorio(String caminho, String nomeDiretorio){
		File file = new File(caminho+nomeDiretorio);
		if(!file.exists()){
			file.mkdir();
		}
	}

	public static void renomearDiretorio(String caminho, String siglaNova, String siglaAntiga) {
		File diretorioAntigo = new File(caminho+siglaAntiga);
		File diretorioNovo = new File(caminho+siglaNova);
		
		if(diretorioAntigo.exists()){
			diretorioAntigo.renameTo(diretorioNovo);
		}else{
			diretorioNovo.mkdir();
		}
	}
	
}
