package br.com.bioimportweb.gbif.api.utils;

import java.util.UUID;

import org.gbif.api.model.registry.Dataset;
import org.gbif.api.service.registry.DatasetService;

public class RegistryWsGuiceIT {

  /**
   * Retrieve dataset Pontaurus with key "b3e760d8-8dcc-468c-a23d-8e9772affe59". It is assumed dataset Pontaurus will
   * always exist in every Registry database.
   */
  public static void testGetDataset() {
    DatasetService ds = RegistryWsClientFactoryGuice.webserviceClientReadOnly().getInstance(DatasetService.class);
    Dataset dataset = ds.get(UUID.fromString("1edcfe6d-da55-4d59-b30e-468cd21f8b0b"));
    dataset.getEndpoints();
    System.out.println(dataset.getTitle());
    
  }
  
  public static void main(String ...args) {
	  testGetDataset();
  }

  
  public void testUpdateDataset() {
    DatasetService ds = RegistryWsClientFactoryGuice.webserviceClient().getInstance(DatasetService.class);
    Dataset dataset = ds.get(UUID.fromString("38b0f0f5-cac1-48e6-be85-b9f8cdd5ca93"));
    dataset.setRights("CC0");
    ds.update(dataset);
  }
  
  
  
  
}
