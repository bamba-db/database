package br.com.bioimportejb.util;

import java.io.IOException;
import java.util.Properties;

public class Propriedades {
	
	private static final String CAMINHO_UPLOAD = "caminho.upload";
	
	private static final String CAMINHO_LOG = "caminho.log";
	
	private static final String DIRETORIO_UPLOAD_ARQUIVO_ABERTO = "diretorio.uploadArquivoAberto";
	
	private static Properties props;
	
	
	public static String caminhoUpload() throws IOException {
		return getProperty(CAMINHO_UPLOAD);
	}

	public static String caminhoLog() throws IOException {
		return getProperty(CAMINHO_LOG);
	}
	
	public static String diretorioUploadArquivoAberto() throws IOException{
		return getProperty(DIRETORIO_UPLOAD_ARQUIVO_ABERTO);
	}
	
	private static String getProperty(String property) throws IOException {
		if (props == null) {
			props = new Properties();
			
			try {
				props.load(Propriedades.class.getResourceAsStream("/bioimport.properties"));
				
			} catch (IOException e) {
//				log.fatal("Erro ao carregar o arquivo de configuração do AMCW.", e);
				throw e;
			}
		}
		
		return props.getProperty(property);
	}
		
	public static String getPropertyValue(String property){
		if (props == null) {
			props = new Properties();
			
			try {
				props.load(Propriedades.class.getResourceAsStream("/bioimport.properties"));
				
			} catch (IOException e) {
//				log.fatal("Erro ao carregar o arquivo de configuração do AMCW.", e);
			}
		}
		
		return props.getProperty(property);
	}
}
