package br.com.bioimportejb.util;

import java.io.Serializable;

public class GbifApiVO implements Serializable {

	private static final long serialVersionUID = 5154059711856132126L;
	
	public static String URL_API = "http://api.gbif.org/v1/dataset/";
	
	private String key;
	
	private String installationKey;
	
	private String publishingOrganizationKey;
	
	private String doi;
	
	private String external;
	
	private String type;
	
	private String title;
	
	private String description;
	
	private String language;
	
	private String homepage;
	
	private String logoUrl;
	
	

}
