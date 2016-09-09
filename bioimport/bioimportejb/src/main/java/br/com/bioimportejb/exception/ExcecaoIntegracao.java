package br.com.bioimportejb.exception;

public class ExcecaoIntegracao extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3311406565913132649L;

	public ExcecaoIntegracao() {
		super();
	}

	public ExcecaoIntegracao(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ExcecaoIntegracao(String message, Throwable cause) {
		super(message, cause);
	}

	public ExcecaoIntegracao(String message) {
		super(message);
	}

	public ExcecaoIntegracao(Throwable cause) {
		super(cause);
	}
	
	

}
