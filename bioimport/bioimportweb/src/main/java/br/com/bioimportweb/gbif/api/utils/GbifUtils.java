package br.com.bioimportweb.gbif.api.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.commons.lang.StringUtils;
import org.gbif.api.model.registry.Contact;
import org.gbif.api.model.registry.Dataset;
import org.gbif.api.model.registry.Endpoint;
import org.gbif.api.model.registry.eml.geospatial.BoundingBox;
import org.gbif.api.service.registry.DatasetService;
import org.gbif.api.vocabulary.EndpointType;
import org.gbif.dwc.record.Record;
import org.gbif.dwc.terms.DwcTerm;
import org.gbif.dwc.text.Archive;
import org.gbif.dwc.text.ArchiveFactory;
import org.gbif.registry.metadata.parse.DatasetParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opencsv.CSVReader;

import br.com.bioimportejb.bean.SampleBean;
import br.com.bioimportejb.bean.interfaces.DataSetLocal;
import br.com.bioimportejb.bean.interfaces.EventoLocal;
import br.com.bioimportejb.bean.interfaces.MeasurementFactsLocal;
import br.com.bioimportejb.bean.interfaces.OccurrenceLocal;
import br.com.bioimportejb.bean.interfaces.TaxonLocal;
import br.com.bioimportejb.entidades.DataSet;
import br.com.bioimportejb.entidades.Email;
import br.com.bioimportejb.entidades.Endereco;
import br.com.bioimportejb.entidades.Evento;
import br.com.bioimportejb.entidades.GeospatialCoverage;
import br.com.bioimportejb.entidades.MeasurementFacts;
import br.com.bioimportejb.entidades.Occurrence;
import br.com.bioimportejb.entidades.PaginaContato;
import br.com.bioimportejb.entidades.PosicaoContato;
import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.entidades.Telefone;
import br.com.bioimportejb.entidades.TemporalCoverage;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.ChaveSampleVO;
import br.com.bioimportejb.util.ChaveTaxonVO;
import br.com.bioimportweb.util.SampleOcorrenceVO;
import br.com.bioimportweb.util.Util;

public class GbifUtils implements Serializable {

	private static final String FILE_EVENT = "event.txt";

	private static final String FILE_OCCURRENCE = "occurrence.txt";
	
	private static final String FILE_MEASUREMENT_OR_FACTS_1 = "measurementorfact.txt";
	private static final String FILE_MEASUREMENT_OR_FACTS_2 = "extendedmeasurementorfact.txt";
	

	private static final String ARQ_TMP_PROP = "/arquivosTemporarios.properties";

	private static final long serialVersionUID = 5552011572435565843L;

	private static final String FILE_EML = "eml.xml";

	private Properties prop;
	
	private static GbifUtils instance;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	public static GbifUtils getInstance() {
      if(instance == null) {
         instance = new GbifUtils();
      }
      return instance;
   }
	
	private TaxonLocal taxonLocal;
	
