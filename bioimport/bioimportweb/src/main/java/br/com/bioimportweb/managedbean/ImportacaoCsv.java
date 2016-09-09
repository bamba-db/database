package br.com.bioimportweb.managedbean;
 
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opencsv.CSVReader;

import br.com.bioimportejb.bean.SampleBean;
import br.com.bioimportejb.bean.interfaces.TaxonLocal;
import br.com.bioimportejb.entidades.FishAssemblyAnalysi;
import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.ChaveSampleVO;
import br.com.bioimportweb.util.Util;
 
@ViewScoped
@ManagedBean(name="importacaoCsv")
public class ImportacaoCsv implements Serializable {
     
    /**
	 * 
	 */
	private static final long serialVersionUID = -7090737375321788764L;
	private UploadedFile file;
	private File arquivo;
 
	private Logger log = LoggerFactory.getLogger(getClass());
	@EJB
	private SampleBean sampleBean;
	
	@EJB
	private TaxonLocal taxonLocal;
	
	private List<Sample> listaSamples;
	
	private static final int PHYLUM = 20;

	private static final int KINGDOM = 19;
	
	private static final int CLASS = 21;
	private static final int ORDER = 22;
	private static final int FAMILY = 23;
	private static final int GENUS = 24;
	private static final int SPECIES = 8;
	private static final int INFRASPECIFICEPITHET = 9;
	private static final int TAXONRANK = 26;
	private static final int SCIENTIFICNAME = 18;
	private static final int COUNTRYCODE = 12;
	private static final int LOCALITY = 13;
	private static final int PUBLISHINGORGKEY = 14;
	private static final int DECIMALLATITUDE = 15;
	private static final int DECIMALLONGITUDE = 16;
	private static final int ELEVATION = 17;
	private static final int ELEVATIONACCURACY = 18;
	private static final int DEPTH = 19;
	private static final int MINIMUMDEPTHINMETERS = 13;
	private static final int DEPTHACCURACY = 20;
	private static final int EVENTDATE = 21;
	private static final int DAY = 22;
	private static final int MONTH = 23;
	private static final int YEAR = 24;
	private static final int TAXONKEY = 25;
	private static final int ID = 0;
	private static final int SPECIESKEY = 26;
	private static final int BASISOFRECORD = 27;
	private static final int INSTITUTIONCODE = 28;
	private static final int COLLECTIONCODE = 29;
	private static final int CATALOGNUMBER = 30;
	private static final int RECORDNUMBER = 31;
	private static final int IDENTIFIEDBY = 32;
	private static final int RIGHTS = 33;
	private static final int RIGHTSHOLDER = 34;
	private static final int RECORDEDBY = 35;
	private static final int TYPESTATUS = 36;
	private static final int ESTABLISHMENTMEANS = 37;
	private static final int LASTINTERPRETED = 38;
	private static final int MEDIATYPE = 39;
	private static final int ISSUE = 40;
	
	
	public Collection<Sample> lerCsv(InputStream inputStream) throws ExcecaoIntegracao {
		Map<ChaveSampleVO, Sample> samples = new HashMap<ChaveSampleVO, Sample>(); 
		CSVReader reader = null;
		try {
			 reader = new CSVReader(new InputStreamReader(inputStream), '\t');
			 String [] linha;
			 
			 int count = 0;
			 
			 while ((linha = reader.readNext()) != null) {
				if(count != 0) {
					Sample sample = new Sample();
					ChaveSampleVO chave = new ChaveSampleVO();
					int tamanhoLinha = linha.length;
					BigDecimal latitude = null;
					BigDecimal longitude = null;
					if(tamanhoLinha > DECIMALLATITUDE) { 
						latitude = new BigDecimal(linha[DECIMALLATITUDE]);
						sample.setLatitude(latitude);
						chave.setLatitude(latitude);
					}
					if(tamanhoLinha > DECIMALLONGITUDE) {
						longitude = new BigDecimal(linha[DECIMALLONGITUDE]);
						sample.setLongitude(longitude);
						chave.setLongitude(longitude);
					}
					
					if(tamanhoLinha > MINIMUMDEPTHINMETERS) {
						try {
							String depthString = linha[MINIMUMDEPTHINMETERS];
							if(depthString != null && !"".equals(depthString)) {
								BigDecimal depth = new BigDecimal(depthString);
								sample.setDepth(depth);
								chave.setDepth(depth);
							}
						} catch (Exception e) {
							log.error(e.getMessage(), e);
						}
					}
					
					Date data = dataCsv(linha);
					sample.setDt(data);
					chave.setData(data);
					
					Sample aux = samples.get(chave);
					if(aux != null) {
						sample = aux;
					}
					FishAssemblyAnalysi f = new FishAssemblyAnalysi();
			    	
			    	/**
			    	 * Sistema recupera o taxonkey da linha corrente
			    	 * E verifica se já recuperou algum dado taxonômico com o mesmo taxonkey
			    	 * Caso já exista recupera do Map, caso não cria um novo para sua persistência.
			    	 */
			    	String taxonkey = null;
			    	if(ID < tamanhoLinha) {
			    		taxonkey = linha[ID];
			    	}
			    	
			    	Taxon dTaxon = null;
			    	
			    	/**
			    	 * O sistema verifica se existe algum registro, com o taxonkey recuperado, no banco
			    	 * de dados. Caso exista atribui os valores recebidos neste objeto recuperado, e se caso não exista, 
			    	 * o sistema cria um novo para que futuramente possa ser persistido.
			    	 */
//			    	if(taxonkey != null) {
//						dTaxon = taxonLocal.buscarPorTaxonKey(taxonkey);
//			    	}  
			    	
			    	/**
			    	 * Caso o taxon ainda não exista no banco de dados, o sistema grava as informações do novo taxon
			    	 * encontrado.
			    	 */
			    	if(dTaxon == null) {
			    		dTaxon = new Taxon();
			    		dTaxon.setTaxonkey(taxonkey);
			    	 
			    	
						if(KINGDOM < tamanhoLinha) {
				    		dTaxon.setKingdom(linha[KINGDOM]);
				    	}
				    	
				    	if(PHYLUM < tamanhoLinha) {
				    		dTaxon.setPhylum(linha[PHYLUM]);
				    	}
				    	
				    	if(CLASS < tamanhoLinha) {
				    		dTaxon.setClass_(linha[CLASS]);
				    	}
				    	
				    	if(ORDER < tamanhoLinha) {
				    		dTaxon.setOrder(linha[ORDER]);
				    	}
				    	
				    	if(FAMILY < tamanhoLinha) {
				    		dTaxon.setFamily(linha[FAMILY]);
				    	}
				    	
				    	if(GENUS < tamanhoLinha) {
				    		dTaxon.setGenus(linha[GENUS]);
				    	}
				    	
				    	if(SPECIES < tamanhoLinha) {
				    		dTaxon.setSpecies(linha[SPECIES]);
				    	}
				    	
				    	if(INFRASPECIFICEPITHET < tamanhoLinha) {
				    		dTaxon.setInfraspecificepithet(linha[INFRASPECIFICEPITHET]);
				    	}
				    	
				    	if(TAXONRANK < tamanhoLinha) {
				    		dTaxon.setTaxonrank(linha[TAXONRANK]);
				    	}
				    	
				    	if(SCIENTIFICNAME < tamanhoLinha) {
				    		dTaxon.setScientificname(linha[SCIENTIFICNAME]);
				    	}
				    	
				    	dTaxon = taxonLocal.salvar(dTaxon);
			    	} 
			    	f.setTaxon(dTaxon);
			    	f.setSample(sample);
			    	
			    	sample.addFishAssemblyAnalysi(f);
			    	samples.put(chave, sample);
				}
				count ++;
			 }
		} catch (FileNotFoundException e) {
			log.error(e.getMessage(), e);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					throw new ExcecaoIntegracao(e);
				}
			}
		}
		return samples.values();  
	}
	private Date dataCsv(String[] linha) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date data = null;
		//TODO data = sdf.parse(linha[LASTINTERPRETED]);
		data = Calendar.getInstance().getTime();
		return data;
	}
	
    public UploadedFile getFile() {
        return file;
    }
 
    public void setFile(UploadedFile file) {
        this.file = file;
    }
     
    public void upload(FileUploadEvent fileUploadEvent) {
        
        file = fileUploadEvent.getFile();
       
    }
    
    public void importar() throws ExcecaoIntegracao {
    	try {
			listaSamples = new ArrayList<Sample>(); 
			listaSamples.addAll(lerCsv(getFile().getInputstream()));
			listaSamples = sampleBean.salvar(listaSamples);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect("Erro ao importar arquivo", null);
		}
    }

	public File getArquivo() {
		return arquivo;
	}

	public void setArquivo(File arquivo) {
		this.arquivo = arquivo;
	}

	public List<Sample> getListaSamples() {
		return listaSamples;
	}

	public void setListaSamples(List<Sample> listaSamples) {
		this.listaSamples = listaSamples;
	}
	
}