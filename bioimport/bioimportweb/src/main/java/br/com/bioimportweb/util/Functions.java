package br.com.bioimportweb.util;


public final class Functions {

    private Functions() {
        // Hide constructor.
    }

    public static String zerosEsquerda(Integer valor, Integer qtd) {
        String formato = "%0"+qtd+"d";
    	return String.format(formato, valor);
    }

}