	public SampleOcorrenceVO montarSamples(Archive arq, DataSet dataset, Map<String, Evento> eventos) throws ExcecaoIntegracao {
		CSVReader reader = null;
		Map<ChaveSampleVO, Sample> samples = new HashMap<ChaveSampleVO, Sample>();
		Map<String, Occurrence> ocorrencias = new HashMap<String, Occurrence>();
		try {
			SampleBean sampleBean = (SampleBean ) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/SampleBean");
			taxonLocal = (TaxonLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/TaxonBean");
			OccurrenceLocal occurrenceLocal = (OccurrenceLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/OccurrenceBean");
			 Iterator<Record> iterator = arq.getCore().iterator();
			 while (iterator.hasNext()) {
				 	Record r = iterator.next();
					Sample sample = new Sample();
					sample.setDataSet(dataset);
					ChaveSampleVO chave = new ChaveSampleVO();
					BigDecimal latitude = null;
					BigDecimal longitude = null;
					if(arq.getCore().hasTerm(DwcTerm.decimalLatitude)) { 
						latitude = new BigDecimal(r.value(DwcTerm.decimalLatitude));
						sample.setLatitude(latitude);
						chave.setLatitude(latitude);
					}
					if(arq.getCore().hasTerm(DwcTerm.decimalLongitude)) {
						longitude = new BigDecimal(r.value(DwcTerm.decimalLongitude));
						sample.setLongitude(longitude);
						chave.setLongitude(longitude);
					}
					
					if(arq.getCore().hasTerm(DwcTerm.minimumDepthInMeters)) {
						try {
							String depthString = r.value(DwcTerm.minimumDepthInMeters);
							if(StringUtils.isNotBlank(depthString)) {
								BigDecimal depth = new BigDecimal(depthString);
								sample.setDepth(depth);
								chave.setDepth(depth);
							}
						} catch (Exception e) {
							log.error(e.getMessage(), e);
						}
					}
					
					//TODO ver se há como recuperar a data, até então sistema grava a data do sample caso não tenha a data.
					Date dataSample = null;
					
					if(arq.getCore().hasTerm(DwcTerm.eventDate)) {
						String value = r.value(DwcTerm.eventDate);
						if(StringUtils.isNotEmpty(value)) {
							SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
							dataSample = sdf.parse(value);
						}
					}
					
					if(dataSample == null && dataset != null) {
						dataSample = dataset.getDataAlt().getTime();
					}
					sample.setDt(dataSample);
					chave.setData(dataSample);
					
					Sample aux = samples.get(chave);
					if(aux != null) {
						sample = aux;
					}
					Occurrence o = new Occurrence();
					
					if(eventos != null) {
						if(arq.getCore().hasTerm(DwcTerm.eventID)) {
							String eventId = r.value(DwcTerm.eventID);
							if(eventId != null) {
								o.setEvento(eventos.get(eventId));
							}
						}
					}
			    	
			    	/**
			    	 * Sistema recupera o taxonkey da linha corrente
			    	 * E verifica se já recuperou algum dado taxonômico com o mesmo taxonkey
			    	 * Caso já exista recupera do Map, caso não cria um novo para sua persistência.
			    	 */
			    	
			    	Taxon dTaxon = null;
			    	
			    	/**
			    	 * O sistema verifica se existe algum registro, com o taxonkey recuperado, no banco
			    	 * de dados. Caso exista atribui os valores recebidos neste objeto recuperado, e se caso não exista, 
			    	 * o sistema cria um novo para que futuramente possa ser persistido.
			    	 */
//			    	if(taxonkey != null) {
//						dTaxon = taxonLocal.buscarPorTaxonKey(taxonkey);
//			    	}  
			    	
			    	ChaveTaxonVO chaveTaxonVO = new ChaveTaxonVO();
			    	if(arq.getCore().hasTerm(DwcTerm.kingdom)) {
			    		chaveTaxonVO.setKingdom(r.value(DwcTerm.kingdom));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.phylum)) {
			    		chaveTaxonVO.setPhylum(r.value(DwcTerm.phylum));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.class_)) {
			    		chaveTaxonVO.setClass_(r.value(DwcTerm.class_));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.order)) {
			    		chaveTaxonVO.setOrder(r.value(DwcTerm.order));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.family)) {
			    		chaveTaxonVO.setFamily(r.value(DwcTerm.family));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.order)) {
			    		chaveTaxonVO.setGenus(r.value(DwcTerm.order));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.scientificName)) {
			    		chaveTaxonVO.setSpecies(r.value(DwcTerm.scientificName));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.infraspecificEpithet)) {
			    		chaveTaxonVO.setInfraspecificepithet(r.value(DwcTerm.infraspecificEpithet));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.taxonRank)) {
			    		chaveTaxonVO.setTaxonrank(r.value(DwcTerm.taxonRank));
			    	}
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.scientificName)) {
			    		chaveTaxonVO.setScientificname(r.value(DwcTerm.scientificName));
			    	}
			    	
			    	dTaxon = taxonLocal.buscarPorChaveTaxon(chaveTaxonVO);
			    	/**
			    	 * Caso o taxon ainda não exista no banco de dados, o sistema grava as informações do novo taxon
			    	 * encontrado.
			    	 */
			    	if(dTaxon == null) {
			    		dTaxon = new Taxon();
			    		//dTaxon.setTaxonkey(taxonkey);
			    	 
			    		dTaxon.setKingdom(chaveTaxonVO.getKingdom());
				    	
			    		dTaxon.setPhylum(chaveTaxonVO.getPhylum());
				    	
			    		dTaxon.setClass_(chaveTaxonVO.getClass_());
				    	
			    		dTaxon.setOrder(chaveTaxonVO.getOrder());
				    	
			    		dTaxon.setFamily(chaveTaxonVO.getFamily());
				    	
			    		dTaxon.setGenus(chaveTaxonVO.getGenus());
				    	
			    		dTaxon.setSpecies(chaveTaxonVO.getSpecies());
				    	
			    		dTaxon.setInfraspecificepithet(chaveTaxonVO.getInfraspecificepithet());
				    	
			    		dTaxon.setTaxonrank(chaveTaxonVO.getTaxonrank());
				    	
			    		dTaxon.setScientificname(chaveTaxonVO.getScientificname());
				    	
				    	dTaxon = taxonLocal.salvar(dTaxon);
			    	} 
			    	o.setTaxon(dTaxon);
			    	
			    	if(arq.getCore().hasTerm(DwcTerm.occurrenceID)) {
			    		o.setOccurrenceId(r.value(DwcTerm.occurrenceID));
			    	}
			    	
			    	
			    	o.setSample(sample);
			    	//sample.addFishAssemblyAnalysi(o);
			    	samples.put(chave, sample);
			    	sample = sampleBean.salvar(sample);
			    	
			    	o.setSample(sample);
			    	o = occurrenceLocal.salvarOccurrence(o);
			    	ocorrencias.put(o.getOccurrenceId(), o);
			    	
			 }
		} catch (NamingException e1) {
			log.error(e1.getMessage(), e1);
			throw new ExcecaoIntegracao(e1);
		} catch (ParseException e) {
			log.error(e.getMessage(), e);
			throw new ExcecaoIntegracao(e);
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					throw new ExcecaoIntegracao(e);
				}
			}
		}
		
		SampleOcorrenceVO sampleOcorrenceVO = new SampleOcorrenceVO();
		sampleOcorrenceVO.setSamples(samples.values());
		sampleOcorrenceVO.setOcorrencias(ocorrencias);
		return sampleOcorrenceVO;  
	}
	private Date dataCsv(String[] linha) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date data = null;
		//TODO data = sdf.parse(linha[LASTINTERPRETED]);
		data = Calendar.getInstance().getTime();
		return data;
	}
	
	public void processarDataSet(String uuid) throws MalformedURLException, ExcecaoIntegracao {
		try {
			DatasetService ds = RegistryWsClientFactoryGuice.webserviceClientReadOnly().getInstance(DatasetService.class);
			UUID uuidString = UUID.fromString(uuid);
			Dataset dataset = ds.get(uuidString);
			
			
			Endpoint endPointDwcArquive = null;
			Calendar data = Calendar.getInstance();
			if(dataset.getPubDate() != null) {
				data.setTime(dataset.getPubDate());
			}
			
			DataSetLocal datasetLocal = (DataSetLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/DataSetBean");
		
			
			boolean atualizar = datasetLocal.verificarAtualizacao(uuid, data);
			atualizar = true;
			if(atualizar) {
				for(Endpoint e : dataset.getEndpoints()) {
					if(EndpointType.DWC_ARCHIVE.equals(e.getType())) {
						endPointDwcArquive = e;
					}
					

				}
				
				DataSet datasetSistema = datasetLocal.buscarPorUuid(uuid);
				if(datasetSistema == null) {
					datasetSistema = new DataSet();
					datasetSistema.setUuid(uuid);
				}
				converterDataSet(dataset, data, datasetSistema);
				datasetLocal.salvar(datasetSistema);
				if (endPointDwcArquive != null && endPointDwcArquive.getUrl() != null) {
					processaZipPorUrl(endPointDwcArquive.getUrl().toURL(), datasetSistema);
				}
			}
		} catch (NamingException e1) {
			throw new ExcecaoIntegracao(e1);
		}
	}
	private void converterDataSet(Dataset dataset, Calendar data, DataSet datasetSistema) {
		datasetSistema.setAbbreviation(dataset.getAbbreviation());
		datasetSistema.setAdditionalInfo(dataset.getAdditionalInfo());
		datasetSistema.setAlias(dataset.getAlias());
		Set<br.com.bioimportejb.entidades.Contact> contatos = new LinkedHashSet<br.com.bioimportejb.entidades.Contact>();
		
		converterContatos(dataset, datasetSistema, contatos);
		datasetSistema.setCreated(dataset.getCreated());
		datasetSistema.setCreatedBy(dataset.getCreatedBy());
		datasetSistema.setDeleted(dataset.getDeleted()); ;
		datasetSistema.setDescription(dataset.getDescription()); 
		if (dataset.getDuplicateOfDatasetKey() != null) {
			datasetSistema.setDuplicateOfDatasetKey(dataset.getDuplicateOfDatasetKey().toString());
		}
		datasetSistema.setExternal(dataset.isExternal()); 
		datasetSistema.setGeographicCoverageDescription(dataset.getGeographicCoverageDescription()); 
		converterGeospatial(dataset, datasetSistema); 
		if (dataset.getHomepage() != null) {
			datasetSistema.setHomepage(dataset.getHomepage().toString());
		}
		if (dataset.getInstallationKey() != null) {
			datasetSistema.setInstallationKey(dataset.getInstallationKey().toString());
		}
		if (dataset.getLanguage() != null) {
			datasetSistema.setLanguage(dataset.getLanguage().toString());
		}
		datasetSistema.setModified(dataset.getModified()); 
		datasetSistema.setModifiedBy(dataset.getModifiedBy()); 
		datasetSistema.setNumConstituents(dataset.getNumConstituents()); 
		if (dataset.getParentDatasetKey() != null) {
			datasetSistema.setParentDatasetKey(dataset.getParentDatasetKey().toString());
		}
		if (dataset.getProject() != null) {
			datasetSistema.setProject(dataset.getProject().getTitle());
		}
		datasetSistema.setPubDate(dataset.getPubDate());
		if (dataset.getPublishingOrganizationKey() != null) {
			datasetSistema.setPublishingOrganizationKey(dataset.getPublishingOrganizationKey().toString());
		}
		datasetSistema.setPurpose(dataset.getPurpose());
		datasetSistema.setRights(dataset.getRights());
		if (dataset.getSubtype() != null) {
			datasetSistema.setSubtype(dataset.getSubtype().name());
		}
		Set<TemporalCoverage> temporalCoverages = new LinkedHashSet<TemporalCoverage>();
		for(org.gbif.api.model.registry.eml.temporal.TemporalCoverage t : dataset.getTemporalCoverages()) {
			Collection<String> keywords = t.toKeywords();
			StringBuilder tempWords = new StringBuilder();
			if(keywords != null && !keywords.isEmpty()) {
				TemporalCoverage temporalCoverage = new TemporalCoverage();
				temporalCoverage.setDataSet(datasetSistema);
			
				for(String k : keywords) {
					tempWords.append(k);
					tempWords.append(";");
				}
				temporalCoverage.setTemporalFormat(tempWords.toString());
				temporalCoverages.add(temporalCoverage);
			}
			
		}
		datasetSistema.setTemporalCoverages(temporalCoverages);
		datasetSistema.setTitle(dataset.getTitle());
		if (dataset.getType() != null) {
			datasetSistema.setType(dataset.getType().name());
		}
		datasetSistema.setDataAlt(data);
	}
	private void converterGeospatial(Dataset dataset, DataSet datasetSistema) {
		Set<GeospatialCoverage> geographicCoverages = new LinkedHashSet<GeospatialCoverage>();
		for(org.gbif.api.model.registry.eml.geospatial.GeospatialCoverage geoCover : dataset.getGeographicCoverages()) {
			BoundingBox boundingBox = geoCover.getBoundingBox();
			if(boundingBox != null) {
				GeospatialCoverage geospatialCoverage = new GeospatialCoverage();
				geospatialCoverage.setDataSet(datasetSistema);
				geospatialCoverage.setGlobalCoverage(boundingBox.isGlobalCoverage());
				geospatialCoverage.setMaxLatitude(boundingBox.getMaxLatitude());
				geospatialCoverage.setMaxLongitude(boundingBox.getMaxLongitude());
				geospatialCoverage.setMinLatitude(boundingBox.getMinLatitude());
				geospatialCoverage.setMinLongitude(boundingBox.getMinLongitude());
				geographicCoverages.add(geospatialCoverage);
			}
		}
		datasetSistema.setGeographicCoverages(geographicCoverages);
	}
	private void converterContatos(Dataset dataset, DataSet datasetSistema,
			Set<br.com.bioimportejb.entidades.Contact> contatos) {
		for(Contact c : dataset.getContacts()) {
			br.com.bioimportejb.entidades.Contact contact = new br.com.bioimportejb.entidades.Contact();
			Set<Endereco> address = new LinkedHashSet<br.com.bioimportejb.entidades.Endereco>();
			for(String a : c.getAddress()) {
				Endereco e = new Endereco();
				e.setEndereco(a);
				address.add(e);
			}
			contact.setAddress(address);
			contact.setCity(c.getCity());
			if (c.getCountry() != null) {
				contact.setCountry(c.getCountry().name());
			}
			contact.setCreated(c.getCreated());
			contact.setCreatedBy(c.getCreatedBy());
			contact.setDataSet(datasetSistema);
			contact.setDescription(c.getDescription());
			Set<Email> emails = new LinkedHashSet<Email>();
			for(String e : c.getEmail()) {
				Email email = new Email();
				email.setEmail(e);
				emails.add(email);
			}
			contact.setEmail(emails);
			contact.setFirstName(c.getFirstName());
			Set<PaginaContato> paginasContato = new LinkedHashSet<PaginaContato>();
			for(URI hpage : c.getHomepage()) {
				PaginaContato pc = new PaginaContato();
				pc.setPagina(hpage.toString());
				paginasContato.add(pc);
			}
			contact.setHomepage(paginasContato);
			contact.setKey(c.getKey());
			contact.setLastName(c.getLastName());
			contact.setModified(c.getModified());
			contact.setModifiedBy(c.getModifiedBy());
			contact.setOrganization(c.getOrganization());
			Set<Telefone> telefones = new LinkedHashSet<Telefone>();
			for(String t : c.getPhone()) {
				Telefone tel = new Telefone();
				tel.setTelefone(t);
				telefones.add(tel);
			}
			contact.setPhone(telefones);
			Set<PosicaoContato> posicoesContato = new LinkedHashSet<PosicaoContato>();
			for(String pos : c.getPosition()) {
				PosicaoContato posicao = new PosicaoContato();
				posicao.setPosicao(pos);
				posicoesContato.add(posicao);
			}
			contact.setPosition(posicoesContato);
			contact.setPostalCode(c.getPostalCode());
			contact.setPrimary(c.isPrimary());
			contact.setProvince(c.getProvince());
			if (c.getType() != null) {
				contact.setType(c.getType().name());
			}
			
			contatos.add(contact);
		}
		datasetSistema.setContatos(contatos);
	}
	
	public void processaZipPorUrl(URL url, DataSet dataset) throws ExcecaoIntegracao {
	    
	    try {
	    	String diretorioTmp = getProp().getProperty("diretorio.temporario");
	        URLConnection conn = url.openConnection();
	        InputStream in = conn.getInputStream();
	        String nomeDiretorio = diretorioTmp;
	        
	        File f = new File(nomeDiretorio);
	        if(!f.exists()) {
	        	f.mkdirs();
	        }
	        
			String nomeArquivo = nomeDiretorio + File.separator + Calendar.getInstance().getTimeInMillis();
			String nomeZip = nomeArquivo + ".zip";
			FileOutputStream out = new FileOutputStream(nomeZip);
	        byte[] b = new byte[1024];
	        int count;
	        while ((count = in.read(b)) >= 0) {
	            out.write(b, 0, count);
	        }
	        out.flush(); out.close(); in.close();    
	        
	        unZipIt(nomeZip, nomeArquivo, diretorioTmp);
	        
	        Map<String, Evento> eventos = null;
	        File fileEventos = new File(nomeArquivo + File.separator + FILE_EVENT);
	        if(fileEventos.exists()) {
		        Archive arqEventos = ArchiveFactory.openArchive(fileEventos);
		        eventos = montarEventos(arqEventos);
		        
	        }
	        
	        File fileOcorrencias = new File(nomeArquivo + File.separator + FILE_OCCURRENCE);
	        
	        Archive arq = ArchiveFactory.openArchive(fileOcorrencias);
	        
	       
	        
			Collection<Sample> samples = montarSamples(arq, dataset, eventos).getSamples();
			gravarSamples(samples);
			
			new File(nomeDiretorio).delete();
	        
	    } catch (IOException e) {
	        log.error(e.getMessage(), e);
	        throw new ExcecaoIntegracao(e);
		}
	}
	
    public Collection<Sample> processaZip(InputStream in) throws ExcecaoIntegracao {
	    
	    try {
	    	String diretorioTmp = getProp().getProperty("diretorio.temporario");
	        String nomeDiretorio = diretorioTmp;
	        
	        File f = new File(nomeDiretorio);
	        if(!f.exists()) {
	        	f.mkdirs();
	        }
	        
			String nomeArquivo = nomeDiretorio + File.separator + Calendar.getInstance().getTimeInMillis();
			String nomeZip = nomeArquivo + ".zip";
			FileOutputStream out = new FileOutputStream(nomeZip);
	        byte[] b = new byte[1024];
	        int count;
	        while ((count = in.read(b)) >= 0) {
	            out.write(b, 0, count);
	        }
	        out.flush(); out.close(); in.close();    
	        
	        unZipIt(nomeZip, nomeArquivo, diretorioTmp);
	        
	        String caminhoEml = nomeArquivo + File.separator + FILE_EML;
	        
	        Dataset d=DatasetParser.build(new FileInputStream(new File(caminhoEml)));
	        DataSet datasetSistema = new DataSet();
	        converterDataSet(d, Calendar.getInstance(), datasetSistema);
	        DataSetLocal datasetLocal = (DataSetLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/DataSetBean");
	        datasetSistema = datasetLocal.salvar(datasetSistema);
	        
	        Map<String, Evento> eventos = null;
	        File fileEventos = new File(nomeArquivo + File.separator + FILE_EVENT);
	        if(fileEventos.exists()) {
		        Archive arqEventos = ArchiveFactory.openArchive(fileEventos);
		        eventos = montarEventos(arqEventos);
		        
	        }
	        
	        File fileOcorrencias = new File(nomeArquivo + File.separator + FILE_OCCURRENCE);
	        
	        SampleOcorrenceVO sampleOcurrenceVO = null;
	        if(fileEventos.exists()) {
	        	Archive arq = ArchiveFactory.openArchive(fileOcorrencias);
	        	sampleOcurrenceVO = montarSamples(arq, datasetSistema, eventos);
				if(sampleOcurrenceVO == null) {
					sampleOcurrenceVO = new SampleOcorrenceVO();
				}
				Collection<Sample> samples = sampleOcurrenceVO.getSamples();
	        }
	       
	        
			
			//gravarSamples(samples);
			
			Map<String, List<MeasurementFacts>> medidas = null;
	        File fileMedidas = new File(nomeArquivo + File.separator + FILE_MEASUREMENT_OR_FACTS_1);
	        if(fileMedidas.exists()) {
	        	
		        Archive arqMedidas = ArchiveFactory.openArchive(fileMedidas);
		        medidas = montarMedidas(arqMedidas, eventos, sampleOcurrenceVO.getOcorrencias());
	        } else {
	        	fileMedidas = new File(nomeArquivo + File.separator + FILE_MEASUREMENT_OR_FACTS_2);
	        	if(fileMedidas.exists()) {
		        	Archive arqMedidas = ArchiveFactory.openArchive(fileMedidas);
		        	medidas = montarMedidas(arqMedidas, eventos, sampleOcurrenceVO.getOcorrencias());
	        	}
	        }
			
			new File(nomeDiretorio).delete();
	        
			return sampleOcurrenceVO.getSamples();
	    } catch (IOException e) {
	        log.error(e.getMessage(), e);
	        throw new ExcecaoIntegracao(e);
		} catch (NamingException e) {
			log.error(e.getMessage(), e);
	        throw new ExcecaoIntegracao(e);
		}
	}
	
	private Map<String, List<MeasurementFacts>> montarMedidas(Archive arq, Map<String, Evento> eventos,
			Map<String, Occurrence> ocorrencias) throws ExcecaoIntegracao {
		CSVReader reader = null;
		Map<String, List<MeasurementFacts>> medidas = new HashMap<String, List<MeasurementFacts>>();
		try {
			MeasurementFactsLocal measurementFactsLocal = (MeasurementFactsLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/MeasurementFactsBean");
			 Iterator<Record> iterator = arq.getCore().iterator();
			 while (iterator.hasNext()) {
				 	Record r = iterator.next();
					MeasurementFacts m = new MeasurementFacts();
					String eventId = r.id();
					
					Evento e = eventos.get(eventId);
					
					List<MeasurementFacts> listaM = medidas.get(eventId);
					if(listaM == null) {
						listaM = new ArrayList<MeasurementFacts>();
					}
					
					m.setEventId(eventId);
					m.setEvento(e);
					
					if(arq.getCore().hasTerm(DwcTerm.measurementID)) { 
						m.setMeasurementID(r.value(DwcTerm.measurementID));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.measurementType)) { 
						m.setMeasurementType(r.value(DwcTerm.measurementType));
					}
					
					if(arq.getCore().hasTerm("measurementTypeID")) { 
						m.setMeasurementTypeID(r.value("measurementTypeID"));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.measurementUnit)) { 
						m.setMeasurementUnit(r.value(DwcTerm.measurementUnit));
					}
					
					if(arq.getCore().hasTerm("measurementUnitID")) { 
						m.setMeasurementUnitID("measurementUnitID");
					}
					
					if(arq.getCore().hasTerm(DwcTerm.measurementValue)) { 
						m.setMeasurementValue(r.value(DwcTerm.measurementValue));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.occurrenceID)) { 
						m.setOccurrenceID(r.value(DwcTerm.occurrenceID));
						Occurrence occurrence = ocorrencias.get(m.getOccurrenceID());
						m.setOccurrence(occurrence);
					}
					
					
					m = measurementFactsLocal.salvarMedida(m);
					listaM.add(m);
			    	medidas.put(eventId, listaM);
			 }
		} catch (NamingException e1) {
			log.error(e1.getMessage(), e1);
			throw new ExcecaoIntegracao(e1);
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					throw new ExcecaoIntegracao(e);
				}
			}
		}
		return medidas;  
	}
	private Map<String, Evento> montarEventos(Archive arq) throws ExcecaoIntegracao {
		CSVReader reader = null;
		Map<String, Evento> eventos = new HashMap<String, Evento>();
		try {
			EventoLocal eventoLocal = (EventoLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/EventoBean");
			 Iterator<Record> iterator = arq.getCore().iterator();
			 while (iterator.hasNext()) {
				 	Record r = iterator.next();
					Evento evento = null;
					String eventId = r.value(DwcTerm.eventID);
					evento = eventoLocal.buscarPorEventId(eventId);
					if(evento == null) {
						evento = new Evento();
					}
						
					evento.setEventID(eventId);
					
					if(arq.getCore().hasTerm(DwcTerm.samplingProtocol)) { 
						evento.setSamplingProtocol(r.value(DwcTerm.samplingProtocol));
					}
					
					if(arq.getCore().hasTerm("sampleSizeValue")) { 
						evento.setSampleSizeValue(r.value("sampleSizeValue"));
					}
					
					if(arq.getCore().hasTerm("sampleSizeUnit")) { 
						evento.setSampleSizeUnit(r.value("sampleSizeUnit"));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.eventDate)) {
						String eDateS = r.value(DwcTerm.eventDate);
						if (eDateS != null) {
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							Date data = format.parse(eDateS);
							Calendar eventDate = Calendar.getInstance();
							eventDate.setTime(data);
							evento.setEventDate(eventDate);
						}
					}
					
					if(arq.getCore().hasTerm(DwcTerm.habitat)) { 
						evento.setHabitat(r.value(DwcTerm.habitat));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.countryCode)) { 
						evento.setCountryCode(r.value(DwcTerm.countryCode));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.decimalLatitude)) { 
						String valor = r.value(DwcTerm.decimalLatitude);
						if(valor != null) {
							evento.setDecimalLatitude(new BigDecimal(valor));
						}
					}
					
					if(arq.getCore().hasTerm(DwcTerm.decimalLongitude)) { 
						String valor = r.value(DwcTerm.decimalLongitude);
						if(valor != null) {
							evento.setDecimalLongitude(new BigDecimal(valor));
						}
					}
					
					if(arq.getCore().hasTerm(DwcTerm.geodeticDatum)) { 
						evento.setGeodeticDatum(r.value(DwcTerm.geodeticDatum));
					}
					
					if(arq.getCore().hasTerm(DwcTerm.coordinateUncertaintyInMeters)) {
								
						String value = r.value(DwcTerm.coordinateUncertaintyInMeters);
						if(value != null) {
							evento.setCoordinateUncertaintyInMeters(Integer.parseInt(value));
						}
						
					}
					
					if(arq.getCore().hasTerm(DwcTerm.footprintWKT)) { 
						evento.setFootprintWKT(r.value(DwcTerm.footprintWKT));
					}
	
					evento = eventoLocal.salvarEvento(evento);
			    	eventos.put(eventId, evento);
			 }
		} catch (NamingException e1) {
			log.error(e1.getMessage(), e1);
			throw new ExcecaoIntegracao(e1);
		} catch (ParseException e) {
			log.error(e.getMessage(), e);
			throw new ExcecaoIntegracao(e);
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					throw new ExcecaoIntegracao(e);
				}
			}
		}
		return eventos;  
	}
	public void gravarSamples(Collection<Sample> samples) throws ExcecaoIntegracao {
    	try {
    		SampleBean sampleBean = (SampleBean) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/SampleBean");
			sampleBean.salvar(new ArrayList<Sample>(samples));
		} catch (NamingException e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect("Erro ao importar arquivo", null);
		}
    }
	
	/**
     * Unzip it
     * @param zipFile input zip file
     * @param output zip file output folder
	 * @throws ExcecaoIntegracao 
     */
	public void unZipIt(String zipFile, String outputFolder, String diretorio) throws ExcecaoIntegracao {

		byte[] buffer = new byte[1024];

		try {

			// create output directory is not exists
			File folder = new File(diretorio);
			if (!folder.exists()) {
				folder.mkdir();
			}

			// get the zip file content
			ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFile));
			// get the zipped file list entry
			ZipEntry ze = zis.getNextEntry();

			while (ze != null) {

				String fileName = ze.getName();
				File newFile = new File(outputFolder + File.separator + fileName);

				log.info("file unzip : " + newFile.getAbsoluteFile());

				// create all non exists folders
				// else you will hit FileNotFoundException for compressed folder
				new File(newFile.getParent()).mkdirs();

				FileOutputStream fos = new FileOutputStream(newFile);

				int len;
				while ((len = zis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}

				fos.close();
				ze = zis.getNextEntry();
			}

			zis.closeEntry();
			zis.close();

			log.info("Done");

		} catch (IOException ex) {
			log.error(ex.getMessage(), ex);
			throw new ExcecaoIntegracao(ex);
		}
	}

	public Properties getProp() throws IOException {
		if(prop == null) {
			prop = new Properties();
			prop.load(GbifUtils.class.getResourceAsStream(ARQ_TMP_PROP));
		}
		return prop;
	}

	public void setProp(Properties prop) {
		this.prop = prop;
	}
}
